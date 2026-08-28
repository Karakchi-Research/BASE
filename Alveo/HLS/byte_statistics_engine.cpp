#include <ap_int.h>
#include <hls_math.h>

#define BYTE_BINS     256
#define FEATURE_DIM   278
#define WINDOW_LEN    4096                  // total bytes per packet
#define WORD_LEN      (WINDOW_LEN / 4)      // 32-bit words per packet (1024)
#define HALF_LEN      (WINDOW_LEN / 2)      // byte index midpoint (2048)

static inline ap_uint<4> popcount8(ap_uint<8> x) {
#pragma HLS INLINE
    ap_uint<4> c = x[0] + x[1] + x[2] + x[3] + x[4] + x[5] + x[6] + x[7];
    return c;
}

static inline ap_uint<32> float_to_bits(float v) {
#pragma HLS INLINE
    union { float f; unsigned int u; } cv;
    cv.f = v;
    return (ap_uint<32>)cv.u;
}

// PyXRT-side buffers are laid out identically to the old streaming version:
// `in`  = num_words 32-bit words, 4 packed bytes each (host zero-pads the
//         final partial word), matching in_bo in _run_hls_window().
// `out` = FEATURE_DIM 32-bit words, each the raw bit pattern of a float
//         (host reinterprets via .view(np.float32)), matching out_bo.
void byte_statistics_engine(
    const ap_uint<32> *in,              // global memory input,  bundle gmem0
    ap_uint<32>       *out,             // global memory output, bundle gmem1
    ap_uint<32>        num_words        // valid 32-bit words in `in`
) {
#pragma HLS INTERFACE m_axi     port=in        offset=slave bundle=gmem0 depth=WORD_LEN
#pragma HLS INTERFACE m_axi     port=out       offset=slave bundle=gmem1 depth=FEATURE_DIM
#pragma HLS INTERFACE s_axilite port=in        bundle=control
#pragma HLS INTERFACE s_axilite port=out       bundle=control
#pragma HLS INTERFACE s_axilite port=num_words bundle=control
#pragma HLS INTERFACE s_axilite port=return    bundle=control

    ap_uint<32> hist[BYTE_BINS];
#pragma HLS ARRAY_PARTITION variable=hist block factor=8 dim=1

    float feats[FEATURE_DIM];
#pragma HLS ARRAY_PARTITION variable=feats complete dim=1

    // -----------------------------------------------------------------------
    // Clear histogram
    // -----------------------------------------------------------------------
    init_hist:
    for (int i = 0; i < BYTE_BINS; ++i) {
#pragma HLS UNROLL
        hist[i] = 0;
    }

    ap_uint<32> count          = 0;
    ap_uint<32> transitions    = 0;
    ap_uint<32> zero_count     = 0;
    ap_uint<32> ff_count       = 0;
    ap_uint<32> ones_count     = 0;

    ap_uint<8>  min_byte       = 255;
    ap_uint<8>  max_byte       = 0;
    ap_uint<8>  prev_byte      = 0;
    bool        has_prev       = false;

    unsigned long long sum             = 0;
    unsigned long long sum_sq          = 0;
    unsigned long long abs_delta_sum   = 0;
    unsigned long long high_nibble_sum = 0;
    unsigned long long low_nibble_sum  = 0;

    unsigned long long chunk_sums[4];
    unsigned long long chunk_sq_sums[4];
    ap_uint<32>        chunk_counts[4];

    init_chunks:
    for (int c = 0; c < 4; ++c) {
#pragma HLS UNROLL
        chunk_sums[c]    = 0;
        chunk_sq_sums[c] = 0;
        chunk_counts[c]  = 0;
    }

    // -----------------------------------------------------------------------
    // Main processing loop.
    //
    // Loop bound is still the compile-time constant WORD_LEN, with an early
    // break once i reaches num_words -- but this is no longer a stream-hang
    // workaround. There's no TREADY/TLAST handshake on an m_axi port, so a
    // variable-bound read can't stall a DMA the way it could on the Z1.
    // The fixed bound + LOOP_TRIPCOUNT hint is kept purely so HLS has a
    // static trip count to pipeline against for scheduling/resource
    // estimation, same as any bounded-but-early-exiting HLS loop.
    // -----------------------------------------------------------------------
    process_words:
    for (int i = 0; i < WORD_LEN; ++i) {
    #pragma HLS PIPELINE II=1
    #pragma HLS LOOP_TRIPCOUNT min=1 max=WORD_LEN

        if (i >= (int)num_words) break;

        ap_uint<32> word = in[i];

        // Unpack 4 bytes from this 32-bit word.
        // UNROLL ensures all 4 bytes are processed in the same pipeline stage,
        // keeping the outer loop at II=1.
        unpack_bytes:
        for (int b = 0; b < 4; ++b) {
        #pragma HLS UNROLL
            ap_uint<8> byte = word.range(8*b + 7, 8*b);
            int byte_idx    = i * 4 + b;

            count++;
            sum    += byte;
            sum_sq += (unsigned long long)byte * byte;

            if (byte == 0)   zero_count++;
            if (byte == 255) ff_count++;
            if (byte < min_byte) min_byte = byte;
            if (byte > max_byte) max_byte = byte;

            ones_count      += popcount8(byte);
            high_nibble_sum += (byte >> 4);
            low_nibble_sum  += (byte & 0xF);

            int chunk_idx = (byte_idx * 4) / WINDOW_LEN;
            if (chunk_idx > 3) chunk_idx = 3;
            chunk_sums[chunk_idx]    += byte;
            chunk_sq_sums[chunk_idx] += (unsigned long long)byte * byte;
            chunk_counts[chunk_idx]++;

            if (has_prev) {
                if (byte != prev_byte) transitions++;
                ap_uint<8> delta = (byte > prev_byte)
                    ? (byte - prev_byte)
                    : (prev_byte - byte);
                abs_delta_sum += delta;
            }
            prev_byte = byte;
            has_prev  = true;

            hist[byte] = hist[byte] + 1;
        }
    }

    // -----------------------------------------------------------------------
    // Derived statistics (unchanged from the streaming version)
    // -----------------------------------------------------------------------
    const float N        = (count == 0) ? 1.0f : (float)(unsigned int)count;
    const float mean     = (float)(unsigned int)sum    / N;
    const float mean_sq  = (float)(unsigned int)sum_sq / N;
    const float variance = mean_sq - mean * mean;

    const float transition_rate = (count > 1)
        ? ((float)(unsigned int)transitions / (float)((unsigned int)count - 1))
        : 0.0f;
    const float zero_ratio = (float)(unsigned int)zero_count / N;
    const float ff_ratio   = (float)(unsigned int)ff_count   / N;

    const float inv_ln2 = 1.4426950408889634f;
    float entropy       = 0.0f;

    entropy_hist:
    for (int i = 0; i < BYTE_BINS; ++i) {
#pragma HLS PIPELINE II=1
        ap_uint<32> c = hist[i];
        if (c != 0) {
            float p  = (float)(unsigned int)c / N;
            float lp = hls::logf(p) * inv_ln2;
            entropy -= p * lp;
        }
    }

    const float avg_abs_delta = (count > 1)
        ? ((float)(unsigned int)abs_delta_sum / (float)((unsigned int)count - 1))
        : 0.0f;

    const float high_nibble_avg = (float)(unsigned int)high_nibble_sum / N;
    const float low_nibble_avg  = (float)(unsigned int)low_nibble_sum  / N;
    const float nibble_balance  = high_nibble_avg - low_nibble_avg;

    // log_size: use log1p(count) to match the Python CPU fallback exactly.
    const float log_size = hls::logf(1.0f + (float)(unsigned int)count);

    float chunk_means[4];
    float chunk_stds[4];

    comp_chunks:
    for (int c = 0; c < 4; ++c) {
#pragma HLS UNROLL
        if (chunk_counts[c] == 0) {
            chunk_means[c] = 0.0f;
            chunk_stds[c]  = 0.0f;
        } else {
            float chunk_N       = (float)(unsigned int)chunk_counts[c];
            float chunk_mean    = (float)(unsigned int)chunk_sums[c]    / chunk_N;
            float chunk_mean_sq = (float)(unsigned int)chunk_sq_sums[c] / chunk_N;
            float chunk_var     = chunk_mean_sq - chunk_mean * chunk_mean;
            chunk_means[c] = chunk_mean;
            chunk_stds[c]  = hls::sqrtf((chunk_var > 0.0f) ? chunk_var : 0.0f);
        }
    }

    // -----------------------------------------------------------------------
    // Pack feature vector (layout unchanged)
    // Indices 0-255:   byte histogram (normalized)
    // Indices 256-265: extended statistics
    // Indices 266-277: structural features
    // -----------------------------------------------------------------------
    hist_feats:
    for (int i = 0; i < BYTE_BINS; ++i) {
#pragma HLS PIPELINE II=1
        feats[i] = (count == 0) ? 0.0f : ((float)(unsigned int)hist[i] / N);
    }

    feats[256] = entropy;
    feats[257] = mean;
    feats[258] = hls::sqrtf((variance > 0.0f) ? variance : 0.0f);
    feats[259] = 0.0f;   // byte_skew    — computed in Python aggregation
    feats[260] = 0.0f;   // byte_kurtosis — computed in Python aggregation
    feats[261] = (float)(unsigned int)min_byte;
    feats[262] = (float)(unsigned int)max_byte;
    feats[263] = 0.0f;   // byte_median  — computed in Python aggregation
    feats[264] = zero_ratio;
    feats[265] = ff_ratio;
    feats[266] = log_size;
    feats[267] = transition_rate;
    feats[268] = avg_abs_delta;
    feats[269] = nibble_balance;
    feats[270] = chunk_means[0];
    feats[271] = chunk_means[1];
    feats[272] = chunk_means[2];
    feats[273] = chunk_means[3];
    feats[274] = chunk_stds[0];
    feats[275] = chunk_stds[1];
    feats[276] = chunk_stds[2];
    feats[277] = chunk_stds[3];

    // -----------------------------------------------------------------------
    // Write feature vector to global memory.
    // No TLAST/keep/strb -- the host already knows the output is always
    // exactly FEATURE_DIM words (that's the fixed size it allocated out_bo
    // with), so there's no end-of-transaction signal to manage here.
    // -----------------------------------------------------------------------
    write_feats:
    for (int i = 0; i < FEATURE_DIM; ++i) {
#pragma HLS PIPELINE II=1
        out[i] = float_to_bits(feats[i]);
    }
}
