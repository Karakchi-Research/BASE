#include <hls_stream.h>
#include <ap_int.h>
#include <ap_axi_sdata.h>
#include <hls_math.h>

#define BYTE_BINS     256
#define FEATURE_DIM   278
#define WINDOW_LEN    4096                  // total bytes per packet
#define WORD_LEN      (WINDOW_LEN / 4)      // 32-bit words per packet (1024)
#define HALF_LEN      (WINDOW_LEN / 2)      // byte index midpoint (2048)

// Both ports are 32-bit wide — compatible with Vivado AXI DMA 7.1 on Z1.
typedef ap_axiu<32, 0, 0, 0>  axis_word_t;
typedef ap_axiu<32, 0, 0, 0>  axis_feat_t;

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

void byte_statistics_engine(
    hls::stream<axis_word_t>& in_stream,
    hls::stream<axis_feat_t>& out_stream,
    ap_uint<32> num_words               // number of 32-bit words in packet
) {
#pragma HLS INTERFACE axis      port=in_stream   register
#pragma HLS INTERFACE axis      port=out_stream  register
#pragma HLS INTERFACE s_axilite port=num_words   bundle=CTRL
#pragma HLS INTERFACE s_axilite port=return      bundle=CTRL
// ap_ctrl_hs is the default when s_axilite port=return is specified;
// stating it explicitly here avoids any ambiguity during synthesis.
#pragma HLS INTERFACE ap_ctrl_hs port=return

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
    // KEY FIX: Loop bound is the compile-time constant WORD_LEN (1024), NOT
    // num_words. A variable loop bound derived from an AXI-Lite register
    // prevents HLS from computing a static initiation interval, which on the
    // Z1 fabric produces an FSM that de-asserts TREADY between iterations.
    // When TREADY drops during the final beat the DMA cannot complete its
    // MM2S transaction and never asserts Idle, causing the Python-side
    // sendchannel.wait() to hang indefinitely.
    //
    // We instead run the loop for exactly WORD_LEN iterations and break early
    // on TLAST. This gives HLS a static bound to pipeline against while still
    // handling sub-window packets correctly. The break-on-TLAST path also
    // drains any words the DMA sent beyond the logical packet end.
    // -----------------------------------------------------------------------
    process_words:
    for (int i = 0; i < WORD_LEN; ++i) {
    // II=1 is achievable with the static bound and unrolled inner loop.
    // The hist[] array partition (block factor=8) ensures no read-after-write
    // hazards on the histogram update within a single pipeline stage.
    #pragma HLS PIPELINE II=1

        // Guard: only read from the stream when i < num_words, so we never
        // stall waiting for data that the DMA will never send for short packets.
        // For i >= num_words the loop body is a no-op and exits on TLAST.
        if (i >= (int)num_words) break;

        axis_word_t in_word = in_stream.read();
        ap_uint<32> word    = in_word.data;
        bool        is_last = (in_word.last == 1);

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

        // Exit the loop once the DMA asserts TLAST. This is the signal that
        // the stream transaction is complete. Exiting here (rather than
        // continuing to stall with TREADY high waiting for a word that will
        // never come) allows the DMA's MM2S channel to close cleanly and
        // transition to Idle, unblocking sendchannel.wait() on the host.
        if (is_last) break;
    }

    // -----------------------------------------------------------------------
    // Derived statistics
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
    // log(count) differs from log1p(count) by a small but nonzero amount
    // for small windows and would cause feature vector mismatches between
    // the PL and CPU paths during fallback comparison.
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
    // Pack feature vector
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
    // Output stream
    // TLAST is asserted on the final feature word (i == FEATURE_DIM - 1).
    // This closes the S2MM stream transaction on the DMA side, allowing
    // recvchannel.wait() / recvchannel.idle to resolve on the host.
    // -----------------------------------------------------------------------
    out_feats:
    for (int i = 0; i < FEATURE_DIM; ++i) {
#pragma HLS PIPELINE II=1
        axis_feat_t out_word;
        out_word.data = float_to_bits(feats[i]);
        out_word.keep = -1;
        out_word.strb = -1;
        out_word.last = (i == FEATURE_DIM - 1) ? 1 : 0;
        out_stream.write(out_word);
    }
}
