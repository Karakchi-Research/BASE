#include <hls_stream.h>
#include <ap_axi_sdata.h>
#include <ap_int.h>
#include <cstdio>
#include <cmath>

typedef ap_axiu<32, 0, 0, 0>  axis_word_t;
typedef ap_axiu<32, 0, 0, 0>  axis_feat_t;

#define WINDOW_LEN  4096
#define WORD_LEN    (WINDOW_LEN / 4)
#define FEATURE_DIM 278

void byte_statistics_engine(
    hls::stream<axis_word_t>& in_stream,
    hls::stream<axis_feat_t>& out_stream,
    ap_uint<32> num_words
);

static inline float bits_to_float(ap_uint<32> bits) {
    union { unsigned int u; float f; } cv;
    cv.u = (unsigned int)bits;
    return cv.f;
}

// Push `actual` real bytes packed into 32-bit words.
// TLAST is asserted on the last word that contains actual data (not on the
// first word that passes `actual` — the fixed-bound loop in the core exits
// on TLAST, so TLAST must land on the final word containing real data).
static void fill_stream(hls::stream<axis_word_t>& s,
                        const unsigned char* data, int actual)
{
    int num_words_needed = (actual + 3) / 4;
    for (int i = 0; i < num_words_needed; i++) {
        axis_word_t v;
        ap_uint<32> word = 0;
        for (int b = 0; b < 4; b++) {
            int byte_idx = i * 4 + b;
            if (byte_idx < actual) {
                word.range(8*b + 7, 8*b) = (ap_uint<8>)data[byte_idx];
            }
        }
        v.data = word;
        // TLAST on the last word (i == num_words_needed - 1)
        v.last = (i == num_words_needed - 1) ? 1 : 0;
        v.keep = -1;
        v.strb = -1;
        s.write(v);
    }
}

// Drain output stream into feats[FEATURE_DIM], return word count.
static int drain_stream(hls::stream<axis_feat_t>& s, float feats[FEATURE_DIM])
{
    int count = 0;
    while (!s.empty()) {
        axis_feat_t out = s.read();
        if (count < FEATURE_DIM)
            feats[count] = bits_to_float(out.data);
        count++;
    }
    return count;
}

// Reference log1p to match the fixed HLS core (uses logf(1+N), not logf(N))
static float ref_log_size(int n) {
    return logf(1.0f + (float)n);
}

