#include <ap_int.h>
#include <cstdio>
#include <cmath>

#define WINDOW_LEN  4096
#define WORD_LEN    (WINDOW_LEN / 4)
#define FEATURE_DIM 278

void byte_statistics_engine(
    const ap_uint<32> *in,
    ap_uint<32>       *out,
    ap_uint<32>        num_words
);

static inline float bits_to_float(ap_uint<32> bits) {
    union { unsigned int u; float f; } cv;
    cv.u = (unsigned int)bits;
    return cv.f;
}

// Pack `actual` real bytes into 32-bit words in `buf`. Any partial trailing
// word is zero-padded in its unused high bytes, matching the host-side
// zero-padding done in _run_hls_window() before in_bo.write().
// Returns the number of words written (== num_words the kernel is called
// with).
static int fill_words(ap_uint<32> buf[WORD_LEN], const unsigned char* data, int actual) {
    int num_words_needed = (actual + 3) / 4;
    for (int i = 0; i < num_words_needed; i++) {
        ap_uint<32> word = 0;
        for (int b = 0; b < 4; b++) {
            int byte_idx = i * 4 + b;
            if (byte_idx < actual) {
                word.range(8*b + 7, 8*b) = (ap_uint<8>)data[byte_idx];
            }
        }
        buf[i] = word;
    }
    return num_words_needed;
}

// Convert the FEATURE_DIM output words into floats.
static void drain_words(const ap_uint<32> out_buf[FEATURE_DIM], float feats[FEATURE_DIM]) {
    for (int i = 0; i < FEATURE_DIM; i++) {
        feats[i] = bits_to_float(out_buf[i]);
    }
}

// Reference log1p to match the HLS core (uses logf(1+N), not logf(N))
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
        ap_uint<32> in_buf[WORD_LEN];
        ap_uint<32> out_buf[FEATURE_DIM];

        unsigned char data[WINDOW_LEN];
        for (int i = 0; i < WINDOW_LEN; i++) data[i] = (unsigned char)(i % 256);

        int nw = fill_words(in_buf, data, WINDOW_LEN);
        byte_statistics_engine(in_buf, out_buf, nw);

        float feats[FEATURE_DIM] = {0};
        drain_words(out_buf, feats);

        printf("  byte_entropy (256): %.6f (expect ~8.0)\n",  feats[256]);
        printf("  byte_mean (257)   : %.6f (expect ~127.5)\n", feats[257]);
        printf("  byte_std (258)    : %.6f (expect ~73.6)\n",  feats[258]);
        printf("  byte_min (261)    : %.6f (expect 0.0)\n",    feats[261]);
        printf("  byte_max (262)    : %.6f (expect 255.0)\n",  feats[262]);
        printf("  zero_ratio (264)  : %.6f (expect ~0.004)\n", feats[264]);
        printf("  log_size (266)    : %.6f (expect %.6f)\n",   feats[266], ref_log_size(WINDOW_LEN));

        int sub_fail = 0;
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
    // Verifies num_words correctly bounds the loop for a sub-window input.
    // This used to be the DMA-hang regression test (break-on-TLAST); with
    // m_axi there's no handshake to hang, so this now just confirms the
    // early-exit-on-num_words logic still produces correct stats for a
    // partial window.
    // -----------------------------------------------------------------------
    {
        printf("--- Test 2: short packet (64 bytes) ---\n");
        ap_uint<32> in_buf[WORD_LEN];
        ap_uint<32> out_buf[FEATURE_DIM];

        const int actual = 64;
        unsigned char data[actual];
        for (int i = 0; i < actual; i++) data[i] = (unsigned char)(i * 3 % 256);

        int nw = fill_words(in_buf, data, actual);
        byte_statistics_engine(in_buf, out_buf, nw);

        float feats[FEATURE_DIM] = {0};
        drain_words(out_buf, feats);

        printf("  byte_entropy (256): %.6f\n",  feats[256]);
        printf("  byte_mean (257)   : %.6f\n",  feats[257]);
        printf("  log_size (266)    : %.6f (expect %.6f)\n",
               feats[266], ref_log_size(actual));

        int sub_fail = 0;
        if (fabsf(feats[266] - ref_log_size(actual)) > 0.01f)
            { printf("FAIL: log_size wrong (short packet)\n"); sub_fail++; }
        if (sub_fail == 0) printf("PASS Test 2\n\n"); else { fail += sub_fail; printf("\n"); }
    }

    // -----------------------------------------------------------------------
    // Test 3: All-zero input (256 bytes)
    // -----------------------------------------------------------------------
    {
        printf("--- Test 3: all-zero input (256 bytes) ---\n");
        ap_uint<32> in_buf[WORD_LEN];
        ap_uint<32> out_buf[FEATURE_DIM];

        const int actual = 256;
        unsigned char data[actual];
        for (int i = 0; i < actual; i++) data[i] = 0;

        int nw = fill_words(in_buf, data, actual);
        byte_statistics_engine(in_buf, out_buf, nw);

        float feats[FEATURE_DIM] = {0};
        drain_words(out_buf, feats);

        printf("  byte_entropy (256): %.6f (expect 0.0)\n",  feats[256]);
        printf("  byte_mean (257)   : %.6f (expect 0.0)\n",  feats[257]);
        printf("  byte_std (258)    : %.6f (expect 0.0)\n",  feats[258]);
        printf("  zero_ratio (264)  : %.6f (expect 1.0)\n",  feats[264]);
        printf("  byte_min (261)    : %.6f (expect 0.0)\n",  feats[261]);
        printf("  byte_max (262)    : %.6f (expect 0.0)\n",  feats[262]);

        int sub_fail = 0;
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
        ap_uint<32> in_buf[WORD_LEN];
        ap_uint<32> out_buf[FEATURE_DIM];

        const int actual = 256;
        unsigned char data[actual];
        for (int i = 0; i < actual; i++) data[i] = (unsigned char)i;

        int nw = fill_words(in_buf, data, actual);
        byte_statistics_engine(in_buf, out_buf, nw);

        float feats[FEATURE_DIM] = {0};
        drain_words(out_buf, feats);

        printf("  byte_entropy (256): %.6f (expect ~8.0)\n", feats[256]);
        printf("  byte_mean (257)   : %.6f (expect ~127.5)\n", feats[257]);
        printf("  log_size (266)    : %.6f (expect %.6f)\n",
               feats[266], ref_log_size(actual));

        int sub_fail = 0;
        if (fabsf(feats[256] - 8.0f) > 0.05f)       { printf("FAIL: entropy wrong\n");    sub_fail++; }
        if (fabsf(feats[257] - 127.5f) > 0.5f)      { printf("FAIL: mean wrong\n");       sub_fail++; }
        if (fabsf(feats[266] - ref_log_size(actual)) > 0.01f)
                                                     { printf("FAIL: log_size wrong\n");   sub_fail++; }
        if (sub_fail == 0) printf("PASS Test 4\n\n"); else { fail += sub_fail; printf("\n"); }
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