int main() {
    int fail = 0;

    // -----------------------------------------------------------------------
    // Test 1: Full window (4096 bytes, ramp i%256)
    // -----------------------------------------------------------------------
    {
        printf("--- Test 1: full window ramp (4096 bytes) ---\n");
        hls::stream<axis_word_t> in_s;
        hls::stream<axis_feat_t> out_s;

        unsigned char data[WINDOW_LEN];
        for (int i = 0; i < WINDOW_LEN; i++) data[i] = (unsigned char)(i % 256);

        fill_stream(in_s, data, WINDOW_LEN);
        byte_statistics_engine(in_s, out_s, WORD_LEN);

        float feats[FEATURE_DIM] = {0};
        int n = drain_stream(out_s, feats);

        printf("  word count        : %d (expect %d)\n", n, FEATURE_DIM);
        printf("  byte_entropy (256): %.6f (expect ~8.0)\n",  feats[256]);
        printf("  byte_mean (257)   : %.6f (expect ~127.5)\n", feats[257]);
        printf("  byte_std (258)    : %.6f (expect ~73.6)\n",  feats[258]);
        printf("  byte_min (261)    : %.6f (expect 0.0)\n",    feats[261]);
        printf("  byte_max (262)    : %.6f (expect 255.0)\n",  feats[262]);
        printf("  zero_ratio (264)  : %.6f (expect ~0.004)\n", feats[264]);
        printf("  log_size (266)    : %.6f (expect %.6f)\n",   feats[266], ref_log_size(WINDOW_LEN));

        int sub_fail = 0;
        if (n != FEATURE_DIM)                       { printf("FAIL: wrong word count\n");     sub_fail++; }
        if (fabsf(feats[256] - 8.0f) > 0.05f)       { printf("FAIL: entropy wrong\n");        sub_fail++; }
        if (fabsf(feats[257] - 127.5f) > 0.5f)      { printf("FAIL: mean wrong\n");           sub_fail++; }
        if (fabsf(feats[261] - 0.0f) > 1e-5f)       { printf("FAIL: min wrong\n");            sub_fail++; }
        if (fabsf(feats[262] - 255.0f) > 1e-5f)     { printf("FAIL: max wrong\n");            sub_fail++; }
        if (fabsf(feats[266] - ref_log_size(WINDOW_LEN)) > 0.01f)
                                                     { printf("FAIL: log_size wrong\n");       sub_fail++; }
        if (sub_fail == 0) printf("PASS Test 1\n\n"); else { fail += sub_fail; printf("\n"); }
    }

    // -----------------------------------------------------------------------
    // Test 2: Short packet (64 bytes)
    // Verifies that the break-on-TLAST path works and the core does not stall
    // waiting for the remaining (WORD_LEN - 16) words that the DMA will never
    // send. On hardware this is the path that was causing the Z1 hang.
    // -----------------------------------------------------------------------
    {
        printf("--- Test 2: short packet (64 bytes) ---\n");
        hls::stream<axis_word_t> in_s;
        hls::stream<axis_feat_t> out_s;

        const int actual = 64;
        unsigned char data[actual];
        for (int i = 0; i < actual; i++) data[i] = (unsigned char)(i * 3 % 256);

        fill_stream(in_s, data, actual);
        byte_statistics_engine(in_s, out_s, (actual + 3) / 4);

        float feats[FEATURE_DIM] = {0};
        int n = drain_stream(out_s, feats);

        printf("  word count        : %d (expect %d)\n", n, FEATURE_DIM);
        printf("  byte_entropy (256): %.6f\n",  feats[256]);
        printf("  byte_mean (257)   : %.6f\n",  feats[257]);
        printf("  log_size (266)    : %.6f (expect %.6f)\n",
               feats[266], ref_log_size(actual));

        int sub_fail = 0;
        if (n != FEATURE_DIM)
            { printf("FAIL: wrong word count\n"); sub_fail++; }
        if (fabsf(feats[266] - ref_log_size(actual)) > 0.01f)
            { printf("FAIL: log_size wrong (short packet)\n"); sub_fail++; }
        // Verify stream was not left with unconsumed words (would mean
        // break-on-TLAST fired correctly)
        if (!in_s.empty())
            { printf("FAIL: input stream not fully consumed\n"); sub_fail++; }
        if (sub_fail == 0) printf("PASS Test 2\n\n"); else { fail += sub_fail; printf("\n"); }
    }

    // -----------------------------------------------------------------------
    // Test 3: All-zero input (256 bytes)
    // -----------------------------------------------------------------------
    {
        printf("--- Test 3: all-zero input (256 bytes) ---\n");
        hls::stream<axis_word_t> in_s;
        hls::stream<axis_feat_t> out_s;

        const int actual = 256;
        unsigned char data[actual];
        for (int i = 0; i < actual; i++) data[i] = 0;

        fill_stream(in_s, data, actual);
        byte_statistics_engine(in_s, out_s, (actual + 3) / 4);

        float feats[FEATURE_DIM] = {0};
        int n = drain_stream(out_s, feats);

        printf("  word count        : %d (expect %d)\n", n, FEATURE_DIM);
        printf("  byte_entropy (256): %.6f (expect 0.0)\n",  feats[256]);
        printf("  byte_mean (257)   : %.6f (expect 0.0)\n",  feats[257]);
        printf("  byte_std (258)    : %.6f (expect 0.0)\n",  feats[258]);
        printf("  zero_ratio (264)  : %.6f (expect 1.0)\n",  feats[264]);
        printf("  byte_min (261)    : %.6f (expect 0.0)\n",  feats[261]);
        printf("  byte_max (262)    : %.6f (expect 0.0)\n",  feats[262]);

        int sub_fail = 0;
        if (n != FEATURE_DIM)                  { printf("FAIL: wrong word count\n");  sub_fail++; }
        if (fabsf(feats[256]) > 1e-5f)         { printf("FAIL: entropy wrong\n");     sub_fail++; }
        if (fabsf(feats[257]) > 1e-5f)         { printf("FAIL: mean wrong\n");        sub_fail++; }
        if (fabsf(feats[258]) > 1e-5f)         { printf("FAIL: std wrong\n");         sub_fail++; }
        if (fabsf(feats[264] - 1.0f) > 1e-5f) { printf("FAIL: zero_ratio wrong\n");  sub_fail++; }
        if (fabsf(feats[261]) > 1e-5f)         { printf("FAIL: min wrong\n");         sub_fail++; }
        if (fabsf(feats[262]) > 1e-5f)         { printf("FAIL: max wrong\n");         sub_fail++; }
        if (sub_fail == 0) printf("PASS Test 3\n\n"); else { fail += sub_fail; printf("\n"); }
    }

    // -----------------------------------------------------------------------
    // Test 4: Uniform distribution (256 bytes, one of each value 0-255)
    // -----------------------------------------------------------------------
    {
        printf("--- Test 4: uniform distribution (256 bytes) ---\n");
        hls::stream<axis_word_t> in_s;
        hls::stream<axis_feat_t> out_s;

        const int actual = 256;
        unsigned char data[actual];
        for (int i = 0; i < actual; i++) data[i] = (unsigned char)i;

        fill_stream(in_s, data, actual);
        byte_statistics_engine(in_s, out_s, (actual + 3) / 4);

        float feats[FEATURE_DIM] = {0};
        int n = drain_stream(out_s, feats);

        printf("  word count        : %d (expect %d)\n", n, FEATURE_DIM);
        printf("  byte_entropy (256): %.6f (expect ~8.0)\n", feats[256]);
        printf("  byte_mean (257)   : %.6f (expect ~127.5)\n", feats[257]);
        printf("  log_size (266)    : %.6f (expect %.6f)\n",
               feats[266], ref_log_size(actual));

        int sub_fail = 0;
        if (n != FEATURE_DIM)                       { printf("FAIL: wrong word count\n");  sub_fail++; }
        if (fabsf(feats[256] - 8.0f) > 0.05f)       { printf("FAIL: entropy wrong\n");    sub_fail++; }
        if (fabsf(feats[257] - 127.5f) > 0.5f)      { printf("FAIL: mean wrong\n");       sub_fail++; }
        if (fabsf(feats[266] - ref_log_size(actual)) > 0.01f)
                                                     { printf("FAIL: log_size wrong\n");   sub_fail++; }
        if (sub_fail == 0) printf("PASS Test 4\n\n"); else { fail += sub_fail; printf("\n"); }
    }

    // -----------------------------------------------------------------------
    // Test 5: TLAST placement verification
    // Sends exactly WORD_LEN words with TLAST on the final word.
    // Verifies the output stream also terminates with TLAST on word 277.
    // -----------------------------------------------------------------------
    {
        printf("--- Test 5: TLAST placement on output stream ---\n");
        hls::stream<axis_word_t> in_s;
        hls::stream<axis_feat_t> out_s;

        unsigned char data[WINDOW_LEN];
        for (int i = 0; i < WINDOW_LEN; i++) data[i] = (unsigned char)(i & 0xFF);

        fill_stream(in_s, data, WINDOW_LEN);
        byte_statistics_engine(in_s, out_s, WORD_LEN);

        int tlast_idx = -1;
        int count = 0;
        while (!out_s.empty()) {
            axis_feat_t w = out_s.read();
            if (w.last) tlast_idx = count;
            count++;
        }

        printf("  output words      : %d (expect %d)\n", count, FEATURE_DIM);
        printf("  TLAST at index    : %d (expect %d)\n", tlast_idx, FEATURE_DIM - 1);

        int sub_fail = 0;
        if (count != FEATURE_DIM)           { printf("FAIL: wrong output word count\n"); sub_fail++; }
        if (tlast_idx != FEATURE_DIM - 1)   { printf("FAIL: TLAST at wrong index\n");   sub_fail++; }
        if (sub_fail == 0) printf("PASS Test 5\n\n"); else { fail += sub_fail; printf("\n"); }
    }

    // -----------------------------------------------------------------------
    // Summary
    // -----------------------------------------------------------------------
    if (fail == 0) {
        printf("All tests PASSED\n");
        return 0;
    } else {
        printf("%d test(s) FAILED\n", fail);
        return 1;
    }
}
