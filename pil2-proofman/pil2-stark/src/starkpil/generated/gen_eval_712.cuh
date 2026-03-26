// Auto-generated expression evaluator - matches load__() semantics exactly
// Q expressions: domainExtended=true always, type 1 goes through aux_trace

// Fingerprint: 54872b67  nOps=510 nTemp1=5 nTemp3=5
#define GENERATED_EVAL_NOPS_54872b67 510
#define GENERATED_EVAL_NTEMP1_54872b67 5
#define GENERATED_EVAL_NTEMP3_54872b67 5

template<bool IsCyclic>
__device__ __forceinline__ void eval_expr_54872b67(
    const StepsParams* __restrict__ dParams,
    const DeviceArguments* __restrict__ dArgs,
    const ExpsArguments* __restrict__ dExpsArgs,
    Goldilocks::Element **expressions_params,
    uint32_t bufferCommitsSize, uint64_t row)
{
    const uint64_t domainSize = dExpsArgs->domainSize;
    const uint64_t r = row + threadIdx.x;
    const uint64_t chunkBase = row;

    // stride[0] = -2
    const int64_t stride_0 = dExpsArgs->nextStridesExps[0];
    uint64_t logicalRow_0;
    // stride[1] = 0
    const int64_t stride_1 = dExpsArgs->nextStridesExps[1];
    uint64_t logicalRow_1;
    // stride[2] = 2
    const int64_t stride_2 = dExpsArgs->nextStridesExps[2];
    uint64_t logicalRow_2;
    if constexpr (IsCyclic) {
        logicalRow_0 = (r + stride_0) % domainSize;
        logicalRow_1 = (r + stride_1) % domainSize;
        logicalRow_2 = (r + stride_2) % domainSize;
    } else {
        logicalRow_0 = r + stride_0;
        logicalRow_1 = r + stride_1;
        logicalRow_2 = r + stride_2;
    }

    const bool usePack256_0 = false; // stride=-2 != 0
    const bool usePack256_1 = !IsCyclic && blockDim.x == TILE_HEIGHT;
    const bool usePack256_2 = false; // stride=2 != 0

    const uint64_t nCols_0 = dArgs->mapSectionsN[0];
    const uint64_t nCols_1 = dArgs->mapSectionsN[1];
    const uint64_t nCols_2 = dArgs->mapSectionsN[2];

    // Register-resident temporaries: 5 tmp1 + 15 tmp3 slots
    gl64_t tmp1_0 = gl64_t(uint64_t(0));
    gl64_t tmp1_1 = gl64_t(uint64_t(0));
    gl64_t tmp1_2 = gl64_t(uint64_t(0));
    gl64_t tmp1_3 = gl64_t(uint64_t(0));
    gl64_t tmp1_4 = gl64_t(uint64_t(0));
    gl64_t tmp3_0 = gl64_t(uint64_t(0));
    gl64_t tmp3_1 = gl64_t(uint64_t(0));
    gl64_t tmp3_2 = gl64_t(uint64_t(0));
    gl64_t tmp3_3 = gl64_t(uint64_t(0));
    gl64_t tmp3_4 = gl64_t(uint64_t(0));
    gl64_t tmp3_5 = gl64_t(uint64_t(0));
    gl64_t tmp3_6 = gl64_t(uint64_t(0));
    gl64_t tmp3_7 = gl64_t(uint64_t(0));
    gl64_t tmp3_8 = gl64_t(uint64_t(0));
    gl64_t tmp3_9 = gl64_t(uint64_t(0));
    gl64_t tmp3_10 = gl64_t(uint64_t(0));
    gl64_t tmp3_11 = gl64_t(uint64_t(0));
    gl64_t tmp3_12 = gl64_t(uint64_t(0));
    gl64_t tmp3_13 = gl64_t(uint64_t(0));
    gl64_t tmp3_14 = gl64_t(uint64_t(0));

    // Op 0: dim1x1 sub
    gl64_t s0_0 = *(gl64_t*)&expressions_params[9][0];
    gl64_t s1_0 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_0 - s1_0;
    // Op 1: dim1x1 mul
    gl64_t s1_1 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = tmp1_0 * s1_1;
    // Op 2: dim3x1 mul
    gl64_t s0_2_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s0_2_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s0_2_2 = *(gl64_t*)&expressions_params[13][6+2];
    tmp3_0 = s0_2_0 * tmp1_0; tmp3_1 = s0_2_1 * tmp1_0; tmp3_2 = s0_2_2 * tmp1_0;
    // Op 3: dim1x1 sub
    gl64_t s0_3 = *(gl64_t*)&expressions_params[9][0];
    gl64_t s1_3 = *(gl64_t*)&expressions_params[10][6];
    tmp1_0 = s0_3 - s1_3;
    // Op 4: dim1x1 mul
    gl64_t s1_4 = *(gl64_t*)&expressions_params[10][6];
    tmp1_0 = tmp1_0 * s1_4;
    // Op 5: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 6: dim3x3 mul
    gl64_t s1_6_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_6_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_6_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA6 = (tmp3_0 + tmp3_1) * (s1_6_0 + s1_6_1);
    gl64_t kB6 = (tmp3_0 + tmp3_2) * (s1_6_0 + s1_6_2);
    gl64_t kC6 = (tmp3_1 + tmp3_2) * (s1_6_1 + s1_6_2);
    gl64_t kD6 = tmp3_0 * s1_6_0;
    gl64_t kE6 = tmp3_1 * s1_6_1;
    gl64_t kF6 = tmp3_2 * s1_6_2;
    gl64_t kG6 = kD6 - kE6;
    tmp3_0 = (kC6 + kG6) - kF6;
    tmp3_1 = ((((kA6 + kC6) - kE6) - kE6) - kD6);
    tmp3_2 = kB6 - kG6;
    // Op 7: dim1x1 sub
    gl64_t s0_7 = *(gl64_t*)&expressions_params[9][0];
    gl64_t s1_7 = *(gl64_t*)&expressions_params[10][11];
    tmp1_0 = s0_7 - s1_7;
    // Op 8: dim1x1 mul
    gl64_t s1_8 = *(gl64_t*)&expressions_params[10][11];
    tmp1_0 = tmp1_0 * s1_8;
    // Op 9: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 10: dim3x3 mul
    gl64_t s1_10_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_10_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_10_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA10 = (tmp3_0 + tmp3_1) * (s1_10_0 + s1_10_1);
    gl64_t kB10 = (tmp3_0 + tmp3_2) * (s1_10_0 + s1_10_2);
    gl64_t kC10 = (tmp3_1 + tmp3_2) * (s1_10_1 + s1_10_2);
    gl64_t kD10 = tmp3_0 * s1_10_0;
    gl64_t kE10 = tmp3_1 * s1_10_1;
    gl64_t kF10 = tmp3_2 * s1_10_2;
    gl64_t kG10 = kD10 - kE10;
    tmp3_0 = (kC10 + kG10) - kF10;
    tmp3_1 = ((((kA10 + kC10) - kE10) - kE10) - kD10);
    tmp3_2 = kB10 - kG10;
    // Op 11: dim1x1 sub_swap
    gl64_t s0_11 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_11 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_11 - s0_11;
    // Op 12: dim1x1 mul
    gl64_t s0_12 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    tmp1_0 = s0_12 * tmp1_0;
    // Op 13: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 14: dim3x3 mul
    gl64_t s1_14_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_14_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_14_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA14 = (tmp3_0 + tmp3_1) * (s1_14_0 + s1_14_1);
    gl64_t kB14 = (tmp3_0 + tmp3_2) * (s1_14_0 + s1_14_2);
    gl64_t kC14 = (tmp3_1 + tmp3_2) * (s1_14_1 + s1_14_2);
    gl64_t kD14 = tmp3_0 * s1_14_0;
    gl64_t kE14 = tmp3_1 * s1_14_1;
    gl64_t kF14 = tmp3_2 * s1_14_2;
    gl64_t kG14 = kD14 - kE14;
    tmp3_0 = (kC14 + kG14) - kF14;
    tmp3_1 = ((((kA14 + kC14) - kE14) - kE14) - kD14);
    tmp3_2 = kB14 - kG14;
    // Op 15: dim1x1 sub_swap
    gl64_t s0_15 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 0, domainSize, nCols_1))];
    gl64_t s1_15 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s1_15 - s0_15;
    // Op 16: dim1x1 mul
    gl64_t s0_16 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_0)];
    tmp1_0 = s0_16 * tmp1_0;
    // Op 17: dim1x1 add
    gl64_t s0_17 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 0, domainSize, nCols_1))];
    tmp1_0 = s0_17 + tmp1_0;
    // Op 18: dim1x1 sub
    gl64_t s0_18 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 1, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 1, domainSize, nCols_1))];
    tmp1_0 = s0_18 - tmp1_0;
    // Op 19: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 20: dim3x3 mul
    gl64_t s1_20_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_20_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_20_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA20 = (tmp3_0 + tmp3_1) * (s1_20_0 + s1_20_1);
    gl64_t kB20 = (tmp3_0 + tmp3_2) * (s1_20_0 + s1_20_2);
    gl64_t kC20 = (tmp3_1 + tmp3_2) * (s1_20_1 + s1_20_2);
    gl64_t kD20 = tmp3_0 * s1_20_0;
    gl64_t kE20 = tmp3_1 * s1_20_1;
    gl64_t kF20 = tmp3_2 * s1_20_2;
    gl64_t kG20 = kD20 - kE20;
    tmp3_0 = (kC20 + kG20) - kF20;
    tmp3_1 = ((((kA20 + kC20) - kE20) - kE20) - kD20);
    tmp3_2 = kB20 - kG20;
    // Op 21: dim1x1 sub_swap
    gl64_t s0_21 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    gl64_t s1_21 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_21 - s0_21;
    // Op 22: dim1x1 mul
    gl64_t s0_22 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    tmp1_0 = s0_22 * tmp1_0;
    // Op 23: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 24: dim3x3 mul
    gl64_t s1_24_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_24_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_24_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA24 = (tmp3_0 + tmp3_1) * (s1_24_0 + s1_24_1);
    gl64_t kB24 = (tmp3_0 + tmp3_2) * (s1_24_0 + s1_24_2);
    gl64_t kC24 = (tmp3_1 + tmp3_2) * (s1_24_1 + s1_24_2);
    gl64_t kD24 = tmp3_0 * s1_24_0;
    gl64_t kE24 = tmp3_1 * s1_24_1;
    gl64_t kF24 = tmp3_2 * s1_24_2;
    gl64_t kG24 = kD24 - kE24;
    tmp3_0 = (kC24 + kG24) - kF24;
    tmp3_1 = ((((kA24 + kC24) - kE24) - kE24) - kD24);
    tmp3_2 = kB24 - kG24;
    // Op 25: dim1x1 sub_swap
    gl64_t s0_25 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    gl64_t s1_25 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_25 - s0_25;
    // Op 26: dim1x1 mul
    gl64_t s0_26 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    tmp1_0 = s0_26 * tmp1_0;
    // Op 27: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 28: dim3x3 mul
    gl64_t s1_28_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_28_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_28_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA28 = (tmp3_0 + tmp3_1) * (s1_28_0 + s1_28_1);
    gl64_t kB28 = (tmp3_0 + tmp3_2) * (s1_28_0 + s1_28_2);
    gl64_t kC28 = (tmp3_1 + tmp3_2) * (s1_28_1 + s1_28_2);
    gl64_t kD28 = tmp3_0 * s1_28_0;
    gl64_t kE28 = tmp3_1 * s1_28_1;
    gl64_t kF28 = tmp3_2 * s1_28_2;
    gl64_t kG28 = kD28 - kE28;
    tmp3_0 = (kC28 + kG28) - kF28;
    tmp3_1 = ((((kA28 + kC28) - kE28) - kE28) - kD28);
    tmp3_2 = kB28 - kG28;
    // Op 29: dim1x1 sub_swap
    gl64_t s0_29 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    gl64_t s1_29 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_29 - s0_29;
    // Op 30: dim1x1 mul
    gl64_t s0_30 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    tmp1_0 = s0_30 * tmp1_0;
    // Op 31: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 32: dim3x3 mul
    gl64_t s1_32_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_32_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_32_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA32 = (tmp3_0 + tmp3_1) * (s1_32_0 + s1_32_1);
    gl64_t kB32 = (tmp3_0 + tmp3_2) * (s1_32_0 + s1_32_2);
    gl64_t kC32 = (tmp3_1 + tmp3_2) * (s1_32_1 + s1_32_2);
    gl64_t kD32 = tmp3_0 * s1_32_0;
    gl64_t kE32 = tmp3_1 * s1_32_1;
    gl64_t kF32 = tmp3_2 * s1_32_2;
    gl64_t kG32 = kD32 - kE32;
    tmp3_0 = (kC32 + kG32) - kF32;
    tmp3_1 = ((((kA32 + kC32) - kE32) - kE32) - kD32);
    tmp3_2 = kB32 - kG32;
    // Op 33: dim1x1 sub_swap
    gl64_t s0_33 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    gl64_t s1_33 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_33 - s0_33;
    // Op 34: dim1x1 mul
    gl64_t s0_34 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    tmp1_0 = s0_34 * tmp1_0;
    // Op 35: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 36: dim3x3 mul
    gl64_t s1_36_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_36_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_36_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA36 = (tmp3_0 + tmp3_1) * (s1_36_0 + s1_36_1);
    gl64_t kB36 = (tmp3_0 + tmp3_2) * (s1_36_0 + s1_36_2);
    gl64_t kC36 = (tmp3_1 + tmp3_2) * (s1_36_1 + s1_36_2);
    gl64_t kD36 = tmp3_0 * s1_36_0;
    gl64_t kE36 = tmp3_1 * s1_36_1;
    gl64_t kF36 = tmp3_2 * s1_36_2;
    gl64_t kG36 = kD36 - kE36;
    tmp3_0 = (kC36 + kG36) - kF36;
    tmp3_1 = ((((kA36 + kC36) - kE36) - kE36) - kD36);
    tmp3_2 = kB36 - kG36;
    // Op 37: dim1x1 sub_swap
    gl64_t s0_37 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    gl64_t s1_37 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_37 - s0_37;
    // Op 38: dim1x1 mul
    gl64_t s0_38 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    tmp1_0 = s0_38 * tmp1_0;
    // Op 39: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 40: dim3x3 mul
    gl64_t s1_40_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_40_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_40_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA40 = (tmp3_0 + tmp3_1) * (s1_40_0 + s1_40_1);
    gl64_t kB40 = (tmp3_0 + tmp3_2) * (s1_40_0 + s1_40_2);
    gl64_t kC40 = (tmp3_1 + tmp3_2) * (s1_40_1 + s1_40_2);
    gl64_t kD40 = tmp3_0 * s1_40_0;
    gl64_t kE40 = tmp3_1 * s1_40_1;
    gl64_t kF40 = tmp3_2 * s1_40_2;
    gl64_t kG40 = kD40 - kE40;
    tmp3_0 = (kC40 + kG40) - kF40;
    tmp3_1 = ((((kA40 + kC40) - kE40) - kE40) - kD40);
    tmp3_2 = kB40 - kG40;
    // Op 41: dim1x1 sub_swap
    gl64_t s0_41 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    gl64_t s1_41 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_41 - s0_41;
    // Op 42: dim1x1 mul
    gl64_t s0_42 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    tmp1_0 = s0_42 * tmp1_0;
    // Op 43: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 44: dim3x3 mul
    gl64_t s1_44_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_44_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_44_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA44 = (tmp3_0 + tmp3_1) * (s1_44_0 + s1_44_1);
    gl64_t kB44 = (tmp3_0 + tmp3_2) * (s1_44_0 + s1_44_2);
    gl64_t kC44 = (tmp3_1 + tmp3_2) * (s1_44_1 + s1_44_2);
    gl64_t kD44 = tmp3_0 * s1_44_0;
    gl64_t kE44 = tmp3_1 * s1_44_1;
    gl64_t kF44 = tmp3_2 * s1_44_2;
    gl64_t kG44 = kD44 - kE44;
    tmp3_0 = (kC44 + kG44) - kF44;
    tmp3_1 = ((((kA44 + kC44) - kE44) - kE44) - kD44);
    tmp3_2 = kB44 - kG44;
    // Op 45: dim1x1 sub_swap
    gl64_t s0_45 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    gl64_t s1_45 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_45 - s0_45;
    // Op 46: dim1x1 mul
    gl64_t s0_46 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    tmp1_0 = s0_46 * tmp1_0;
    // Op 47: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 48: dim3x3 mul
    gl64_t s1_48_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_48_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_48_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA48 = (tmp3_0 + tmp3_1) * (s1_48_0 + s1_48_1);
    gl64_t kB48 = (tmp3_0 + tmp3_2) * (s1_48_0 + s1_48_2);
    gl64_t kC48 = (tmp3_1 + tmp3_2) * (s1_48_1 + s1_48_2);
    gl64_t kD48 = tmp3_0 * s1_48_0;
    gl64_t kE48 = tmp3_1 * s1_48_1;
    gl64_t kF48 = tmp3_2 * s1_48_2;
    gl64_t kG48 = kD48 - kE48;
    tmp3_0 = (kC48 + kG48) - kF48;
    tmp3_1 = ((((kA48 + kC48) - kE48) - kE48) - kD48);
    tmp3_2 = kB48 - kG48;
    // Op 49: dim1x1 sub_swap
    gl64_t s0_49 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    gl64_t s1_49 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_49 - s0_49;
    // Op 50: dim1x1 mul
    gl64_t s0_50 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    tmp1_0 = s0_50 * tmp1_0;
    // Op 51: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 52: dim3x3 mul
    gl64_t s1_52_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_52_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_52_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA52 = (tmp3_0 + tmp3_1) * (s1_52_0 + s1_52_1);
    gl64_t kB52 = (tmp3_0 + tmp3_2) * (s1_52_0 + s1_52_2);
    gl64_t kC52 = (tmp3_1 + tmp3_2) * (s1_52_1 + s1_52_2);
    gl64_t kD52 = tmp3_0 * s1_52_0;
    gl64_t kE52 = tmp3_1 * s1_52_1;
    gl64_t kF52 = tmp3_2 * s1_52_2;
    gl64_t kG52 = kD52 - kE52;
    tmp3_0 = (kC52 + kG52) - kF52;
    tmp3_1 = ((((kA52 + kC52) - kE52) - kE52) - kD52);
    tmp3_2 = kB52 - kG52;
    // Op 53: dim1x1 sub
    gl64_t s0_53 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_53 = *(gl64_t*)&expressions_params[10][6];
    tmp1_0 = s0_53 - s1_53;
    // Op 54: dim1x1 mul
    gl64_t s0_54 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    tmp1_0 = s0_54 * tmp1_0;
    // Op 55: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 56: dim3x3 mul
    gl64_t s1_56_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_56_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_56_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA56 = (tmp3_0 + tmp3_1) * (s1_56_0 + s1_56_1);
    gl64_t kB56 = (tmp3_0 + tmp3_2) * (s1_56_0 + s1_56_2);
    gl64_t kC56 = (tmp3_1 + tmp3_2) * (s1_56_1 + s1_56_2);
    gl64_t kD56 = tmp3_0 * s1_56_0;
    gl64_t kE56 = tmp3_1 * s1_56_1;
    gl64_t kF56 = tmp3_2 * s1_56_2;
    gl64_t kG56 = kD56 - kE56;
    tmp3_0 = (kC56 + kG56) - kF56;
    tmp3_1 = ((((kA56 + kC56) - kE56) - kE56) - kD56);
    tmp3_2 = kB56 - kG56;
    // Op 57: dim1x1 sub_swap
    gl64_t s0_57 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_57 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_57 - s0_57;
    // Op 58: dim1x1 mul
    gl64_t s0_58 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    tmp1_0 = s0_58 * tmp1_0;
    // Op 59: dim1x1 sub
    gl64_t s0_59 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    gl64_t s1_59 = *(gl64_t*)&expressions_params[10][7];
    tmp1_1 = s0_59 - s1_59;
    // Op 60: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
    // Op 61: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 62: dim3x3 mul
    gl64_t s1_62_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_62_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_62_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA62 = (tmp3_0 + tmp3_1) * (s1_62_0 + s1_62_1);
    gl64_t kB62 = (tmp3_0 + tmp3_2) * (s1_62_0 + s1_62_2);
    gl64_t kC62 = (tmp3_1 + tmp3_2) * (s1_62_1 + s1_62_2);
    gl64_t kD62 = tmp3_0 * s1_62_0;
    gl64_t kE62 = tmp3_1 * s1_62_1;
    gl64_t kF62 = tmp3_2 * s1_62_2;
    gl64_t kG62 = kD62 - kE62;
    tmp3_0 = (kC62 + kG62) - kF62;
    tmp3_1 = ((((kA62 + kC62) - kE62) - kE62) - kD62);
    tmp3_2 = kB62 - kG62;
    // Op 63: dim1x1 sub_swap
    gl64_t s0_63 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_63 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_63 - s0_63;
    // Op 64: dim1x1 mul
    gl64_t s0_64 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    tmp1_0 = s0_64 * tmp1_0;
    // Op 65: dim1x1 sub
    gl64_t s0_65 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_65 = *(gl64_t*)&expressions_params[10][8];
    tmp1_1 = s0_65 - s1_65;
    // Op 66: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
    // Op 67: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 68: dim3x3 mul
    gl64_t s1_68_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_68_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_68_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA68 = (tmp3_0 + tmp3_1) * (s1_68_0 + s1_68_1);
    gl64_t kB68 = (tmp3_0 + tmp3_2) * (s1_68_0 + s1_68_2);
    gl64_t kC68 = (tmp3_1 + tmp3_2) * (s1_68_1 + s1_68_2);
    gl64_t kD68 = tmp3_0 * s1_68_0;
    gl64_t kE68 = tmp3_1 * s1_68_1;
    gl64_t kF68 = tmp3_2 * s1_68_2;
    gl64_t kG68 = kD68 - kE68;
    tmp3_0 = (kC68 + kG68) - kF68;
    tmp3_1 = ((((kA68 + kC68) - kE68) - kE68) - kD68);
    tmp3_2 = kB68 - kG68;
    // Op 69: dim1x1 sub_swap
    gl64_t s0_69 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_69 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_69 - s0_69;
    // Op 70: dim1x1 mul
    gl64_t s0_70 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    tmp1_0 = s0_70 * tmp1_0;
    // Op 71: dim1x1 sub
    gl64_t s0_71 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_71 = *(gl64_t*)&expressions_params[10][9];
    tmp1_1 = s0_71 - s1_71;
    // Op 72: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
    // Op 73: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 74: dim3x3 mul
    gl64_t s1_74_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_74_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_74_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA74 = (tmp3_0 + tmp3_1) * (s1_74_0 + s1_74_1);
    gl64_t kB74 = (tmp3_0 + tmp3_2) * (s1_74_0 + s1_74_2);
    gl64_t kC74 = (tmp3_1 + tmp3_2) * (s1_74_1 + s1_74_2);
    gl64_t kD74 = tmp3_0 * s1_74_0;
    gl64_t kE74 = tmp3_1 * s1_74_1;
    gl64_t kF74 = tmp3_2 * s1_74_2;
    gl64_t kG74 = kD74 - kE74;
    tmp3_0 = (kC74 + kG74) - kF74;
    tmp3_1 = ((((kA74 + kC74) - kE74) - kE74) - kD74);
    tmp3_2 = kB74 - kG74;
    // Op 75: dim1x1 sub_swap
    gl64_t s0_75 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_75 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_75 - s0_75;
    // Op 76: dim1x1 mul
    gl64_t s0_76 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    tmp1_0 = s0_76 * tmp1_0;
    // Op 77: dim1x1 mul
    gl64_t s0_77 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    gl64_t s1_77 = *(gl64_t*)&expressions_params[9][6];
    tmp1_2 = s0_77 * s1_77;
    // Op 78: dim1x1 sub
    gl64_t s1_78 = *(gl64_t*)&expressions_params[10][10];
    tmp1_1 = tmp1_2 - s1_78;
    // Op 79: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
    // Op 80: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 81: dim3x3 mul
    gl64_t s1_81_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_81_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_81_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA81 = (tmp3_0 + tmp3_1) * (s1_81_0 + s1_81_1);
    gl64_t kB81 = (tmp3_0 + tmp3_2) * (s1_81_0 + s1_81_2);
    gl64_t kC81 = (tmp3_1 + tmp3_2) * (s1_81_1 + s1_81_2);
    gl64_t kD81 = tmp3_0 * s1_81_0;
    gl64_t kE81 = tmp3_1 * s1_81_1;
    gl64_t kF81 = tmp3_2 * s1_81_2;
    gl64_t kG81 = kD81 - kE81;
    tmp3_0 = (kC81 + kG81) - kF81;
    tmp3_1 = ((((kA81 + kC81) - kE81) - kE81) - kD81);
    tmp3_2 = kB81 - kG81;
    // Op 82: dim1x1 mul
    gl64_t s0_82 = *(gl64_t*)&expressions_params[10][7];
    gl64_t s1_82 = *(gl64_t*)&expressions_params[10][6];
    tmp1_0 = s0_82 * s1_82;
    // Op 83: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 84: dim3x3 mul
    gl64_t s1_84_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_84_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_84_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA84 = (tmp3_0 + tmp3_1) * (s1_84_0 + s1_84_1);
    gl64_t kB84 = (tmp3_0 + tmp3_2) * (s1_84_0 + s1_84_2);
    gl64_t kC84 = (tmp3_1 + tmp3_2) * (s1_84_1 + s1_84_2);
    gl64_t kD84 = tmp3_0 * s1_84_0;
    gl64_t kE84 = tmp3_1 * s1_84_1;
    gl64_t kF84 = tmp3_2 * s1_84_2;
    gl64_t kG84 = kD84 - kE84;
    tmp3_0 = (kC84 + kG84) - kF84;
    tmp3_1 = ((((kA84 + kC84) - kE84) - kE84) - kD84);
    tmp3_2 = kB84 - kG84;
    // Op 85: dim1x1 mul
    gl64_t s0_85 = *(gl64_t*)&expressions_params[10][9];
    gl64_t s1_85 = *(gl64_t*)&expressions_params[10][6];
    tmp1_0 = s0_85 * s1_85;
    // Op 86: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 87: dim3x3 mul
    gl64_t s1_87_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_87_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_87_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA87 = (tmp3_0 + tmp3_1) * (s1_87_0 + s1_87_1);
    gl64_t kB87 = (tmp3_0 + tmp3_2) * (s1_87_0 + s1_87_2);
    gl64_t kC87 = (tmp3_1 + tmp3_2) * (s1_87_1 + s1_87_2);
    gl64_t kD87 = tmp3_0 * s1_87_0;
    gl64_t kE87 = tmp3_1 * s1_87_1;
    gl64_t kF87 = tmp3_2 * s1_87_2;
    gl64_t kG87 = kD87 - kE87;
    tmp3_0 = (kC87 + kG87) - kF87;
    tmp3_1 = ((((kA87 + kC87) - kE87) - kE87) - kD87);
    tmp3_2 = kB87 - kG87;
    // Op 88: dim1x1 mul
    gl64_t s0_88 = *(gl64_t*)&expressions_params[10][8];
    gl64_t s1_88 = *(gl64_t*)&expressions_params[10][6];
    tmp1_0 = s0_88 * s1_88;
    // Op 89: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 90: dim3x3 mul
    gl64_t s1_90_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_90_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_90_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA90 = (tmp3_0 + tmp3_1) * (s1_90_0 + s1_90_1);
    gl64_t kB90 = (tmp3_0 + tmp3_2) * (s1_90_0 + s1_90_2);
    gl64_t kC90 = (tmp3_1 + tmp3_2) * (s1_90_1 + s1_90_2);
    gl64_t kD90 = tmp3_0 * s1_90_0;
    gl64_t kE90 = tmp3_1 * s1_90_1;
    gl64_t kF90 = tmp3_2 * s1_90_2;
    gl64_t kG90 = kD90 - kE90;
    tmp3_0 = (kC90 + kG90) - kF90;
    tmp3_1 = ((((kA90 + kC90) - kE90) - kE90) - kD90);
    tmp3_2 = kB90 - kG90;
    // Op 91: dim1x1 mul
    gl64_t s0_91 = *(gl64_t*)&expressions_params[10][10];
    gl64_t s1_91 = *(gl64_t*)&expressions_params[10][6];
    tmp1_0 = s0_91 * s1_91;
    // Op 92: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 93: dim3x3 mul
    gl64_t s1_93_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_93_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_93_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA93 = (tmp3_0 + tmp3_1) * (s1_93_0 + s1_93_1);
    gl64_t kB93 = (tmp3_0 + tmp3_2) * (s1_93_0 + s1_93_2);
    gl64_t kC93 = (tmp3_1 + tmp3_2) * (s1_93_1 + s1_93_2);
    gl64_t kD93 = tmp3_0 * s1_93_0;
    gl64_t kE93 = tmp3_1 * s1_93_1;
    gl64_t kF93 = tmp3_2 * s1_93_2;
    gl64_t kG93 = kD93 - kE93;
    tmp3_0 = (kC93 + kG93) - kF93;
    tmp3_1 = ((((kA93 + kC93) - kE93) - kE93) - kD93);
    tmp3_2 = kB93 - kG93;
    // Op 94: dim1x1 mul
    gl64_t s0_94 = *(gl64_t*)&expressions_params[10][2];
    gl64_t s1_94 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_94 * s1_94;
    // Op 95: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 96: dim3x3 mul
    gl64_t s1_96_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_96_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_96_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA96 = (tmp3_0 + tmp3_1) * (s1_96_0 + s1_96_1);
    gl64_t kB96 = (tmp3_0 + tmp3_2) * (s1_96_0 + s1_96_2);
    gl64_t kC96 = (tmp3_1 + tmp3_2) * (s1_96_1 + s1_96_2);
    gl64_t kD96 = tmp3_0 * s1_96_0;
    gl64_t kE96 = tmp3_1 * s1_96_1;
    gl64_t kF96 = tmp3_2 * s1_96_2;
    gl64_t kG96 = kD96 - kE96;
    tmp3_0 = (kC96 + kG96) - kF96;
    tmp3_1 = ((((kA96 + kC96) - kE96) - kE96) - kD96);
    tmp3_2 = kB96 - kG96;
    // Op 97: dim1x1 mul
    gl64_t s0_97 = *(gl64_t*)&expressions_params[10][4];
    gl64_t s1_97 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_97 * s1_97;
    // Op 98: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 99: dim3x3 mul
    gl64_t s1_99_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_99_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_99_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA99 = (tmp3_0 + tmp3_1) * (s1_99_0 + s1_99_1);
    gl64_t kB99 = (tmp3_0 + tmp3_2) * (s1_99_0 + s1_99_2);
    gl64_t kC99 = (tmp3_1 + tmp3_2) * (s1_99_1 + s1_99_2);
    gl64_t kD99 = tmp3_0 * s1_99_0;
    gl64_t kE99 = tmp3_1 * s1_99_1;
    gl64_t kF99 = tmp3_2 * s1_99_2;
    gl64_t kG99 = kD99 - kE99;
    tmp3_0 = (kC99 + kG99) - kF99;
    tmp3_1 = ((((kA99 + kC99) - kE99) - kE99) - kD99);
    tmp3_2 = kB99 - kG99;
    // Op 100: dim1x1 mul
    gl64_t s0_100 = *(gl64_t*)&expressions_params[10][3];
    gl64_t s1_100 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_100 * s1_100;
    // Op 101: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 102: dim3x3 mul
    gl64_t s1_102_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_102_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_102_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA102 = (tmp3_0 + tmp3_1) * (s1_102_0 + s1_102_1);
    gl64_t kB102 = (tmp3_0 + tmp3_2) * (s1_102_0 + s1_102_2);
    gl64_t kC102 = (tmp3_1 + tmp3_2) * (s1_102_1 + s1_102_2);
    gl64_t kD102 = tmp3_0 * s1_102_0;
    gl64_t kE102 = tmp3_1 * s1_102_1;
    gl64_t kF102 = tmp3_2 * s1_102_2;
    gl64_t kG102 = kD102 - kE102;
    tmp3_0 = (kC102 + kG102) - kF102;
    tmp3_1 = ((((kA102 + kC102) - kE102) - kE102) - kD102);
    tmp3_2 = kB102 - kG102;
    // Op 103: dim1x1 mul
    gl64_t s0_103 = *(gl64_t*)&expressions_params[10][5];
    gl64_t s1_103 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_103 * s1_103;
    // Op 104: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 105: dim3x3 mul
    gl64_t s1_105_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_105_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_105_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA105 = (tmp3_0 + tmp3_1) * (s1_105_0 + s1_105_1);
    gl64_t kB105 = (tmp3_0 + tmp3_2) * (s1_105_0 + s1_105_2);
    gl64_t kC105 = (tmp3_1 + tmp3_2) * (s1_105_1 + s1_105_2);
    gl64_t kD105 = tmp3_0 * s1_105_0;
    gl64_t kE105 = tmp3_1 * s1_105_1;
    gl64_t kF105 = tmp3_2 * s1_105_2;
    gl64_t kG105 = kD105 - kE105;
    tmp3_0 = (kC105 + kG105) - kF105;
    tmp3_1 = ((((kA105 + kC105) - kE105) - kE105) - kD105);
    tmp3_2 = kB105 - kG105;
    // Op 106: dim1x1 sub
    gl64_t s0_106 = *(gl64_t*)&expressions_params[9][0];
    gl64_t s1_106 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_106 - s1_106;
    // Op 107: dim1x1 mul
    gl64_t s0_107 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_0)];
    tmp1_3 = s0_107 * tmp1_0;
    // Op 108: dim1x1 sub_swap
    gl64_t s0_108 = *(gl64_t*)&expressions_params[9][6];
    gl64_t s1_108 = *(gl64_t*)&expressions_params[10][4];
    tmp1_0 = s1_108 - s0_108;
    // Op 109: dim1x1 sub
    gl64_t s0_109 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    tmp1_0 = s0_109 - tmp1_0;
    // Op 110: dim1x1 mul
    tmp1_0 = tmp1_3 * tmp1_0;
    // Op 111: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 112: dim3x3 mul
    gl64_t s1_112_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_112_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_112_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA112 = (tmp3_0 + tmp3_1) * (s1_112_0 + s1_112_1);
    gl64_t kB112 = (tmp3_0 + tmp3_2) * (s1_112_0 + s1_112_2);
    gl64_t kC112 = (tmp3_1 + tmp3_2) * (s1_112_1 + s1_112_2);
    gl64_t kD112 = tmp3_0 * s1_112_0;
    gl64_t kE112 = tmp3_1 * s1_112_1;
    gl64_t kF112 = tmp3_2 * s1_112_2;
    gl64_t kG112 = kD112 - kE112;
    tmp3_0 = (kC112 + kG112) - kF112;
    tmp3_1 = ((((kA112 + kC112) - kE112) - kE112) - kD112);
    tmp3_2 = kB112 - kG112;
    // Op 113: dim1x1 sub_swap
    gl64_t s0_113 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_0)];
    gl64_t s1_113 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_113 - s0_113;
    // Op 114: dim1x1 sub_swap
    gl64_t s0_114 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 0, domainSize, nCols_1))];
    gl64_t s1_114 = *(gl64_t*)&expressions_params[9][0];
    tmp1_1 = s1_114 - s0_114;
    // Op 115: dim1x1 mul
    tmp1_4 = tmp1_0 * tmp1_1;
    // Op 116: dim1x1 sub
    gl64_t s0_116 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 5, domainSize, nCols_1))];
    gl64_t s1_116 = *(gl64_t*)&expressions_params[9][6];
    tmp1_0 = s0_116 - s1_116;
    // Op 117: dim1x1 sub
    gl64_t s0_117 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    tmp1_0 = s0_117 - tmp1_0;
    // Op 118: dim1x1 mul
    tmp1_0 = tmp1_4 * tmp1_0;
    // Op 119: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 120: dim3x3 mul
    gl64_t s1_120_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_120_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_120_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA120 = (tmp3_0 + tmp3_1) * (s1_120_0 + s1_120_1);
    gl64_t kB120 = (tmp3_0 + tmp3_2) * (s1_120_0 + s1_120_2);
    gl64_t kC120 = (tmp3_1 + tmp3_2) * (s1_120_1 + s1_120_2);
    gl64_t kD120 = tmp3_0 * s1_120_0;
    gl64_t kE120 = tmp3_1 * s1_120_1;
    gl64_t kF120 = tmp3_2 * s1_120_2;
    gl64_t kG120 = kD120 - kE120;
    tmp3_0 = (kC120 + kG120) - kF120;
    tmp3_1 = ((((kA120 + kC120) - kE120) - kE120) - kD120);
    tmp3_2 = kB120 - kG120;
    // Op 121: dim1x1 add
    gl64_t s0_121 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    gl64_t s1_121 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    tmp1_0 = s0_121 + s1_121;
    // Op 122: dim1x1 add
    gl64_t s0_122 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    tmp1_0 = s0_122 + tmp1_0;
    // Op 123: dim1x1 add
    gl64_t s0_123 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    tmp1_1 = s0_123 + tmp1_0;
    // Op 124: dim1x1 sub
    gl64_t s0_124 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    tmp1_0 = s0_124 - tmp1_1;
    // Op 125: dim1x1 mul
    gl64_t s0_125 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    tmp1_0 = s0_125 * tmp1_0;
    // Op 126: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 127: dim3x3 mul
    gl64_t s1_127_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_127_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_127_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA127 = (tmp3_0 + tmp3_1) * (s1_127_0 + s1_127_1);
    gl64_t kB127 = (tmp3_0 + tmp3_2) * (s1_127_0 + s1_127_2);
    gl64_t kC127 = (tmp3_1 + tmp3_2) * (s1_127_1 + s1_127_2);
    gl64_t kD127 = tmp3_0 * s1_127_0;
    gl64_t kE127 = tmp3_1 * s1_127_1;
    gl64_t kF127 = tmp3_2 * s1_127_2;
    gl64_t kG127 = kD127 - kE127;
    tmp3_0 = (kC127 + kG127) - kF127;
    tmp3_1 = ((((kA127 + kC127) - kE127) - kE127) - kD127);
    tmp3_2 = kB127 - kG127;
    // Op 128: dim1x1 sub_swap
    gl64_t s0_128 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_128 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_128 - s0_128;
    // Op 129: dim1x1 sub
    gl64_t s1_129 = *(gl64_t*)&expressions_params[9][6];
    tmp1_1 = tmp1_1 - s1_129;
    // Op 130: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
    // Op 131: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 132: dim3x3 mul
    gl64_t s1_132_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_132_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_132_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA132 = (tmp3_0 + tmp3_1) * (s1_132_0 + s1_132_1);
    gl64_t kB132 = (tmp3_0 + tmp3_2) * (s1_132_0 + s1_132_2);
    gl64_t kC132 = (tmp3_1 + tmp3_2) * (s1_132_1 + s1_132_2);
    gl64_t kD132 = tmp3_0 * s1_132_0;
    gl64_t kE132 = tmp3_1 * s1_132_1;
    gl64_t kF132 = tmp3_2 * s1_132_2;
    gl64_t kG132 = kD132 - kE132;
    tmp3_0 = (kC132 + kG132) - kF132;
    tmp3_1 = ((((kA132 + kC132) - kE132) - kE132) - kD132);
    tmp3_2 = kB132 - kG132;
    // Op 133: dim1x1 add
    gl64_t s0_133 = *(gl64_t*)&expressions_params[9][6];
    gl64_t s1_133 = *(gl64_t*)&expressions_params[10][2];
    tmp1_0 = s0_133 + s1_133;
    // Op 134: dim1x1 sub
    gl64_t s0_134 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    tmp1_0 = s0_134 - tmp1_0;
    // Op 135: dim1x1 mul
    tmp1_0 = tmp1_3 * tmp1_0;
    // Op 136: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 137: dim3x3 mul
    gl64_t s1_137_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_137_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_137_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA137 = (tmp3_0 + tmp3_1) * (s1_137_0 + s1_137_1);
    gl64_t kB137 = (tmp3_0 + tmp3_2) * (s1_137_0 + s1_137_2);
    gl64_t kC137 = (tmp3_1 + tmp3_2) * (s1_137_1 + s1_137_2);
    gl64_t kD137 = tmp3_0 * s1_137_0;
    gl64_t kE137 = tmp3_1 * s1_137_1;
    gl64_t kF137 = tmp3_2 * s1_137_2;
    gl64_t kG137 = kD137 - kE137;
    tmp3_0 = (kC137 + kG137) - kF137;
    tmp3_1 = ((((kA137 + kC137) - kE137) - kE137) - kD137);
    tmp3_2 = kB137 - kG137;
    // Op 138: dim1x1 add
    gl64_t s0_138 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 4, domainSize, nCols_1))];
    gl64_t s1_138 = *(gl64_t*)&expressions_params[9][6];
    tmp1_0 = s0_138 + s1_138;
    // Op 139: dim1x1 sub
    gl64_t s0_139 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    tmp1_0 = s0_139 - tmp1_0;
    // Op 140: dim1x1 mul
    tmp1_0 = tmp1_4 * tmp1_0;
    // Op 141: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 142: dim3x3 mul
    gl64_t s1_142_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_142_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_142_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA142 = (tmp3_0 + tmp3_1) * (s1_142_0 + s1_142_1);
    gl64_t kB142 = (tmp3_0 + tmp3_2) * (s1_142_0 + s1_142_2);
    gl64_t kC142 = (tmp3_1 + tmp3_2) * (s1_142_1 + s1_142_2);
    gl64_t kD142 = tmp3_0 * s1_142_0;
    gl64_t kE142 = tmp3_1 * s1_142_1;
    gl64_t kF142 = tmp3_2 * s1_142_2;
    gl64_t kG142 = kD142 - kE142;
    tmp3_0 = (kC142 + kG142) - kF142;
    tmp3_1 = ((((kA142 + kC142) - kE142) - kE142) - kD142);
    tmp3_2 = kB142 - kG142;
    // Op 143: dim1x1 sub
    gl64_t s1_143 = *(gl64_t*)&expressions_params[10][5];
    tmp1_0 = tmp1_2 - s1_143;
    // Op 144: dim1x1 mul
    tmp1_0 = tmp1_3 * tmp1_0;
    // Op 145: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 146: dim3x3 mul
    gl64_t s1_146_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_146_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_146_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA146 = (tmp3_0 + tmp3_1) * (s1_146_0 + s1_146_1);
    gl64_t kB146 = (tmp3_0 + tmp3_2) * (s1_146_0 + s1_146_2);
    gl64_t kC146 = (tmp3_1 + tmp3_2) * (s1_146_1 + s1_146_2);
    gl64_t kD146 = tmp3_0 * s1_146_0;
    gl64_t kE146 = tmp3_1 * s1_146_1;
    gl64_t kF146 = tmp3_2 * s1_146_2;
    gl64_t kG146 = kD146 - kE146;
    tmp3_0 = (kC146 + kG146) - kF146;
    tmp3_1 = ((((kA146 + kC146) - kE146) - kE146) - kD146);
    tmp3_2 = kB146 - kG146;
    // Op 147: dim1x1 mul
    gl64_t s0_147 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 2, domainSize, nCols_1))];
    gl64_t s1_147 = *(gl64_t*)&expressions_params[9][6];
    tmp1_0 = s0_147 * s1_147;
    // Op 148: dim1x1 sub
    tmp1_0 = tmp1_2 - tmp1_0;
    // Op 149: dim1x1 mul
    tmp1_0 = tmp1_4 * tmp1_0;
    // Op 150: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 151: dim3x3 mul
    gl64_t s1_151_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_151_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_151_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA151 = (tmp3_0 + tmp3_1) * (s1_151_0 + s1_151_1);
    gl64_t kB151 = (tmp3_0 + tmp3_2) * (s1_151_0 + s1_151_2);
    gl64_t kC151 = (tmp3_1 + tmp3_2) * (s1_151_1 + s1_151_2);
    gl64_t kD151 = tmp3_0 * s1_151_0;
    gl64_t kE151 = tmp3_1 * s1_151_1;
    gl64_t kF151 = tmp3_2 * s1_151_2;
    gl64_t kG151 = kD151 - kE151;
    tmp3_0 = (kC151 + kG151) - kF151;
    tmp3_1 = ((((kA151 + kC151) - kE151) - kE151) - kD151);
    tmp3_2 = kB151 - kG151;
    // Op 152: dim1x1 sub
    gl64_t s0_152 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_152 = *(gl64_t*)&expressions_params[10][3];
    tmp1_0 = s0_152 - s1_152;
    // Op 153: dim1x1 mul
    tmp1_0 = tmp1_3 * tmp1_0;
    // Op 154: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 155: dim3x3 mul
    gl64_t s1_155_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_155_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_155_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA155 = (tmp3_0 + tmp3_1) * (s1_155_0 + s1_155_1);
    gl64_t kB155 = (tmp3_0 + tmp3_2) * (s1_155_0 + s1_155_2);
    gl64_t kC155 = (tmp3_1 + tmp3_2) * (s1_155_1 + s1_155_2);
    gl64_t kD155 = tmp3_0 * s1_155_0;
    gl64_t kE155 = tmp3_1 * s1_155_1;
    gl64_t kF155 = tmp3_2 * s1_155_2;
    gl64_t kG155 = kD155 - kE155;
    tmp3_0 = (kC155 + kG155) - kF155;
    tmp3_1 = ((((kA155 + kC155) - kE155) - kE155) - kD155);
    tmp3_2 = kB155 - kG155;
    // Op 156: dim1x1 sub
    gl64_t s0_156 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_156 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 3, domainSize, nCols_1))];
    tmp1_0 = s0_156 - s1_156;
    // Op 157: dim1x1 mul
    tmp1_0 = tmp1_4 * tmp1_0;
    // Op 158: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 159: dim3x3 mul
    gl64_t s1_159_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_159_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_159_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA159 = (tmp3_0 + tmp3_1) * (s1_159_0 + s1_159_1);
    gl64_t kB159 = (tmp3_0 + tmp3_2) * (s1_159_0 + s1_159_2);
    gl64_t kC159 = (tmp3_1 + tmp3_2) * (s1_159_1 + s1_159_2);
    gl64_t kD159 = tmp3_0 * s1_159_0;
    gl64_t kE159 = tmp3_1 * s1_159_1;
    gl64_t kF159 = tmp3_2 * s1_159_2;
    gl64_t kG159 = kD159 - kE159;
    tmp3_0 = (kC159 + kG159) - kF159;
    tmp3_1 = ((((kA159 + kC159) - kE159) - kE159) - kD159);
    tmp3_2 = kB159 - kG159;
    // Op 160: dim1x1 mul
    gl64_t s0_160 = *(gl64_t*)&expressions_params[9][15];
    gl64_t s1_160 = *(gl64_t*)&expressions_params[10][13];
    tmp1_0 = s0_160 * s1_160;
    // Op 161: dim1x1 add
    gl64_t s1_161 = *(gl64_t*)&expressions_params[10][12];
    tmp1_0 = tmp1_0 + s1_161;
    // Op 162: dim1x1 sub
    gl64_t s1_162 = *(gl64_t*)&expressions_params[10][9];
    tmp1_0 = tmp1_0 - s1_162;
    // Op 163: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 164: dim3x3 mul
    gl64_t s1_164_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_164_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_164_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA164 = (tmp3_0 + tmp3_1) * (s1_164_0 + s1_164_1);
    gl64_t kB164 = (tmp3_0 + tmp3_2) * (s1_164_0 + s1_164_2);
    gl64_t kC164 = (tmp3_1 + tmp3_2) * (s1_164_1 + s1_164_2);
    gl64_t kD164 = tmp3_0 * s1_164_0;
    gl64_t kE164 = tmp3_1 * s1_164_1;
    gl64_t kF164 = tmp3_2 * s1_164_2;
    gl64_t kG164 = kD164 - kE164;
    tmp3_12 = (kC164 + kG164) - kF164;
    tmp3_13 = ((((kA164 + kC164) - kE164) - kE164) - kD164);
    tmp3_14 = kB164 - kG164;
    // Op 165: dim3x1 mul
    gl64_t s0_165_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_165_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_165_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_165 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 18, domainSize, nCols_1))];
    tmp3_0 = s0_165_0 * s1_165; tmp3_1 = s0_165_1 * s1_165; tmp3_2 = s0_165_2 * s1_165;
    // Op 166: dim3x1 add
    gl64_t s1_166 = *(gl64_t*)&expressions_params[9][3];
    tmp3_9 = tmp3_0 + s1_166; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 167: dim3x3 add
    gl64_t s1_167_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_167_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_167_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_3 = tmp3_9 + s1_167_0; tmp3_4 = tmp3_10 + s1_167_1; tmp3_5 = tmp3_11 + s1_167_2;
    // Op 168: dim3x1 mul
    gl64_t s0_168_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_168_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_168_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_168 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    tmp3_0 = s0_168_0 * s1_168; tmp3_1 = s0_168_1 * s1_168; tmp3_2 = s0_168_2 * s1_168;
    // Op 169: dim3x1 add
    gl64_t s1_169 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_169; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 170: dim3x3 mul
    gl64_t s1_170_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_170_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_170_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA170 = (tmp3_0 + tmp3_1) * (s1_170_0 + s1_170_1);
    gl64_t kB170 = (tmp3_0 + tmp3_2) * (s1_170_0 + s1_170_2);
    gl64_t kC170 = (tmp3_1 + tmp3_2) * (s1_170_1 + s1_170_2);
    gl64_t kD170 = tmp3_0 * s1_170_0;
    gl64_t kE170 = tmp3_1 * s1_170_1;
    gl64_t kF170 = tmp3_2 * s1_170_2;
    gl64_t kG170 = kD170 - kE170;
    tmp3_0 = (kC170 + kG170) - kF170;
    tmp3_1 = ((((kA170 + kC170) - kE170) - kE170) - kD170);
    tmp3_2 = kB170 - kG170;
    // Op 171: dim3x1 add
    gl64_t s1_171 = *(gl64_t*)&expressions_params[9][2];
    tmp3_6 = tmp3_0 + s1_171; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 172: dim3x3 add
    gl64_t s1_172_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_172_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_172_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_172_0; tmp3_1 = tmp3_7 + s1_172_1; tmp3_2 = tmp3_8 + s1_172_2;
    // Op 173: dim3x3 mul
    gl64_t kA173 = (tmp3_3 + tmp3_4) * (tmp3_0 + tmp3_1);
    gl64_t kB173 = (tmp3_3 + tmp3_5) * (tmp3_0 + tmp3_2);
    gl64_t kC173 = (tmp3_4 + tmp3_5) * (tmp3_1 + tmp3_2);
    gl64_t kD173 = tmp3_3 * tmp3_0;
    gl64_t kE173 = tmp3_4 * tmp3_1;
    gl64_t kF173 = tmp3_5 * tmp3_2;
    gl64_t kG173 = kD173 - kE173;
    tmp3_0 = (kC173 + kG173) - kF173;
    tmp3_1 = ((((kA173 + kC173) - kE173) - kE173) - kD173);
    tmp3_2 = kB173 - kG173;
    // Op 174: dim3x3 mul
    gl64_t s0_174_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+0, domainSize, nCols_2))];
    gl64_t s0_174_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+1, domainSize, nCols_2))];
    gl64_t s0_174_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+2, domainSize, nCols_2))];
    gl64_t kA174 = (s0_174_0 + s0_174_1) * (tmp3_0 + tmp3_1);
    gl64_t kB174 = (s0_174_0 + s0_174_2) * (tmp3_0 + tmp3_2);
    gl64_t kC174 = (s0_174_1 + s0_174_2) * (tmp3_1 + tmp3_2);
    gl64_t kD174 = s0_174_0 * tmp3_0;
    gl64_t kE174 = s0_174_1 * tmp3_1;
    gl64_t kF174 = s0_174_2 * tmp3_2;
    gl64_t kG174 = kD174 - kE174;
    tmp3_0 = (kC174 + kG174) - kF174;
    tmp3_1 = ((((kA174 + kC174) - kE174) - kE174) - kD174);
    tmp3_2 = kB174 - kG174;
    // Op 175: dim1x1 sub_swap
    gl64_t s0_175 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    gl64_t s1_175 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_175 - s0_175;
    // Op 176: dim3x3 add
    gl64_t s1_176_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_176_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_176_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_176_0; tmp3_7 = tmp3_7 + s1_176_1; tmp3_8 = tmp3_8 + s1_176_2;
    // Op 177: dim3x1 mul
    tmp3_6 = tmp3_6 * tmp1_0; tmp3_7 = tmp3_7 * tmp1_0; tmp3_8 = tmp3_8 * tmp1_0;
    // Op 178: dim1x1 sub_swap
    gl64_t s0_178 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    gl64_t s1_178 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_178 - s0_178;
    // Op 179: dim3x3 add
    gl64_t s1_179_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_179_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_179_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_179_0; tmp3_10 = tmp3_10 + s1_179_1; tmp3_11 = tmp3_11 + s1_179_2;
    // Op 180: dim3x1 mul
    tmp3_9 = tmp3_9 * tmp1_0; tmp3_10 = tmp3_10 * tmp1_0; tmp3_11 = tmp3_11 * tmp1_0;
    // Op 181: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 182: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 183: dim3x3 add
    tmp3_0 = tmp3_12 + tmp3_0; tmp3_1 = tmp3_13 + tmp3_1; tmp3_2 = tmp3_14 + tmp3_2;
    // Op 184: dim3x3 mul
    gl64_t s1_184_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_184_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_184_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA184 = (tmp3_0 + tmp3_1) * (s1_184_0 + s1_184_1);
    gl64_t kB184 = (tmp3_0 + tmp3_2) * (s1_184_0 + s1_184_2);
    gl64_t kC184 = (tmp3_1 + tmp3_2) * (s1_184_1 + s1_184_2);
    gl64_t kD184 = tmp3_0 * s1_184_0;
    gl64_t kE184 = tmp3_1 * s1_184_1;
    gl64_t kF184 = tmp3_2 * s1_184_2;
    gl64_t kG184 = kD184 - kE184;
    tmp3_3 = (kC184 + kG184) - kF184;
    tmp3_4 = ((((kA184 + kC184) - kE184) - kE184) - kD184);
    tmp3_5 = kB184 - kG184;
    // Op 185: dim3x1 mul
    gl64_t s0_185_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_185_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_185_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_185 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 19, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 19, domainSize, nCols_1))];
    tmp3_0 = s0_185_0 * s1_185; tmp3_1 = s0_185_1 * s1_185; tmp3_2 = s0_185_2 * s1_185;
    // Op 186: dim3x1 add
    gl64_t s1_186 = *(gl64_t*)&expressions_params[9][3];
    tmp3_9 = tmp3_0 + s1_186; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 187: dim3x3 add
    gl64_t s1_187_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_187_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_187_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_12 = tmp3_9 + s1_187_0; tmp3_13 = tmp3_10 + s1_187_1; tmp3_14 = tmp3_11 + s1_187_2;
    // Op 188: dim3x1 mul
    gl64_t s0_188_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_188_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_188_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_188 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 20, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 20, domainSize, nCols_1))];
    tmp3_0 = s0_188_0 * s1_188; tmp3_1 = s0_188_1 * s1_188; tmp3_2 = s0_188_2 * s1_188;
    // Op 189: dim3x1 add
    gl64_t s1_189 = *(gl64_t*)&expressions_params[9][3];
    tmp3_6 = tmp3_0 + s1_189; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 190: dim3x3 add
    gl64_t s1_190_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_190_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_190_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_190_0; tmp3_1 = tmp3_7 + s1_190_1; tmp3_2 = tmp3_8 + s1_190_2;
    // Op 191: dim3x3 mul
    gl64_t kA191 = (tmp3_12 + tmp3_13) * (tmp3_0 + tmp3_1);
    gl64_t kB191 = (tmp3_12 + tmp3_14) * (tmp3_0 + tmp3_2);
    gl64_t kC191 = (tmp3_13 + tmp3_14) * (tmp3_1 + tmp3_2);
    gl64_t kD191 = tmp3_12 * tmp3_0;
    gl64_t kE191 = tmp3_13 * tmp3_1;
    gl64_t kF191 = tmp3_14 * tmp3_2;
    gl64_t kG191 = kD191 - kE191;
    tmp3_0 = (kC191 + kG191) - kF191;
    tmp3_1 = ((((kA191 + kC191) - kE191) - kE191) - kD191);
    tmp3_2 = kB191 - kG191;
    // Op 192: dim3x3 mul
    gl64_t s0_192_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+0, domainSize, nCols_2))];
    gl64_t s0_192_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+1, domainSize, nCols_2))];
    gl64_t s0_192_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+2, domainSize, nCols_2))];
    gl64_t kA192 = (s0_192_0 + s0_192_1) * (tmp3_0 + tmp3_1);
    gl64_t kB192 = (s0_192_0 + s0_192_2) * (tmp3_0 + tmp3_2);
    gl64_t kC192 = (s0_192_1 + s0_192_2) * (tmp3_1 + tmp3_2);
    gl64_t kD192 = s0_192_0 * tmp3_0;
    gl64_t kE192 = s0_192_1 * tmp3_1;
    gl64_t kF192 = s0_192_2 * tmp3_2;
    gl64_t kG192 = kD192 - kE192;
    tmp3_0 = (kC192 + kG192) - kF192;
    tmp3_1 = ((((kA192 + kC192) - kE192) - kE192) - kD192);
    tmp3_2 = kB192 - kG192;
    // Op 193: dim1x1 sub_swap
    gl64_t s0_193 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    gl64_t s1_193 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_193 - s0_193;
    // Op 194: dim3x3 add
    gl64_t s1_194_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_194_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_194_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_194_0; tmp3_7 = tmp3_7 + s1_194_1; tmp3_8 = tmp3_8 + s1_194_2;
    // Op 195: dim3x1 mul
    tmp3_6 = tmp3_6 * tmp1_0; tmp3_7 = tmp3_7 * tmp1_0; tmp3_8 = tmp3_8 * tmp1_0;
    // Op 196: dim1x1 sub_swap
    gl64_t s0_196 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    gl64_t s1_196 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_196 - s0_196;
    // Op 197: dim3x3 add
    gl64_t s1_197_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_197_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_197_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_197_0; tmp3_10 = tmp3_10 + s1_197_1; tmp3_11 = tmp3_11 + s1_197_2;
    // Op 198: dim3x1 mul
    tmp3_9 = tmp3_9 * tmp1_0; tmp3_10 = tmp3_10 * tmp1_0; tmp3_11 = tmp3_11 * tmp1_0;
    // Op 199: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 200: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 201: dim3x3 add
    tmp3_0 = tmp3_3 + tmp3_0; tmp3_1 = tmp3_4 + tmp3_1; tmp3_2 = tmp3_5 + tmp3_2;
    // Op 202: dim3x3 mul
    gl64_t s1_202_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_202_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_202_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA202 = (tmp3_0 + tmp3_1) * (s1_202_0 + s1_202_1);
    gl64_t kB202 = (tmp3_0 + tmp3_2) * (s1_202_0 + s1_202_2);
    gl64_t kC202 = (tmp3_1 + tmp3_2) * (s1_202_1 + s1_202_2);
    gl64_t kD202 = tmp3_0 * s1_202_0;
    gl64_t kE202 = tmp3_1 * s1_202_1;
    gl64_t kF202 = tmp3_2 * s1_202_2;
    gl64_t kG202 = kD202 - kE202;
    tmp3_12 = (kC202 + kG202) - kF202;
    tmp3_13 = ((((kA202 + kC202) - kE202) - kE202) - kD202);
    tmp3_14 = kB202 - kG202;
    // Op 203: dim3x1 mul
    gl64_t s0_203_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_203_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_203_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_203 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    tmp3_0 = s0_203_0 * s1_203; tmp3_1 = s0_203_1 * s1_203; tmp3_2 = s0_203_2 * s1_203;
    // Op 204: dim3x1 add
    gl64_t s1_204 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_204; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 205: dim3x3 mul
    gl64_t s1_205_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_205_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_205_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA205 = (tmp3_0 + tmp3_1) * (s1_205_0 + s1_205_1);
    gl64_t kB205 = (tmp3_0 + tmp3_2) * (s1_205_0 + s1_205_2);
    gl64_t kC205 = (tmp3_1 + tmp3_2) * (s1_205_1 + s1_205_2);
    gl64_t kD205 = tmp3_0 * s1_205_0;
    gl64_t kE205 = tmp3_1 * s1_205_1;
    gl64_t kF205 = tmp3_2 * s1_205_2;
    gl64_t kG205 = kD205 - kE205;
    tmp3_0 = (kC205 + kG205) - kF205;
    tmp3_1 = ((((kA205 + kC205) - kE205) - kE205) - kD205);
    tmp3_2 = kB205 - kG205;
    // Op 206: dim3x1 add
    gl64_t s1_206 = *(gl64_t*)&expressions_params[9][2];
    tmp3_9 = tmp3_0 + s1_206; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 207: dim3x3 add
    gl64_t s1_207_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_207_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_207_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_3 = tmp3_9 + s1_207_0; tmp3_4 = tmp3_10 + s1_207_1; tmp3_5 = tmp3_11 + s1_207_2;
    // Op 208: dim3x1 mul
    gl64_t s0_208_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_208_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_208_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_208 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 21, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 21, domainSize, nCols_1))];
    tmp3_0 = s0_208_0 * s1_208; tmp3_1 = s0_208_1 * s1_208; tmp3_2 = s0_208_2 * s1_208;
    // Op 209: dim3x1 add
    gl64_t s1_209 = *(gl64_t*)&expressions_params[9][3];
    tmp3_6 = tmp3_0 + s1_209; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 210: dim3x3 add
    gl64_t s1_210_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_210_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_210_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_210_0; tmp3_1 = tmp3_7 + s1_210_1; tmp3_2 = tmp3_8 + s1_210_2;
    // Op 211: dim3x3 mul
    gl64_t kA211 = (tmp3_3 + tmp3_4) * (tmp3_0 + tmp3_1);
    gl64_t kB211 = (tmp3_3 + tmp3_5) * (tmp3_0 + tmp3_2);
    gl64_t kC211 = (tmp3_4 + tmp3_5) * (tmp3_1 + tmp3_2);
    gl64_t kD211 = tmp3_3 * tmp3_0;
    gl64_t kE211 = tmp3_4 * tmp3_1;
    gl64_t kF211 = tmp3_5 * tmp3_2;
    gl64_t kG211 = kD211 - kE211;
    tmp3_0 = (kC211 + kG211) - kF211;
    tmp3_1 = ((((kA211 + kC211) - kE211) - kE211) - kD211);
    tmp3_2 = kB211 - kG211;
    // Op 212: dim3x3 mul
    uint64_t s0_212_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_2));
    gl64_t s0_212_0 = *(gl64_t*)&dParams->aux_trace[s0_212_pos];
    gl64_t s0_212_1 = *(gl64_t*)&dParams->aux_trace[s0_212_pos + TILE_HEIGHT];
    gl64_t s0_212_2 = *(gl64_t*)&dParams->aux_trace[s0_212_pos + 2*TILE_HEIGHT];
    gl64_t kA212 = (s0_212_0 + s0_212_1) * (tmp3_0 + tmp3_1);
    gl64_t kB212 = (s0_212_0 + s0_212_2) * (tmp3_0 + tmp3_2);
    gl64_t kC212 = (s0_212_1 + s0_212_2) * (tmp3_1 + tmp3_2);
    gl64_t kD212 = s0_212_0 * tmp3_0;
    gl64_t kE212 = s0_212_1 * tmp3_1;
    gl64_t kF212 = s0_212_2 * tmp3_2;
    gl64_t kG212 = kD212 - kE212;
    tmp3_0 = (kC212 + kG212) - kF212;
    tmp3_1 = ((((kA212 + kC212) - kE212) - kE212) - kD212);
    tmp3_2 = kB212 - kG212;
    // Op 213: dim1x1 sub_swap
    gl64_t s0_213 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    gl64_t s1_213 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_213 - s0_213;
    // Op 214: dim3x3 add
    gl64_t s1_214_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_214_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_214_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_214_0; tmp3_7 = tmp3_7 + s1_214_1; tmp3_8 = tmp3_8 + s1_214_2;
    // Op 215: dim3x1 mul
    tmp3_6 = tmp3_6 * tmp1_0; tmp3_7 = tmp3_7 * tmp1_0; tmp3_8 = tmp3_8 * tmp1_0;
    // Op 216: dim1x1 sub_swap
    gl64_t s0_216 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    gl64_t s1_216 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_216 - s0_216;
    // Op 217: dim3x3 add
    gl64_t s1_217_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_217_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_217_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_217_0; tmp3_10 = tmp3_10 + s1_217_1; tmp3_11 = tmp3_11 + s1_217_2;
    // Op 218: dim3x1 mul
    tmp3_9 = tmp3_9 * tmp1_0; tmp3_10 = tmp3_10 * tmp1_0; tmp3_11 = tmp3_11 * tmp1_0;
    // Op 219: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 220: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 221: dim3x3 add
    tmp3_0 = tmp3_12 + tmp3_0; tmp3_1 = tmp3_13 + tmp3_1; tmp3_2 = tmp3_14 + tmp3_2;
    // Op 222: dim3x3 mul
    gl64_t s1_222_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_222_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_222_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA222 = (tmp3_0 + tmp3_1) * (s1_222_0 + s1_222_1);
    gl64_t kB222 = (tmp3_0 + tmp3_2) * (s1_222_0 + s1_222_2);
    gl64_t kC222 = (tmp3_1 + tmp3_2) * (s1_222_1 + s1_222_2);
    gl64_t kD222 = tmp3_0 * s1_222_0;
    gl64_t kE222 = tmp3_1 * s1_222_1;
    gl64_t kF222 = tmp3_2 * s1_222_2;
    gl64_t kG222 = kD222 - kE222;
    tmp3_3 = (kC222 + kG222) - kF222;
    tmp3_4 = ((((kA222 + kC222) - kE222) - kE222) - kD222);
    tmp3_5 = kB222 - kG222;
    // Op 223: dim3x1 mul
    gl64_t s0_223_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_223_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_223_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_223 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 22, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 22, domainSize, nCols_1))];
    tmp3_0 = s0_223_0 * s1_223; tmp3_1 = s0_223_1 * s1_223; tmp3_2 = s0_223_2 * s1_223;
    // Op 224: dim3x1 add
    gl64_t s1_224 = *(gl64_t*)&expressions_params[9][3];
    tmp3_9 = tmp3_0 + s1_224; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 225: dim3x3 add
    gl64_t s1_225_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_225_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_225_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_12 = tmp3_9 + s1_225_0; tmp3_13 = tmp3_10 + s1_225_1; tmp3_14 = tmp3_11 + s1_225_2;
    // Op 226: dim3x1 mul
    gl64_t s0_226_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_226_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_226_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_226 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    tmp3_0 = s0_226_0 * s1_226; tmp3_1 = s0_226_1 * s1_226; tmp3_2 = s0_226_2 * s1_226;
    // Op 227: dim3x1 add
    gl64_t s1_227 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 14, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 14, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_227; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 228: dim3x3 mul
    gl64_t s1_228_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_228_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_228_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA228 = (tmp3_0 + tmp3_1) * (s1_228_0 + s1_228_1);
    gl64_t kB228 = (tmp3_0 + tmp3_2) * (s1_228_0 + s1_228_2);
    gl64_t kC228 = (tmp3_1 + tmp3_2) * (s1_228_1 + s1_228_2);
    gl64_t kD228 = tmp3_0 * s1_228_0;
    gl64_t kE228 = tmp3_1 * s1_228_1;
    gl64_t kF228 = tmp3_2 * s1_228_2;
    gl64_t kG228 = kD228 - kE228;
    tmp3_0 = (kC228 + kG228) - kF228;
    tmp3_1 = ((((kA228 + kC228) - kE228) - kE228) - kD228);
    tmp3_2 = kB228 - kG228;
    // Op 229: dim3x1 add
    gl64_t s1_229 = *(gl64_t*)&expressions_params[9][2];
    tmp3_6 = tmp3_0 + s1_229; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 230: dim3x3 add
    gl64_t s1_230_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_230_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_230_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_230_0; tmp3_1 = tmp3_7 + s1_230_1; tmp3_2 = tmp3_8 + s1_230_2;
    // Op 231: dim3x3 mul
    gl64_t kA231 = (tmp3_12 + tmp3_13) * (tmp3_0 + tmp3_1);
    gl64_t kB231 = (tmp3_12 + tmp3_14) * (tmp3_0 + tmp3_2);
    gl64_t kC231 = (tmp3_13 + tmp3_14) * (tmp3_1 + tmp3_2);
    gl64_t kD231 = tmp3_12 * tmp3_0;
    gl64_t kE231 = tmp3_13 * tmp3_1;
    gl64_t kF231 = tmp3_14 * tmp3_2;
    gl64_t kG231 = kD231 - kE231;
    tmp3_0 = (kC231 + kG231) - kF231;
    tmp3_1 = ((((kA231 + kC231) - kE231) - kE231) - kD231);
    tmp3_2 = kB231 - kG231;
    // Op 232: dim3x3 mul
    uint64_t s0_232_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_2));
    gl64_t s0_232_0 = *(gl64_t*)&dParams->aux_trace[s0_232_pos];
    gl64_t s0_232_1 = *(gl64_t*)&dParams->aux_trace[s0_232_pos + TILE_HEIGHT];
    gl64_t s0_232_2 = *(gl64_t*)&dParams->aux_trace[s0_232_pos + 2*TILE_HEIGHT];
    gl64_t kA232 = (s0_232_0 + s0_232_1) * (tmp3_0 + tmp3_1);
    gl64_t kB232 = (s0_232_0 + s0_232_2) * (tmp3_0 + tmp3_2);
    gl64_t kC232 = (s0_232_1 + s0_232_2) * (tmp3_1 + tmp3_2);
    gl64_t kD232 = s0_232_0 * tmp3_0;
    gl64_t kE232 = s0_232_1 * tmp3_1;
    gl64_t kF232 = s0_232_2 * tmp3_2;
    gl64_t kG232 = kD232 - kE232;
    tmp3_0 = (kC232 + kG232) - kF232;
    tmp3_1 = ((((kA232 + kC232) - kE232) - kE232) - kD232);
    tmp3_2 = kB232 - kG232;
    // Op 233: dim1x1 sub_swap
    gl64_t s0_233 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    gl64_t s1_233 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_233 - s0_233;
    // Op 234: dim3x3 add
    gl64_t s1_234_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_234_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_234_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_234_0; tmp3_7 = tmp3_7 + s1_234_1; tmp3_8 = tmp3_8 + s1_234_2;
    // Op 235: dim3x1 mul
    tmp3_6 = tmp3_6 * tmp1_0; tmp3_7 = tmp3_7 * tmp1_0; tmp3_8 = tmp3_8 * tmp1_0;
    // Op 236: dim1x1 sub_swap
    gl64_t s0_236 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    gl64_t s1_236 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_236 - s0_236;
    // Op 237: dim3x3 add
    gl64_t s1_237_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_237_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_237_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_237_0; tmp3_10 = tmp3_10 + s1_237_1; tmp3_11 = tmp3_11 + s1_237_2;
    // Op 238: dim3x1 mul
    tmp3_9 = tmp3_9 * tmp1_0; tmp3_10 = tmp3_10 * tmp1_0; tmp3_11 = tmp3_11 * tmp1_0;
    // Op 239: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 240: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 241: dim3x3 add
    tmp3_0 = tmp3_3 + tmp3_0; tmp3_1 = tmp3_4 + tmp3_1; tmp3_2 = tmp3_5 + tmp3_2;
    // Op 242: dim3x3 mul
    gl64_t s1_242_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_242_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_242_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA242 = (tmp3_0 + tmp3_1) * (s1_242_0 + s1_242_1);
    gl64_t kB242 = (tmp3_0 + tmp3_2) * (s1_242_0 + s1_242_2);
    gl64_t kC242 = (tmp3_1 + tmp3_2) * (s1_242_1 + s1_242_2);
    gl64_t kD242 = tmp3_0 * s1_242_0;
    gl64_t kE242 = tmp3_1 * s1_242_1;
    gl64_t kF242 = tmp3_2 * s1_242_2;
    gl64_t kG242 = kD242 - kE242;
    tmp3_12 = (kC242 + kG242) - kF242;
    tmp3_13 = ((((kA242 + kC242) - kE242) - kE242) - kD242);
    tmp3_14 = kB242 - kG242;
    // Op 243: dim3x1 mul
    gl64_t s0_243_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_243_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_243_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_243 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 23, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 23, domainSize, nCols_1))];
    tmp3_0 = s0_243_0 * s1_243; tmp3_1 = s0_243_1 * s1_243; tmp3_2 = s0_243_2 * s1_243;
    // Op 244: dim3x1 add
    gl64_t s1_244 = *(gl64_t*)&expressions_params[9][3];
    tmp3_9 = tmp3_0 + s1_244; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 245: dim3x3 add
    gl64_t s1_245_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_245_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_245_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_3 = tmp3_9 + s1_245_0; tmp3_4 = tmp3_10 + s1_245_1; tmp3_5 = tmp3_11 + s1_245_2;
    // Op 246: dim3x1 mul
    gl64_t s0_246_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_246_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_246_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_246 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_1))];
    tmp3_0 = s0_246_0 * s1_246; tmp3_1 = s0_246_1 * s1_246; tmp3_2 = s0_246_2 * s1_246;
    // Op 247: dim3x1 add
    gl64_t s1_247 = *(gl64_t*)&expressions_params[9][3];
    tmp3_6 = tmp3_0 + s1_247; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 248: dim3x3 add
    gl64_t s1_248_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_248_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_248_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_248_0; tmp3_1 = tmp3_7 + s1_248_1; tmp3_2 = tmp3_8 + s1_248_2;
    // Op 249: dim3x3 mul
    gl64_t kA249 = (tmp3_3 + tmp3_4) * (tmp3_0 + tmp3_1);
    gl64_t kB249 = (tmp3_3 + tmp3_5) * (tmp3_0 + tmp3_2);
    gl64_t kC249 = (tmp3_4 + tmp3_5) * (tmp3_1 + tmp3_2);
    gl64_t kD249 = tmp3_3 * tmp3_0;
    gl64_t kE249 = tmp3_4 * tmp3_1;
    gl64_t kF249 = tmp3_5 * tmp3_2;
    gl64_t kG249 = kD249 - kE249;
    tmp3_0 = (kC249 + kG249) - kF249;
    tmp3_1 = ((((kA249 + kC249) - kE249) - kE249) - kD249);
    tmp3_2 = kB249 - kG249;
    // Op 250: dim3x3 mul
    gl64_t s0_250_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 15+0, domainSize, nCols_2))];
    gl64_t s0_250_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 15+1, domainSize, nCols_2))];
    gl64_t s0_250_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 15+2, domainSize, nCols_2))];
    gl64_t kA250 = (s0_250_0 + s0_250_1) * (tmp3_0 + tmp3_1);
    gl64_t kB250 = (s0_250_0 + s0_250_2) * (tmp3_0 + tmp3_2);
    gl64_t kC250 = (s0_250_1 + s0_250_2) * (tmp3_1 + tmp3_2);
    gl64_t kD250 = s0_250_0 * tmp3_0;
    gl64_t kE250 = s0_250_1 * tmp3_1;
    gl64_t kF250 = s0_250_2 * tmp3_2;
    gl64_t kG250 = kD250 - kE250;
    tmp3_0 = (kC250 + kG250) - kF250;
    tmp3_1 = ((((kA250 + kC250) - kE250) - kE250) - kD250);
    tmp3_2 = kB250 - kG250;
    // Op 251: dim1x1 sub_swap
    gl64_t s0_251 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    gl64_t s1_251 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_251 - s0_251;
    // Op 252: dim3x3 add
    gl64_t s1_252_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_252_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_252_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_252_0; tmp3_7 = tmp3_7 + s1_252_1; tmp3_8 = tmp3_8 + s1_252_2;
    // Op 253: dim3x1 mul
    tmp3_6 = tmp3_6 * tmp1_0; tmp3_7 = tmp3_7 * tmp1_0; tmp3_8 = tmp3_8 * tmp1_0;
    // Op 254: dim1x1 sub_swap
    gl64_t s0_254 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    gl64_t s1_254 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_254 - s0_254;
    // Op 255: dim3x3 add
    gl64_t s1_255_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_255_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_255_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_255_0; tmp3_10 = tmp3_10 + s1_255_1; tmp3_11 = tmp3_11 + s1_255_2;
    // Op 256: dim3x1 mul
    tmp3_9 = tmp3_9 * tmp1_0; tmp3_10 = tmp3_10 * tmp1_0; tmp3_11 = tmp3_11 * tmp1_0;
    // Op 257: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 258: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 259: dim3x3 add
    tmp3_0 = tmp3_12 + tmp3_0; tmp3_1 = tmp3_13 + tmp3_1; tmp3_2 = tmp3_14 + tmp3_2;
    // Op 260: dim3x3 mul
    gl64_t s1_260_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_260_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_260_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA260 = (tmp3_0 + tmp3_1) * (s1_260_0 + s1_260_1);
    gl64_t kB260 = (tmp3_0 + tmp3_2) * (s1_260_0 + s1_260_2);
    gl64_t kC260 = (tmp3_1 + tmp3_2) * (s1_260_1 + s1_260_2);
    gl64_t kD260 = tmp3_0 * s1_260_0;
    gl64_t kE260 = tmp3_1 * s1_260_1;
    gl64_t kF260 = tmp3_2 * s1_260_2;
    gl64_t kG260 = kD260 - kE260;
    tmp3_3 = (kC260 + kG260) - kF260;
    tmp3_4 = ((((kA260 + kC260) - kE260) - kE260) - kD260);
    tmp3_5 = kB260 - kG260;
    // Op 261: dim3x1 mul
    gl64_t s0_261_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_261_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_261_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_261 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 15, domainSize, nCols_1))];
    tmp3_0 = s0_261_0 * s1_261; tmp3_1 = s0_261_1 * s1_261; tmp3_2 = s0_261_2 * s1_261;
    // Op 262: dim3x1 add
    gl64_t s1_262 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 16, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 16, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_262; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 263: dim3x3 mul
    gl64_t s1_263_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_263_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_263_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA263 = (tmp3_0 + tmp3_1) * (s1_263_0 + s1_263_1);
    gl64_t kB263 = (tmp3_0 + tmp3_2) * (s1_263_0 + s1_263_2);
    gl64_t kC263 = (tmp3_1 + tmp3_2) * (s1_263_1 + s1_263_2);
    gl64_t kD263 = tmp3_0 * s1_263_0;
    gl64_t kE263 = tmp3_1 * s1_263_1;
    gl64_t kF263 = tmp3_2 * s1_263_2;
    gl64_t kG263 = kD263 - kE263;
    tmp3_0 = (kC263 + kG263) - kF263;
    tmp3_1 = ((((kA263 + kC263) - kE263) - kE263) - kD263);
    tmp3_2 = kB263 - kG263;
    // Op 264: dim3x1 add
    gl64_t s1_264 = *(gl64_t*)&expressions_params[9][2];
    tmp3_9 = tmp3_0 + s1_264; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 265: dim3x3 add
    gl64_t s1_265_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_265_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_265_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_12 = tmp3_9 + s1_265_0; tmp3_13 = tmp3_10 + s1_265_1; tmp3_14 = tmp3_11 + s1_265_2;
    // Op 266: dim1x1 mul
    gl64_t s0_266 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 18, domainSize, nCols_1))];
    gl64_t s1_266 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = s0_266 * s1_266;
    // Op 267: dim1x1 add
    gl64_t s0_267 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    tmp1_0 = s0_267 + tmp1_0;
    // Op 268: dim3x1 mul
    gl64_t s0_268_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_268_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_268_2 = *(gl64_t*)&expressions_params[13][0+2];
    tmp3_0 = s0_268_0 * tmp1_0; tmp3_1 = s0_268_1 * tmp1_0; tmp3_2 = s0_268_2 * tmp1_0;
    // Op 269: dim1x1 mul
    gl64_t s0_269 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 17, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 17, domainSize, nCols_1))];
    gl64_t s1_269 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = s0_269 * s1_269;
    // Op 270: dim1x1 add
    gl64_t s0_270 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    tmp1_0 = s0_270 + tmp1_0;
    // Op 271: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 272: dim3x3 mul
    gl64_t s1_272_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_272_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_272_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA272 = (tmp3_0 + tmp3_1) * (s1_272_0 + s1_272_1);
    gl64_t kB272 = (tmp3_0 + tmp3_2) * (s1_272_0 + s1_272_2);
    gl64_t kC272 = (tmp3_1 + tmp3_2) * (s1_272_1 + s1_272_2);
    gl64_t kD272 = tmp3_0 * s1_272_0;
    gl64_t kE272 = tmp3_1 * s1_272_1;
    gl64_t kF272 = tmp3_2 * s1_272_2;
    gl64_t kG272 = kD272 - kE272;
    tmp3_0 = (kC272 + kG272) - kF272;
    tmp3_1 = ((((kA272 + kC272) - kE272) - kE272) - kD272);
    tmp3_2 = kB272 - kG272;
    // Op 273: dim3x1 add
    gl64_t s1_273 = *(gl64_t*)&expressions_params[9][5];
    tmp3_0 = tmp3_0 + s1_273; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 274: dim3x3 mul
    gl64_t s1_274_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_274_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_274_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA274 = (tmp3_0 + tmp3_1) * (s1_274_0 + s1_274_1);
    gl64_t kB274 = (tmp3_0 + tmp3_2) * (s1_274_0 + s1_274_2);
    gl64_t kC274 = (tmp3_1 + tmp3_2) * (s1_274_1 + s1_274_2);
    gl64_t kD274 = tmp3_0 * s1_274_0;
    gl64_t kE274 = tmp3_1 * s1_274_1;
    gl64_t kF274 = tmp3_2 * s1_274_2;
    gl64_t kG274 = kD274 - kE274;
    tmp3_0 = (kC274 + kG274) - kF274;
    tmp3_1 = ((((kA274 + kC274) - kE274) - kE274) - kD274);
    tmp3_2 = kB274 - kG274;
    // Op 275: dim1x1 mul
    gl64_t s0_275 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_275 = *(gl64_t*)&expressions_params[9][6];
    tmp1_0 = s0_275 * s1_275;
    // Op 276: dim1x1 add
    gl64_t s1_276 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_276;
    // Op 277: dim1x1 add
    gl64_t s0_277 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    tmp1_0 = s0_277 + tmp1_0;
    // Op 278: dim1x1 add
    gl64_t s1_278 = *(gl64_t*)&expressions_params[9][7];
    tmp1_0 = tmp1_0 + s1_278;
    // Op 279: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 280: dim3x3 mul
    gl64_t s1_280_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_280_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_280_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA280 = (tmp3_0 + tmp3_1) * (s1_280_0 + s1_280_1);
    gl64_t kB280 = (tmp3_0 + tmp3_2) * (s1_280_0 + s1_280_2);
    gl64_t kC280 = (tmp3_1 + tmp3_2) * (s1_280_1 + s1_280_2);
    gl64_t kD280 = tmp3_0 * s1_280_0;
    gl64_t kE280 = tmp3_1 * s1_280_1;
    gl64_t kF280 = tmp3_2 * s1_280_2;
    gl64_t kG280 = kD280 - kE280;
    tmp3_0 = (kC280 + kG280) - kF280;
    tmp3_1 = ((((kA280 + kC280) - kE280) - kE280) - kD280);
    tmp3_2 = kB280 - kG280;
    // Op 281: dim1x1 mul
    gl64_t s0_281 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    gl64_t s1_281 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_281 * s1_281;
    // Op 282: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 283: dim3x3 mul
    gl64_t s1_283_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_283_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_283_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA283 = (tmp3_0 + tmp3_1) * (s1_283_0 + s1_283_1);
    gl64_t kB283 = (tmp3_0 + tmp3_2) * (s1_283_0 + s1_283_2);
    gl64_t kC283 = (tmp3_1 + tmp3_2) * (s1_283_1 + s1_283_2);
    gl64_t kD283 = tmp3_0 * s1_283_0;
    gl64_t kE283 = tmp3_1 * s1_283_1;
    gl64_t kF283 = tmp3_2 * s1_283_2;
    gl64_t kG283 = kD283 - kE283;
    tmp3_0 = (kC283 + kG283) - kF283;
    tmp3_1 = ((((kA283 + kC283) - kE283) - kE283) - kD283);
    tmp3_2 = kB283 - kG283;
    // Op 284: dim1x1 add
    gl64_t s0_284 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    gl64_t s1_284 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s0_284 + s1_284;
    // Op 285: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 286: dim3x3 mul
    gl64_t s1_286_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_286_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_286_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA286 = (tmp3_0 + tmp3_1) * (s1_286_0 + s1_286_1);
    gl64_t kB286 = (tmp3_0 + tmp3_2) * (s1_286_0 + s1_286_2);
    gl64_t kC286 = (tmp3_1 + tmp3_2) * (s1_286_1 + s1_286_2);
    gl64_t kD286 = tmp3_0 * s1_286_0;
    gl64_t kE286 = tmp3_1 * s1_286_1;
    gl64_t kF286 = tmp3_2 * s1_286_2;
    gl64_t kG286 = kD286 - kE286;
    tmp3_0 = (kC286 + kG286) - kF286;
    tmp3_1 = ((((kA286 + kC286) - kE286) - kE286) - kD286);
    tmp3_2 = kB286 - kG286;
    // Op 287: dim3x1 add
    gl64_t s1_287 = *(gl64_t*)&expressions_params[9][8];
    tmp3_6 = tmp3_0 + s1_287; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 288: dim3x3 add
    gl64_t s1_288_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_288_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_288_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_288_0; tmp3_1 = tmp3_7 + s1_288_1; tmp3_2 = tmp3_8 + s1_288_2;
    // Op 289: dim3x3 mul
    gl64_t kA289 = (tmp3_12 + tmp3_13) * (tmp3_0 + tmp3_1);
    gl64_t kB289 = (tmp3_12 + tmp3_14) * (tmp3_0 + tmp3_2);
    gl64_t kC289 = (tmp3_13 + tmp3_14) * (tmp3_1 + tmp3_2);
    gl64_t kD289 = tmp3_12 * tmp3_0;
    gl64_t kE289 = tmp3_13 * tmp3_1;
    gl64_t kF289 = tmp3_14 * tmp3_2;
    gl64_t kG289 = kD289 - kE289;
    tmp3_0 = (kC289 + kG289) - kF289;
    tmp3_1 = ((((kA289 + kC289) - kE289) - kE289) - kD289);
    tmp3_2 = kB289 - kG289;
    // Op 290: dim3x3 mul
    gl64_t s0_290_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 18+0, domainSize, nCols_2))];
    gl64_t s0_290_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 18+1, domainSize, nCols_2))];
    gl64_t s0_290_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 18+2, domainSize, nCols_2))];
    gl64_t kA290 = (s0_290_0 + s0_290_1) * (tmp3_0 + tmp3_1);
    gl64_t kB290 = (s0_290_0 + s0_290_2) * (tmp3_0 + tmp3_2);
    gl64_t kC290 = (s0_290_1 + s0_290_2) * (tmp3_1 + tmp3_2);
    gl64_t kD290 = s0_290_0 * tmp3_0;
    gl64_t kE290 = s0_290_1 * tmp3_1;
    gl64_t kF290 = s0_290_2 * tmp3_2;
    gl64_t kG290 = kD290 - kE290;
    tmp3_0 = (kC290 + kG290) - kF290;
    tmp3_1 = ((((kA290 + kC290) - kE290) - kE290) - kD290);
    tmp3_2 = kB290 - kG290;
    // Op 291: dim1x1 sub_swap
    gl64_t s0_291 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    gl64_t s1_291 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_291 - s0_291;
    // Op 292: dim3x3 add
    gl64_t s1_292_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_292_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_292_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_292_0; tmp3_7 = tmp3_7 + s1_292_1; tmp3_8 = tmp3_8 + s1_292_2;
    // Op 293: dim3x1 mul
    tmp3_6 = tmp3_6 * tmp1_0; tmp3_7 = tmp3_7 * tmp1_0; tmp3_8 = tmp3_8 * tmp1_0;
    // Op 294: dim1x1 sub_swap
    gl64_t s0_294 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    gl64_t s1_294 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_294 - s0_294;
    // Op 295: dim3x3 add
    gl64_t s1_295_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_295_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_295_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_295_0; tmp3_10 = tmp3_10 + s1_295_1; tmp3_11 = tmp3_11 + s1_295_2;
    // Op 296: dim3x1 mul
    tmp3_9 = tmp3_9 * tmp1_0; tmp3_10 = tmp3_10 * tmp1_0; tmp3_11 = tmp3_11 * tmp1_0;
    // Op 297: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 298: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 299: dim3x3 add
    tmp3_0 = tmp3_3 + tmp3_0; tmp3_1 = tmp3_4 + tmp3_1; tmp3_2 = tmp3_5 + tmp3_2;
    // Op 300: dim3x3 mul
    gl64_t s1_300_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_300_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_300_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA300 = (tmp3_0 + tmp3_1) * (s1_300_0 + s1_300_1);
    gl64_t kB300 = (tmp3_0 + tmp3_2) * (s1_300_0 + s1_300_2);
    gl64_t kC300 = (tmp3_1 + tmp3_2) * (s1_300_1 + s1_300_2);
    gl64_t kD300 = tmp3_0 * s1_300_0;
    gl64_t kE300 = tmp3_1 * s1_300_1;
    gl64_t kF300 = tmp3_2 * s1_300_2;
    gl64_t kG300 = kD300 - kE300;
    tmp3_12 = (kC300 + kG300) - kF300;
    tmp3_13 = ((((kA300 + kC300) - kE300) - kE300) - kD300);
    tmp3_14 = kB300 - kG300;
    // Op 301: dim1x1 mul
    gl64_t s0_301 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 20, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 20, domainSize, nCols_1))];
    gl64_t s1_301 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = s0_301 * s1_301;
    // Op 302: dim1x1 add
    gl64_t s0_302 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    tmp1_0 = s0_302 + tmp1_0;
    // Op 303: dim3x1 mul
    gl64_t s0_303_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_303_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_303_2 = *(gl64_t*)&expressions_params[13][0+2];
    tmp3_0 = s0_303_0 * tmp1_0; tmp3_1 = s0_303_1 * tmp1_0; tmp3_2 = s0_303_2 * tmp1_0;
    // Op 304: dim1x1 mul
    gl64_t s0_304 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 19, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 19, domainSize, nCols_1))];
    gl64_t s1_304 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = s0_304 * s1_304;
    // Op 305: dim1x1 add
    gl64_t s0_305 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    tmp1_0 = s0_305 + tmp1_0;
    // Op 306: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 307: dim3x3 mul
    gl64_t s1_307_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_307_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_307_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA307 = (tmp3_0 + tmp3_1) * (s1_307_0 + s1_307_1);
    gl64_t kB307 = (tmp3_0 + tmp3_2) * (s1_307_0 + s1_307_2);
    gl64_t kC307 = (tmp3_1 + tmp3_2) * (s1_307_1 + s1_307_2);
    gl64_t kD307 = tmp3_0 * s1_307_0;
    gl64_t kE307 = tmp3_1 * s1_307_1;
    gl64_t kF307 = tmp3_2 * s1_307_2;
    gl64_t kG307 = kD307 - kE307;
    tmp3_0 = (kC307 + kG307) - kF307;
    tmp3_1 = ((((kA307 + kC307) - kE307) - kE307) - kD307);
    tmp3_2 = kB307 - kG307;
    // Op 308: dim3x1 add
    gl64_t s1_308 = *(gl64_t*)&expressions_params[9][5];
    tmp3_0 = tmp3_0 + s1_308; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 309: dim3x3 mul
    gl64_t s1_309_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_309_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_309_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA309 = (tmp3_0 + tmp3_1) * (s1_309_0 + s1_309_1);
    gl64_t kB309 = (tmp3_0 + tmp3_2) * (s1_309_0 + s1_309_2);
    gl64_t kC309 = (tmp3_1 + tmp3_2) * (s1_309_1 + s1_309_2);
    gl64_t kD309 = tmp3_0 * s1_309_0;
    gl64_t kE309 = tmp3_1 * s1_309_1;
    gl64_t kF309 = tmp3_2 * s1_309_2;
    gl64_t kG309 = kD309 - kE309;
    tmp3_0 = (kC309 + kG309) - kF309;
    tmp3_1 = ((((kA309 + kC309) - kE309) - kE309) - kD309);
    tmp3_2 = kB309 - kG309;
    // Op 310: dim1x1 mul
    gl64_t s0_310 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_310 = *(gl64_t*)&expressions_params[9][6];
    tmp1_0 = s0_310 * s1_310;
    // Op 311: dim1x1 add
    gl64_t s1_311 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_311;
    // Op 312: dim1x1 add
    gl64_t s0_312 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    tmp1_0 = s0_312 + tmp1_0;
    // Op 313: dim1x1 add
    gl64_t s1_313 = *(gl64_t*)&expressions_params[9][7];
    tmp1_0 = tmp1_0 + s1_313;
    // Op 314: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 315: dim3x3 mul
    gl64_t s1_315_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_315_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_315_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA315 = (tmp3_0 + tmp3_1) * (s1_315_0 + s1_315_1);
    gl64_t kB315 = (tmp3_0 + tmp3_2) * (s1_315_0 + s1_315_2);
    gl64_t kC315 = (tmp3_1 + tmp3_2) * (s1_315_1 + s1_315_2);
    gl64_t kD315 = tmp3_0 * s1_315_0;
    gl64_t kE315 = tmp3_1 * s1_315_1;
    gl64_t kF315 = tmp3_2 * s1_315_2;
    gl64_t kG315 = kD315 - kE315;
    tmp3_0 = (kC315 + kG315) - kF315;
    tmp3_1 = ((((kA315 + kC315) - kE315) - kE315) - kD315);
    tmp3_2 = kB315 - kG315;
    // Op 316: dim1x1 mul
    gl64_t s0_316 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    gl64_t s1_316 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_316 * s1_316;
    // Op 317: dim1x1 add
    gl64_t s1_317 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = tmp1_0 + s1_317;
    // Op 318: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 319: dim3x3 mul
    gl64_t s1_319_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_319_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_319_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA319 = (tmp3_0 + tmp3_1) * (s1_319_0 + s1_319_1);
    gl64_t kB319 = (tmp3_0 + tmp3_2) * (s1_319_0 + s1_319_2);
    gl64_t kC319 = (tmp3_1 + tmp3_2) * (s1_319_1 + s1_319_2);
    gl64_t kD319 = tmp3_0 * s1_319_0;
    gl64_t kE319 = tmp3_1 * s1_319_1;
    gl64_t kF319 = tmp3_2 * s1_319_2;
    gl64_t kG319 = kD319 - kE319;
    tmp3_0 = (kC319 + kG319) - kF319;
    tmp3_1 = ((((kA319 + kC319) - kE319) - kE319) - kD319);
    tmp3_2 = kB319 - kG319;
    // Op 320: dim1x1 add
    gl64_t s0_320 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    gl64_t s1_320 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s0_320 + s1_320;
    // Op 321: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 322: dim3x3 mul
    gl64_t s1_322_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_322_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_322_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA322 = (tmp3_0 + tmp3_1) * (s1_322_0 + s1_322_1);
    gl64_t kB322 = (tmp3_0 + tmp3_2) * (s1_322_0 + s1_322_2);
    gl64_t kC322 = (tmp3_1 + tmp3_2) * (s1_322_1 + s1_322_2);
    gl64_t kD322 = tmp3_0 * s1_322_0;
    gl64_t kE322 = tmp3_1 * s1_322_1;
    gl64_t kF322 = tmp3_2 * s1_322_2;
    gl64_t kG322 = kD322 - kE322;
    tmp3_0 = (kC322 + kG322) - kF322;
    tmp3_1 = ((((kA322 + kC322) - kE322) - kE322) - kD322);
    tmp3_2 = kB322 - kG322;
    // Op 323: dim3x1 add
    gl64_t s1_323 = *(gl64_t*)&expressions_params[9][8];
    tmp3_9 = tmp3_0 + s1_323; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 324: dim3x3 add
    gl64_t s1_324_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_324_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_324_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_3 = tmp3_9 + s1_324_0; tmp3_4 = tmp3_10 + s1_324_1; tmp3_5 = tmp3_11 + s1_324_2;
    // Op 325: dim1x1 mul
    gl64_t s0_325 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 22, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 22, domainSize, nCols_1))];
    gl64_t s1_325 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = s0_325 * s1_325;
    // Op 326: dim1x1 add
    gl64_t s0_326 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 14, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 14, domainSize, nCols_1))];
    tmp1_0 = s0_326 + tmp1_0;
    // Op 327: dim3x1 mul
    gl64_t s0_327_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_327_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_327_2 = *(gl64_t*)&expressions_params[13][0+2];
    tmp3_0 = s0_327_0 * tmp1_0; tmp3_1 = s0_327_1 * tmp1_0; tmp3_2 = s0_327_2 * tmp1_0;
    // Op 328: dim1x1 mul
    gl64_t s0_328 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 21, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 21, domainSize, nCols_1))];
    gl64_t s1_328 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = s0_328 * s1_328;
    // Op 329: dim1x1 add
    gl64_t s0_329 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    tmp1_0 = s0_329 + tmp1_0;
    // Op 330: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 331: dim3x3 mul
    gl64_t s1_331_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_331_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_331_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA331 = (tmp3_0 + tmp3_1) * (s1_331_0 + s1_331_1);
    gl64_t kB331 = (tmp3_0 + tmp3_2) * (s1_331_0 + s1_331_2);
    gl64_t kC331 = (tmp3_1 + tmp3_2) * (s1_331_1 + s1_331_2);
    gl64_t kD331 = tmp3_0 * s1_331_0;
    gl64_t kE331 = tmp3_1 * s1_331_1;
    gl64_t kF331 = tmp3_2 * s1_331_2;
    gl64_t kG331 = kD331 - kE331;
    tmp3_0 = (kC331 + kG331) - kF331;
    tmp3_1 = ((((kA331 + kC331) - kE331) - kE331) - kD331);
    tmp3_2 = kB331 - kG331;
    // Op 332: dim3x1 add
    gl64_t s1_332 = *(gl64_t*)&expressions_params[9][5];
    tmp3_0 = tmp3_0 + s1_332; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 333: dim3x3 mul
    gl64_t s1_333_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_333_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_333_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA333 = (tmp3_0 + tmp3_1) * (s1_333_0 + s1_333_1);
    gl64_t kB333 = (tmp3_0 + tmp3_2) * (s1_333_0 + s1_333_2);
    gl64_t kC333 = (tmp3_1 + tmp3_2) * (s1_333_1 + s1_333_2);
    gl64_t kD333 = tmp3_0 * s1_333_0;
    gl64_t kE333 = tmp3_1 * s1_333_1;
    gl64_t kF333 = tmp3_2 * s1_333_2;
    gl64_t kG333 = kD333 - kE333;
    tmp3_0 = (kC333 + kG333) - kF333;
    tmp3_1 = ((((kA333 + kC333) - kE333) - kE333) - kD333);
    tmp3_2 = kB333 - kG333;
    // Op 334: dim1x1 mul
    gl64_t s0_334 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_334 = *(gl64_t*)&expressions_params[9][6];
    tmp1_0 = s0_334 * s1_334;
    // Op 335: dim1x1 add
    gl64_t s1_335 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_335;
    // Op 336: dim1x1 add
    gl64_t s0_336 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    tmp1_0 = s0_336 + tmp1_0;
    // Op 337: dim1x1 add
    gl64_t s1_337 = *(gl64_t*)&expressions_params[9][7];
    tmp1_0 = tmp1_0 + s1_337;
    // Op 338: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 339: dim3x3 mul
    gl64_t s1_339_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_339_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_339_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA339 = (tmp3_0 + tmp3_1) * (s1_339_0 + s1_339_1);
    gl64_t kB339 = (tmp3_0 + tmp3_2) * (s1_339_0 + s1_339_2);
    gl64_t kC339 = (tmp3_1 + tmp3_2) * (s1_339_1 + s1_339_2);
    gl64_t kD339 = tmp3_0 * s1_339_0;
    gl64_t kE339 = tmp3_1 * s1_339_1;
    gl64_t kF339 = tmp3_2 * s1_339_2;
    gl64_t kG339 = kD339 - kE339;
    tmp3_0 = (kC339 + kG339) - kF339;
    tmp3_1 = ((((kA339 + kC339) - kE339) - kE339) - kD339);
    tmp3_2 = kB339 - kG339;
    // Op 340: dim1x1 mul
    gl64_t s0_340 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    gl64_t s1_340 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_340 * s1_340;
    // Op 341: dim1x1 add
    gl64_t s1_341 = *(gl64_t*)&expressions_params[9][9];
    tmp1_0 = tmp1_0 + s1_341;
    // Op 342: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 343: dim3x3 mul
    gl64_t s1_343_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_343_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_343_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA343 = (tmp3_0 + tmp3_1) * (s1_343_0 + s1_343_1);
    gl64_t kB343 = (tmp3_0 + tmp3_2) * (s1_343_0 + s1_343_2);
    gl64_t kC343 = (tmp3_1 + tmp3_2) * (s1_343_1 + s1_343_2);
    gl64_t kD343 = tmp3_0 * s1_343_0;
    gl64_t kE343 = tmp3_1 * s1_343_1;
    gl64_t kF343 = tmp3_2 * s1_343_2;
    gl64_t kG343 = kD343 - kE343;
    tmp3_0 = (kC343 + kG343) - kF343;
    tmp3_1 = ((((kA343 + kC343) - kE343) - kE343) - kD343);
    tmp3_2 = kB343 - kG343;
    // Op 344: dim1x1 add
    gl64_t s0_344 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    gl64_t s1_344 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s0_344 + s1_344;
    // Op 345: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 346: dim3x3 mul
    gl64_t s1_346_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_346_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_346_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA346 = (tmp3_0 + tmp3_1) * (s1_346_0 + s1_346_1);
    gl64_t kB346 = (tmp3_0 + tmp3_2) * (s1_346_0 + s1_346_2);
    gl64_t kC346 = (tmp3_1 + tmp3_2) * (s1_346_1 + s1_346_2);
    gl64_t kD346 = tmp3_0 * s1_346_0;
    gl64_t kE346 = tmp3_1 * s1_346_1;
    gl64_t kF346 = tmp3_2 * s1_346_2;
    gl64_t kG346 = kD346 - kE346;
    tmp3_0 = (kC346 + kG346) - kF346;
    tmp3_1 = ((((kA346 + kC346) - kE346) - kE346) - kD346);
    tmp3_2 = kB346 - kG346;
    // Op 347: dim3x1 add
    gl64_t s1_347 = *(gl64_t*)&expressions_params[9][8];
    tmp3_6 = tmp3_0 + s1_347; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 348: dim3x3 add
    gl64_t s1_348_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_348_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_348_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_348_0; tmp3_1 = tmp3_7 + s1_348_1; tmp3_2 = tmp3_8 + s1_348_2;
    // Op 349: dim3x3 mul
    gl64_t kA349 = (tmp3_3 + tmp3_4) * (tmp3_0 + tmp3_1);
    gl64_t kB349 = (tmp3_3 + tmp3_5) * (tmp3_0 + tmp3_2);
    gl64_t kC349 = (tmp3_4 + tmp3_5) * (tmp3_1 + tmp3_2);
    gl64_t kD349 = tmp3_3 * tmp3_0;
    gl64_t kE349 = tmp3_4 * tmp3_1;
    gl64_t kF349 = tmp3_5 * tmp3_2;
    gl64_t kG349 = kD349 - kE349;
    tmp3_0 = (kC349 + kG349) - kF349;
    tmp3_1 = ((((kA349 + kC349) - kE349) - kE349) - kD349);
    tmp3_2 = kB349 - kG349;
    // Op 350: dim3x3 mul
    uint64_t s0_350_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 21, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 21, domainSize, nCols_2));
    gl64_t s0_350_0 = *(gl64_t*)&dParams->aux_trace[s0_350_pos];
    gl64_t s0_350_1 = *(gl64_t*)&dParams->aux_trace[s0_350_pos + TILE_HEIGHT];
    gl64_t s0_350_2 = *(gl64_t*)&dParams->aux_trace[s0_350_pos + 2*TILE_HEIGHT];
    gl64_t kA350 = (s0_350_0 + s0_350_1) * (tmp3_0 + tmp3_1);
    gl64_t kB350 = (s0_350_0 + s0_350_2) * (tmp3_0 + tmp3_2);
    gl64_t kC350 = (s0_350_1 + s0_350_2) * (tmp3_1 + tmp3_2);
    gl64_t kD350 = s0_350_0 * tmp3_0;
    gl64_t kE350 = s0_350_1 * tmp3_1;
    gl64_t kF350 = s0_350_2 * tmp3_2;
    gl64_t kG350 = kD350 - kE350;
    tmp3_0 = (kC350 + kG350) - kF350;
    tmp3_1 = ((((kA350 + kC350) - kE350) - kE350) - kD350);
    tmp3_2 = kB350 - kG350;
    // Op 351: dim1x1 sub_swap
    gl64_t s0_351 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    gl64_t s1_351 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_351 - s0_351;
    // Op 352: dim3x3 add
    gl64_t s1_352_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_352_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_352_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_352_0; tmp3_7 = tmp3_7 + s1_352_1; tmp3_8 = tmp3_8 + s1_352_2;
    // Op 353: dim3x1 mul
    tmp3_6 = tmp3_6 * tmp1_0; tmp3_7 = tmp3_7 * tmp1_0; tmp3_8 = tmp3_8 * tmp1_0;
    // Op 354: dim1x1 sub_swap
    gl64_t s0_354 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    gl64_t s1_354 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_354 - s0_354;
    // Op 355: dim3x3 add
    gl64_t s1_355_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_355_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_355_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_355_0; tmp3_10 = tmp3_10 + s1_355_1; tmp3_11 = tmp3_11 + s1_355_2;
    // Op 356: dim3x1 mul
    tmp3_9 = tmp3_9 * tmp1_0; tmp3_10 = tmp3_10 * tmp1_0; tmp3_11 = tmp3_11 * tmp1_0;
    // Op 357: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 358: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 359: dim3x3 add
    tmp3_0 = tmp3_12 + tmp3_0; tmp3_1 = tmp3_13 + tmp3_1; tmp3_2 = tmp3_14 + tmp3_2;
    // Op 360: dim3x3 mul
    gl64_t s1_360_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_360_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_360_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA360 = (tmp3_0 + tmp3_1) * (s1_360_0 + s1_360_1);
    gl64_t kB360 = (tmp3_0 + tmp3_2) * (s1_360_0 + s1_360_2);
    gl64_t kC360 = (tmp3_1 + tmp3_2) * (s1_360_1 + s1_360_2);
    gl64_t kD360 = tmp3_0 * s1_360_0;
    gl64_t kE360 = tmp3_1 * s1_360_1;
    gl64_t kF360 = tmp3_2 * s1_360_2;
    gl64_t kG360 = kD360 - kE360;
    tmp3_3 = (kC360 + kG360) - kF360;
    tmp3_4 = ((((kA360 + kC360) - kE360) - kE360) - kD360);
    tmp3_5 = kB360 - kG360;
    // Op 361: dim1x1 mul
    gl64_t s0_361 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_1))];
    gl64_t s1_361 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = s0_361 * s1_361;
    // Op 362: dim1x1 add
    gl64_t s0_362 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 16, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 16, domainSize, nCols_1))];
    tmp1_0 = s0_362 + tmp1_0;
    // Op 363: dim3x1 mul
    gl64_t s0_363_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_363_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_363_2 = *(gl64_t*)&expressions_params[13][0+2];
    tmp3_0 = s0_363_0 * tmp1_0; tmp3_1 = s0_363_1 * tmp1_0; tmp3_2 = s0_363_2 * tmp1_0;
    // Op 364: dim1x1 mul
    gl64_t s0_364 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 23, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 23, domainSize, nCols_1))];
    gl64_t s1_364 = *(gl64_t*)&expressions_params[9][4];
    tmp1_0 = s0_364 * s1_364;
    // Op 365: dim1x1 add
    gl64_t s0_365 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 15, domainSize, nCols_1))];
    tmp1_0 = s0_365 + tmp1_0;
    // Op 366: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 367: dim3x3 mul
    gl64_t s1_367_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_367_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_367_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA367 = (tmp3_0 + tmp3_1) * (s1_367_0 + s1_367_1);
    gl64_t kB367 = (tmp3_0 + tmp3_2) * (s1_367_0 + s1_367_2);
    gl64_t kC367 = (tmp3_1 + tmp3_2) * (s1_367_1 + s1_367_2);
    gl64_t kD367 = tmp3_0 * s1_367_0;
    gl64_t kE367 = tmp3_1 * s1_367_1;
    gl64_t kF367 = tmp3_2 * s1_367_2;
    gl64_t kG367 = kD367 - kE367;
    tmp3_0 = (kC367 + kG367) - kF367;
    tmp3_1 = ((((kA367 + kC367) - kE367) - kE367) - kD367);
    tmp3_2 = kB367 - kG367;
    // Op 368: dim3x1 add
    gl64_t s1_368 = *(gl64_t*)&expressions_params[9][5];
    tmp3_0 = tmp3_0 + s1_368; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 369: dim3x3 mul
    gl64_t s1_369_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_369_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_369_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA369 = (tmp3_0 + tmp3_1) * (s1_369_0 + s1_369_1);
    gl64_t kB369 = (tmp3_0 + tmp3_2) * (s1_369_0 + s1_369_2);
    gl64_t kC369 = (tmp3_1 + tmp3_2) * (s1_369_1 + s1_369_2);
    gl64_t kD369 = tmp3_0 * s1_369_0;
    gl64_t kE369 = tmp3_1 * s1_369_1;
    gl64_t kF369 = tmp3_2 * s1_369_2;
    gl64_t kG369 = kD369 - kE369;
    tmp3_0 = (kC369 + kG369) - kF369;
    tmp3_1 = ((((kA369 + kC369) - kE369) - kE369) - kD369);
    tmp3_2 = kB369 - kG369;
    // Op 370: dim1x1 mul
    gl64_t s0_370 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_370 = *(gl64_t*)&expressions_params[9][6];
    tmp1_0 = s0_370 * s1_370;
    // Op 371: dim1x1 add
    gl64_t s1_371 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_371;
    // Op 372: dim1x1 add
    gl64_t s0_372 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    tmp1_0 = s0_372 + tmp1_0;
    // Op 373: dim1x1 add
    gl64_t s1_373 = *(gl64_t*)&expressions_params[9][7];
    tmp1_0 = tmp1_0 + s1_373;
    // Op 374: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 375: dim3x3 mul
    gl64_t s1_375_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_375_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_375_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA375 = (tmp3_0 + tmp3_1) * (s1_375_0 + s1_375_1);
    gl64_t kB375 = (tmp3_0 + tmp3_2) * (s1_375_0 + s1_375_2);
    gl64_t kC375 = (tmp3_1 + tmp3_2) * (s1_375_1 + s1_375_2);
    gl64_t kD375 = tmp3_0 * s1_375_0;
    gl64_t kE375 = tmp3_1 * s1_375_1;
    gl64_t kF375 = tmp3_2 * s1_375_2;
    gl64_t kG375 = kD375 - kE375;
    tmp3_0 = (kC375 + kG375) - kF375;
    tmp3_1 = ((((kA375 + kC375) - kE375) - kE375) - kD375);
    tmp3_2 = kB375 - kG375;
    // Op 376: dim1x1 mul
    gl64_t s0_376 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    gl64_t s1_376 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_376 * s1_376;
    // Op 377: dim1x1 add
    gl64_t s1_377 = *(gl64_t*)&expressions_params[9][12];
    tmp1_0 = tmp1_0 + s1_377;
    // Op 378: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 379: dim3x3 mul
    gl64_t s1_379_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_379_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_379_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA379 = (tmp3_0 + tmp3_1) * (s1_379_0 + s1_379_1);
    gl64_t kB379 = (tmp3_0 + tmp3_2) * (s1_379_0 + s1_379_2);
    gl64_t kC379 = (tmp3_1 + tmp3_2) * (s1_379_1 + s1_379_2);
    gl64_t kD379 = tmp3_0 * s1_379_0;
    gl64_t kE379 = tmp3_1 * s1_379_1;
    gl64_t kF379 = tmp3_2 * s1_379_2;
    gl64_t kG379 = kD379 - kE379;
    tmp3_0 = (kC379 + kG379) - kF379;
    tmp3_1 = ((((kA379 + kC379) - kE379) - kE379) - kD379);
    tmp3_2 = kB379 - kG379;
    // Op 380: dim1x1 add
    gl64_t s0_380 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    gl64_t s1_380 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s0_380 + s1_380;
    // Op 381: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 382: dim3x3 mul
    gl64_t s1_382_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_382_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_382_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA382 = (tmp3_0 + tmp3_1) * (s1_382_0 + s1_382_1);
    gl64_t kB382 = (tmp3_0 + tmp3_2) * (s1_382_0 + s1_382_2);
    gl64_t kC382 = (tmp3_1 + tmp3_2) * (s1_382_1 + s1_382_2);
    gl64_t kD382 = tmp3_0 * s1_382_0;
    gl64_t kE382 = tmp3_1 * s1_382_1;
    gl64_t kF382 = tmp3_2 * s1_382_2;
    gl64_t kG382 = kD382 - kE382;
    tmp3_0 = (kC382 + kG382) - kF382;
    tmp3_1 = ((((kA382 + kC382) - kE382) - kE382) - kD382);
    tmp3_2 = kB382 - kG382;
    // Op 383: dim3x1 add
    gl64_t s1_383 = *(gl64_t*)&expressions_params[9][8];
    tmp3_9 = tmp3_0 + s1_383; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 384: dim3x3 add
    gl64_t s1_384_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_384_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_384_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_12 = tmp3_9 + s1_384_0; tmp3_13 = tmp3_10 + s1_384_1; tmp3_14 = tmp3_11 + s1_384_2;
    // Op 385: dim3x1 mul
    gl64_t s0_385_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_385_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_385_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_385 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    tmp3_0 = s0_385_0 * s1_385; tmp3_1 = s0_385_1 * s1_385; tmp3_2 = s0_385_2 * s1_385;
    // Op 386: dim3x3 mul
    gl64_t s1_386_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_386_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_386_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA386 = (tmp3_0 + tmp3_1) * (s1_386_0 + s1_386_1);
    gl64_t kB386 = (tmp3_0 + tmp3_2) * (s1_386_0 + s1_386_2);
    gl64_t kC386 = (tmp3_1 + tmp3_2) * (s1_386_1 + s1_386_2);
    gl64_t kD386 = tmp3_0 * s1_386_0;
    gl64_t kE386 = tmp3_1 * s1_386_1;
    gl64_t kF386 = tmp3_2 * s1_386_2;
    gl64_t kG386 = kD386 - kE386;
    tmp3_0 = (kC386 + kG386) - kF386;
    tmp3_1 = ((((kA386 + kC386) - kE386) - kE386) - kD386);
    tmp3_2 = kB386 - kG386;
    // Op 387: dim3x3 mul
    gl64_t s1_387_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_387_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_387_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA387 = (tmp3_0 + tmp3_1) * (s1_387_0 + s1_387_1);
    gl64_t kB387 = (tmp3_0 + tmp3_2) * (s1_387_0 + s1_387_2);
    gl64_t kC387 = (tmp3_1 + tmp3_2) * (s1_387_1 + s1_387_2);
    gl64_t kD387 = tmp3_0 * s1_387_0;
    gl64_t kE387 = tmp3_1 * s1_387_1;
    gl64_t kF387 = tmp3_2 * s1_387_2;
    gl64_t kG387 = kD387 - kE387;
    tmp3_0 = (kC387 + kG387) - kF387;
    tmp3_1 = ((((kA387 + kC387) - kE387) - kE387) - kD387);
    tmp3_2 = kB387 - kG387;
    // Op 388: dim1x1 mul
    gl64_t s0_388 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    gl64_t s1_388 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_388 * s1_388;
    // Op 389: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 390: dim3x3 mul
    gl64_t s1_390_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_390_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_390_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA390 = (tmp3_0 + tmp3_1) * (s1_390_0 + s1_390_1);
    gl64_t kB390 = (tmp3_0 + tmp3_2) * (s1_390_0 + s1_390_2);
    gl64_t kC390 = (tmp3_1 + tmp3_2) * (s1_390_1 + s1_390_2);
    gl64_t kD390 = tmp3_0 * s1_390_0;
    gl64_t kE390 = tmp3_1 * s1_390_1;
    gl64_t kF390 = tmp3_2 * s1_390_2;
    gl64_t kG390 = kD390 - kE390;
    tmp3_0 = (kC390 + kG390) - kF390;
    tmp3_1 = ((((kA390 + kC390) - kE390) - kE390) - kD390);
    tmp3_2 = kB390 - kG390;
    // Op 391: dim3x3 mul
    gl64_t s1_391_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_391_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_391_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA391 = (tmp3_0 + tmp3_1) * (s1_391_0 + s1_391_1);
    gl64_t kB391 = (tmp3_0 + tmp3_2) * (s1_391_0 + s1_391_2);
    gl64_t kC391 = (tmp3_1 + tmp3_2) * (s1_391_1 + s1_391_2);
    gl64_t kD391 = tmp3_0 * s1_391_0;
    gl64_t kE391 = tmp3_1 * s1_391_1;
    gl64_t kF391 = tmp3_2 * s1_391_2;
    gl64_t kG391 = kD391 - kE391;
    tmp3_0 = (kC391 + kG391) - kF391;
    tmp3_1 = ((((kA391 + kC391) - kE391) - kE391) - kD391);
    tmp3_2 = kB391 - kG391;
    // Op 392: dim1x1 mul
    gl64_t s0_392 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_392 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_392 * s1_392;
    // Op 393: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 394: dim3x3 mul
    gl64_t s1_394_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_394_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_394_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA394 = (tmp3_0 + tmp3_1) * (s1_394_0 + s1_394_1);
    gl64_t kB394 = (tmp3_0 + tmp3_2) * (s1_394_0 + s1_394_2);
    gl64_t kC394 = (tmp3_1 + tmp3_2) * (s1_394_1 + s1_394_2);
    gl64_t kD394 = tmp3_0 * s1_394_0;
    gl64_t kE394 = tmp3_1 * s1_394_1;
    gl64_t kF394 = tmp3_2 * s1_394_2;
    gl64_t kG394 = kD394 - kE394;
    tmp3_0 = (kC394 + kG394) - kF394;
    tmp3_1 = ((((kA394 + kC394) - kE394) - kE394) - kD394);
    tmp3_2 = kB394 - kG394;
    // Op 395: dim3x3 mul
    gl64_t s1_395_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_395_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_395_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA395 = (tmp3_0 + tmp3_1) * (s1_395_0 + s1_395_1);
    gl64_t kB395 = (tmp3_0 + tmp3_2) * (s1_395_0 + s1_395_2);
    gl64_t kC395 = (tmp3_1 + tmp3_2) * (s1_395_1 + s1_395_2);
    gl64_t kD395 = tmp3_0 * s1_395_0;
    gl64_t kE395 = tmp3_1 * s1_395_1;
    gl64_t kF395 = tmp3_2 * s1_395_2;
    gl64_t kG395 = kD395 - kE395;
    tmp3_0 = (kC395 + kG395) - kF395;
    tmp3_1 = ((((kA395 + kC395) - kE395) - kE395) - kD395);
    tmp3_2 = kB395 - kG395;
    // Op 396: dim1x1 mul
    gl64_t s0_396 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    gl64_t s1_396 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_396 * s1_396;
    // Op 397: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 398: dim3x3 mul
    gl64_t s1_398_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_398_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_398_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA398 = (tmp3_0 + tmp3_1) * (s1_398_0 + s1_398_1);
    gl64_t kB398 = (tmp3_0 + tmp3_2) * (s1_398_0 + s1_398_2);
    gl64_t kC398 = (tmp3_1 + tmp3_2) * (s1_398_1 + s1_398_2);
    gl64_t kD398 = tmp3_0 * s1_398_0;
    gl64_t kE398 = tmp3_1 * s1_398_1;
    gl64_t kF398 = tmp3_2 * s1_398_2;
    gl64_t kG398 = kD398 - kE398;
    tmp3_0 = (kC398 + kG398) - kF398;
    tmp3_1 = ((((kA398 + kC398) - kE398) - kE398) - kD398);
    tmp3_2 = kB398 - kG398;
    // Op 399: dim1x1 mul
    gl64_t s0_399 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    gl64_t s1_399 = *(gl64_t*)&expressions_params[9][10];
    tmp1_0 = s0_399 * s1_399;
    // Op 400: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 401: dim3x3 mul
    gl64_t s1_401_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_401_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_401_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA401 = (tmp3_0 + tmp3_1) * (s1_401_0 + s1_401_1);
    gl64_t kB401 = (tmp3_0 + tmp3_2) * (s1_401_0 + s1_401_2);
    gl64_t kC401 = (tmp3_1 + tmp3_2) * (s1_401_1 + s1_401_2);
    gl64_t kD401 = tmp3_0 * s1_401_0;
    gl64_t kE401 = tmp3_1 * s1_401_1;
    gl64_t kF401 = tmp3_2 * s1_401_2;
    gl64_t kG401 = kD401 - kE401;
    tmp3_0 = (kC401 + kG401) - kF401;
    tmp3_1 = ((((kA401 + kC401) - kE401) - kE401) - kD401);
    tmp3_2 = kB401 - kG401;
    // Op 402: dim3x1 add
    gl64_t s1_402 = *(gl64_t*)&expressions_params[9][11];
    tmp3_6 = tmp3_0 + s1_402; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 403: dim3x3 add
    gl64_t s1_403_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_403_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_403_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_403_0; tmp3_1 = tmp3_7 + s1_403_1; tmp3_2 = tmp3_8 + s1_403_2;
    // Op 404: dim3x3 mul
    gl64_t kA404 = (tmp3_12 + tmp3_13) * (tmp3_0 + tmp3_1);
    gl64_t kB404 = (tmp3_12 + tmp3_14) * (tmp3_0 + tmp3_2);
    gl64_t kC404 = (tmp3_13 + tmp3_14) * (tmp3_1 + tmp3_2);
    gl64_t kD404 = tmp3_12 * tmp3_0;
    gl64_t kE404 = tmp3_13 * tmp3_1;
    gl64_t kF404 = tmp3_14 * tmp3_2;
    gl64_t kG404 = kD404 - kE404;
    tmp3_0 = (kC404 + kG404) - kF404;
    tmp3_1 = ((((kA404 + kC404) - kE404) - kE404) - kD404);
    tmp3_2 = kB404 - kG404;
    // Op 405: dim3x3 mul
    uint64_t s0_405_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_2));
    gl64_t s0_405_0 = *(gl64_t*)&dParams->aux_trace[s0_405_pos];
    gl64_t s0_405_1 = *(gl64_t*)&dParams->aux_trace[s0_405_pos + TILE_HEIGHT];
    gl64_t s0_405_2 = *(gl64_t*)&dParams->aux_trace[s0_405_pos + 2*TILE_HEIGHT];
    gl64_t kA405 = (s0_405_0 + s0_405_1) * (tmp3_0 + tmp3_1);
    gl64_t kB405 = (s0_405_0 + s0_405_2) * (tmp3_0 + tmp3_2);
    gl64_t kC405 = (s0_405_1 + s0_405_2) * (tmp3_1 + tmp3_2);
    gl64_t kD405 = s0_405_0 * tmp3_0;
    gl64_t kE405 = s0_405_1 * tmp3_1;
    gl64_t kF405 = s0_405_2 * tmp3_2;
    gl64_t kG405 = kD405 - kE405;
    tmp3_0 = (kC405 + kG405) - kF405;
    tmp3_1 = ((((kA405 + kC405) - kE405) - kE405) - kD405);
    tmp3_2 = kB405 - kG405;
    // Op 406: dim1x1 sub_swap
    gl64_t s0_406 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    gl64_t s1_406 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_406 - s0_406;
    // Op 407: dim3x3 add
    gl64_t s1_407_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_407_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_407_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_407_0; tmp3_7 = tmp3_7 + s1_407_1; tmp3_8 = tmp3_8 + s1_407_2;
    // Op 408: dim3x1 mul
    tmp3_6 = tmp3_6 * tmp1_0; tmp3_7 = tmp3_7 * tmp1_0; tmp3_8 = tmp3_8 * tmp1_0;
    // Op 409: dim3x3 add
    gl64_t s1_409_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_409_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_409_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_409_0; tmp3_10 = tmp3_10 + s1_409_1; tmp3_11 = tmp3_11 + s1_409_2;
    // Op 410: dim3x1 mul
    gl64_t s1_410 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 1, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 1, domainSize, nCols_1))];
    tmp3_9 = tmp3_9 * s1_410; tmp3_10 = tmp3_10 * s1_410; tmp3_11 = tmp3_11 * s1_410;
    // Op 411: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 412: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 413: dim3x3 add
    tmp3_0 = tmp3_3 + tmp3_0; tmp3_1 = tmp3_4 + tmp3_1; tmp3_2 = tmp3_5 + tmp3_2;
    // Op 414: dim3x3 mul
    gl64_t s1_414_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_414_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_414_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA414 = (tmp3_0 + tmp3_1) * (s1_414_0 + s1_414_1);
    gl64_t kB414 = (tmp3_0 + tmp3_2) * (s1_414_0 + s1_414_2);
    gl64_t kC414 = (tmp3_1 + tmp3_2) * (s1_414_1 + s1_414_2);
    gl64_t kD414 = tmp3_0 * s1_414_0;
    gl64_t kE414 = tmp3_1 * s1_414_1;
    gl64_t kF414 = tmp3_2 * s1_414_2;
    gl64_t kG414 = kD414 - kE414;
    tmp3_6 = (kC414 + kG414) - kF414;
    tmp3_7 = ((((kA414 + kC414) - kE414) - kE414) - kD414);
    tmp3_8 = kB414 - kG414;
    // Op 415: dim1x1 sub_swap
    gl64_t s0_415 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_0)];
    gl64_t s1_415 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_415 - s0_415;
    // Op 416: dim3x1 mul
    uint64_t s0_416_pos = dExpsArgs->mapOffsetsExps[2] + (false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_2) : getBufferOffset(logicalRow_0, 0, domainSize, nCols_2));
    gl64_t s0_416_0 = *(gl64_t*)&dParams->aux_trace[s0_416_pos];
    gl64_t s0_416_1 = *(gl64_t*)&dParams->aux_trace[s0_416_pos + TILE_HEIGHT];
    gl64_t s0_416_2 = *(gl64_t*)&dParams->aux_trace[s0_416_pos + 2*TILE_HEIGHT];
    tmp3_0 = s0_416_0 * tmp1_0; tmp3_1 = s0_416_1 * tmp1_0; tmp3_2 = s0_416_2 * tmp1_0;
    // Op 417: dim3x3 sub
    uint64_t s0_417_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_2));
    gl64_t s0_417_0 = *(gl64_t*)&dParams->aux_trace[s0_417_pos];
    gl64_t s0_417_1 = *(gl64_t*)&dParams->aux_trace[s0_417_pos + TILE_HEIGHT];
    gl64_t s0_417_2 = *(gl64_t*)&dParams->aux_trace[s0_417_pos + 2*TILE_HEIGHT];
    tmp3_3 = s0_417_0 - tmp3_0; tmp3_4 = s0_417_1 - tmp3_1; tmp3_5 = s0_417_2 - tmp3_2;
    // Op 418: dim3x3 add
    gl64_t s0_418_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+0, domainSize, nCols_2))];
    gl64_t s0_418_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+1, domainSize, nCols_2))];
    gl64_t s0_418_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+2, domainSize, nCols_2))];
    gl64_t s1_418_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+0, domainSize, nCols_2))];
    gl64_t s1_418_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+1, domainSize, nCols_2))];
    gl64_t s1_418_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+2, domainSize, nCols_2))];
    tmp3_0 = s0_418_0 + s1_418_0; tmp3_1 = s0_418_1 + s1_418_1; tmp3_2 = s0_418_2 + s1_418_2;
    // Op 419: dim3x3 add
    uint64_t s0_419_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_2));
    gl64_t s0_419_0 = *(gl64_t*)&dParams->aux_trace[s0_419_pos];
    gl64_t s0_419_1 = *(gl64_t*)&dParams->aux_trace[s0_419_pos + TILE_HEIGHT];
    gl64_t s0_419_2 = *(gl64_t*)&dParams->aux_trace[s0_419_pos + 2*TILE_HEIGHT];
    tmp3_0 = s0_419_0 + tmp3_0; tmp3_1 = s0_419_1 + tmp3_1; tmp3_2 = s0_419_2 + tmp3_2;
    // Op 420: dim3x3 add
    uint64_t s0_420_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_2));
    gl64_t s0_420_0 = *(gl64_t*)&dParams->aux_trace[s0_420_pos];
    gl64_t s0_420_1 = *(gl64_t*)&dParams->aux_trace[s0_420_pos + TILE_HEIGHT];
    gl64_t s0_420_2 = *(gl64_t*)&dParams->aux_trace[s0_420_pos + 2*TILE_HEIGHT];
    tmp3_0 = s0_420_0 + tmp3_0; tmp3_1 = s0_420_1 + tmp3_1; tmp3_2 = s0_420_2 + tmp3_2;
    // Op 421: dim3x3 add
    gl64_t s0_421_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 15+0, domainSize, nCols_2))];
    gl64_t s0_421_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 15+1, domainSize, nCols_2))];
    gl64_t s0_421_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 15+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 15+2, domainSize, nCols_2))];
    tmp3_0 = s0_421_0 + tmp3_0; tmp3_1 = s0_421_1 + tmp3_1; tmp3_2 = s0_421_2 + tmp3_2;
    // Op 422: dim3x3 add
    gl64_t s0_422_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 18+0, domainSize, nCols_2))];
    gl64_t s0_422_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 18+1, domainSize, nCols_2))];
    gl64_t s0_422_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 18+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 18+2, domainSize, nCols_2))];
    tmp3_0 = s0_422_0 + tmp3_0; tmp3_1 = s0_422_1 + tmp3_1; tmp3_2 = s0_422_2 + tmp3_2;
    // Op 423: dim3x3 add
    uint64_t s0_423_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 21, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 21, domainSize, nCols_2));
    gl64_t s0_423_0 = *(gl64_t*)&dParams->aux_trace[s0_423_pos];
    gl64_t s0_423_1 = *(gl64_t*)&dParams->aux_trace[s0_423_pos + TILE_HEIGHT];
    gl64_t s0_423_2 = *(gl64_t*)&dParams->aux_trace[s0_423_pos + 2*TILE_HEIGHT];
    tmp3_0 = s0_423_0 + tmp3_0; tmp3_1 = s0_423_1 + tmp3_1; tmp3_2 = s0_423_2 + tmp3_2;
    // Op 424: dim3x3 add
    uint64_t s0_424_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 24, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 24, domainSize, nCols_2));
    gl64_t s0_424_0 = *(gl64_t*)&dParams->aux_trace[s0_424_pos];
    gl64_t s0_424_1 = *(gl64_t*)&dParams->aux_trace[s0_424_pos + TILE_HEIGHT];
    gl64_t s0_424_2 = *(gl64_t*)&dParams->aux_trace[s0_424_pos + 2*TILE_HEIGHT];
    tmp3_0 = s0_424_0 + tmp3_0; tmp3_1 = s0_424_1 + tmp3_1; tmp3_2 = s0_424_2 + tmp3_2;
    // Op 425: dim3x3 sub
    tmp3_3 = tmp3_3 - tmp3_0; tmp3_4 = tmp3_4 - tmp3_1; tmp3_5 = tmp3_5 - tmp3_2;
    // Op 426: dim3x1 mul
    gl64_t s0_426_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_426_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_426_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_426 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 17, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 17, domainSize, nCols_1))];
    tmp3_0 = s0_426_0 * s1_426; tmp3_1 = s0_426_1 * s1_426; tmp3_2 = s0_426_2 * s1_426;
    // Op 427: dim3x1 add
    gl64_t s1_427 = *(gl64_t*)&expressions_params[9][3];
    tmp3_0 = tmp3_0 + s1_427; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 428: dim3x3 add
    gl64_t s1_428_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_428_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_428_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_0 + s1_428_0; tmp3_1 = tmp3_1 + s1_428_1; tmp3_2 = tmp3_2 + s1_428_2;
    // Op 429: dim3x3 mul
    gl64_t kA429 = (tmp3_3 + tmp3_4) * (tmp3_0 + tmp3_1);
    gl64_t kB429 = (tmp3_3 + tmp3_5) * (tmp3_0 + tmp3_2);
    gl64_t kC429 = (tmp3_4 + tmp3_5) * (tmp3_1 + tmp3_2);
    gl64_t kD429 = tmp3_3 * tmp3_0;
    gl64_t kE429 = tmp3_4 * tmp3_1;
    gl64_t kF429 = tmp3_5 * tmp3_2;
    gl64_t kG429 = kD429 - kE429;
    tmp3_0 = (kC429 + kG429) - kF429;
    tmp3_1 = ((((kA429 + kC429) - kE429) - kE429) - kD429);
    tmp3_2 = kB429 - kG429;
    // Op 430: dim1x1 sub_swap
    gl64_t s0_430 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    gl64_t s1_430 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_430 - s0_430;
    // Op 431: dim3x1 sub
    tmp3_0 = tmp3_0 - tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 432: dim3x3 add
    tmp3_0 = tmp3_6 + tmp3_0; tmp3_1 = tmp3_7 + tmp3_1; tmp3_2 = tmp3_8 + tmp3_2;
    // Op 433: dim3x3 mul
    gl64_t s1_433_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_433_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_433_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA433 = (tmp3_0 + tmp3_1) * (s1_433_0 + s1_433_1);
    gl64_t kB433 = (tmp3_0 + tmp3_2) * (s1_433_0 + s1_433_2);
    gl64_t kC433 = (tmp3_1 + tmp3_2) * (s1_433_1 + s1_433_2);
    gl64_t kD433 = tmp3_0 * s1_433_0;
    gl64_t kE433 = tmp3_1 * s1_433_1;
    gl64_t kF433 = tmp3_2 * s1_433_2;
    gl64_t kG433 = kD433 - kE433;
    tmp3_6 = (kC433 + kG433) - kF433;
    tmp3_7 = ((((kA433 + kC433) - kE433) - kE433) - kD433);
    tmp3_8 = kB433 - kG433;
    // Op 434: dim3x1 mul
    gl64_t s0_434_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_434_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_434_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_434 = *(gl64_t*)&expressions_params[10][5];
    tmp3_0 = s0_434_0 * s1_434; tmp3_1 = s0_434_1 * s1_434; tmp3_2 = s0_434_2 * s1_434;
    // Op 435: dim3x3 mul
    gl64_t s1_435_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_435_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_435_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA435 = (tmp3_0 + tmp3_1) * (s1_435_0 + s1_435_1);
    gl64_t kB435 = (tmp3_0 + tmp3_2) * (s1_435_0 + s1_435_2);
    gl64_t kC435 = (tmp3_1 + tmp3_2) * (s1_435_1 + s1_435_2);
    gl64_t kD435 = tmp3_0 * s1_435_0;
    gl64_t kE435 = tmp3_1 * s1_435_1;
    gl64_t kF435 = tmp3_2 * s1_435_2;
    gl64_t kG435 = kD435 - kE435;
    tmp3_0 = (kC435 + kG435) - kF435;
    tmp3_1 = ((((kA435 + kC435) - kE435) - kE435) - kD435);
    tmp3_2 = kB435 - kG435;
    // Op 436: dim3x1 add
    gl64_t s1_436 = *(gl64_t*)&expressions_params[10][3];
    tmp3_0 = tmp3_0 + s1_436; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 437: dim3x3 mul
    gl64_t s1_437_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_437_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_437_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA437 = (tmp3_0 + tmp3_1) * (s1_437_0 + s1_437_1);
    gl64_t kB437 = (tmp3_0 + tmp3_2) * (s1_437_0 + s1_437_2);
    gl64_t kC437 = (tmp3_1 + tmp3_2) * (s1_437_1 + s1_437_2);
    gl64_t kD437 = tmp3_0 * s1_437_0;
    gl64_t kE437 = tmp3_1 * s1_437_1;
    gl64_t kF437 = tmp3_2 * s1_437_2;
    gl64_t kG437 = kD437 - kE437;
    tmp3_0 = (kC437 + kG437) - kF437;
    tmp3_1 = ((((kA437 + kC437) - kE437) - kE437) - kD437);
    tmp3_2 = kB437 - kG437;
    // Op 438: dim3x1 add
    gl64_t s1_438 = *(gl64_t*)&expressions_params[10][4];
    tmp3_0 = tmp3_0 + s1_438; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 439: dim3x3 mul
    gl64_t s1_439_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_439_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_439_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA439 = (tmp3_0 + tmp3_1) * (s1_439_0 + s1_439_1);
    gl64_t kB439 = (tmp3_0 + tmp3_2) * (s1_439_0 + s1_439_2);
    gl64_t kC439 = (tmp3_1 + tmp3_2) * (s1_439_1 + s1_439_2);
    gl64_t kD439 = tmp3_0 * s1_439_0;
    gl64_t kE439 = tmp3_1 * s1_439_1;
    gl64_t kF439 = tmp3_2 * s1_439_2;
    gl64_t kG439 = kD439 - kE439;
    tmp3_0 = (kC439 + kG439) - kF439;
    tmp3_1 = ((((kA439 + kC439) - kE439) - kE439) - kD439);
    tmp3_2 = kB439 - kG439;
    // Op 440: dim3x1 add
    gl64_t s1_440 = *(gl64_t*)&expressions_params[10][2];
    tmp3_0 = tmp3_0 + s1_440; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 441: dim3x3 mul
    gl64_t s1_441_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_441_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_441_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA441 = (tmp3_0 + tmp3_1) * (s1_441_0 + s1_441_1);
    gl64_t kB441 = (tmp3_0 + tmp3_2) * (s1_441_0 + s1_441_2);
    gl64_t kC441 = (tmp3_1 + tmp3_2) * (s1_441_1 + s1_441_2);
    gl64_t kD441 = tmp3_0 * s1_441_0;
    gl64_t kE441 = tmp3_1 * s1_441_1;
    gl64_t kF441 = tmp3_2 * s1_441_2;
    gl64_t kG441 = kD441 - kE441;
    tmp3_0 = (kC441 + kG441) - kF441;
    tmp3_1 = ((((kA441 + kC441) - kE441) - kE441) - kD441);
    tmp3_2 = kB441 - kG441;
    // Op 442: dim3x3 mul
    gl64_t s1_442_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_442_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_442_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA442 = (tmp3_0 + tmp3_1) * (s1_442_0 + s1_442_1);
    gl64_t kB442 = (tmp3_0 + tmp3_2) * (s1_442_0 + s1_442_2);
    gl64_t kC442 = (tmp3_1 + tmp3_2) * (s1_442_1 + s1_442_2);
    gl64_t kD442 = tmp3_0 * s1_442_0;
    gl64_t kE442 = tmp3_1 * s1_442_1;
    gl64_t kF442 = tmp3_2 * s1_442_2;
    gl64_t kG442 = kD442 - kE442;
    tmp3_0 = (kC442 + kG442) - kF442;
    tmp3_1 = ((((kA442 + kC442) - kE442) - kE442) - kD442);
    tmp3_2 = kB442 - kG442;
    // Op 443: dim3x1 add
    gl64_t s1_443 = *(gl64_t*)&expressions_params[10][1];
    tmp3_0 = tmp3_0 + s1_443; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 444: dim3x3 mul
    gl64_t s1_444_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_444_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_444_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA444 = (tmp3_0 + tmp3_1) * (s1_444_0 + s1_444_1);
    gl64_t kB444 = (tmp3_0 + tmp3_2) * (s1_444_0 + s1_444_2);
    gl64_t kC444 = (tmp3_1 + tmp3_2) * (s1_444_1 + s1_444_2);
    gl64_t kD444 = tmp3_0 * s1_444_0;
    gl64_t kE444 = tmp3_1 * s1_444_1;
    gl64_t kF444 = tmp3_2 * s1_444_2;
    gl64_t kG444 = kD444 - kE444;
    tmp3_0 = (kC444 + kG444) - kF444;
    tmp3_1 = ((((kA444 + kC444) - kE444) - kE444) - kD444);
    tmp3_2 = kB444 - kG444;
    // Op 445: dim3x1 add
    gl64_t s1_445 = *(gl64_t*)&expressions_params[9][7];
    tmp3_0 = tmp3_0 + s1_445; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 446: dim3x3 mul
    gl64_t s1_446_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_446_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_446_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA446 = (tmp3_0 + tmp3_1) * (s1_446_0 + s1_446_1);
    gl64_t kB446 = (tmp3_0 + tmp3_2) * (s1_446_0 + s1_446_2);
    gl64_t kC446 = (tmp3_1 + tmp3_2) * (s1_446_1 + s1_446_2);
    gl64_t kD446 = tmp3_0 * s1_446_0;
    gl64_t kE446 = tmp3_1 * s1_446_1;
    gl64_t kF446 = tmp3_2 * s1_446_2;
    gl64_t kG446 = kD446 - kE446;
    tmp3_0 = (kC446 + kG446) - kF446;
    tmp3_1 = ((((kA446 + kC446) - kE446) - kE446) - kD446);
    tmp3_2 = kB446 - kG446;
    // Op 447: dim3x3 mul
    gl64_t s1_447_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_447_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_447_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA447 = (tmp3_0 + tmp3_1) * (s1_447_0 + s1_447_1);
    gl64_t kB447 = (tmp3_0 + tmp3_2) * (s1_447_0 + s1_447_2);
    gl64_t kC447 = (tmp3_1 + tmp3_2) * (s1_447_1 + s1_447_2);
    gl64_t kD447 = tmp3_0 * s1_447_0;
    gl64_t kE447 = tmp3_1 * s1_447_1;
    gl64_t kF447 = tmp3_2 * s1_447_2;
    gl64_t kG447 = kD447 - kE447;
    tmp3_0 = (kC447 + kG447) - kF447;
    tmp3_1 = ((((kA447 + kC447) - kE447) - kE447) - kD447);
    tmp3_2 = kB447 - kG447;
    // Op 448: dim3x1 add
    gl64_t s1_448 = *(gl64_t*)&expressions_params[10][0];
    tmp3_0 = tmp3_0 + s1_448; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 449: dim3x3 mul
    gl64_t s1_449_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_449_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_449_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA449 = (tmp3_0 + tmp3_1) * (s1_449_0 + s1_449_1);
    gl64_t kB449 = (tmp3_0 + tmp3_2) * (s1_449_0 + s1_449_2);
    gl64_t kC449 = (tmp3_1 + tmp3_2) * (s1_449_1 + s1_449_2);
    gl64_t kD449 = tmp3_0 * s1_449_0;
    gl64_t kE449 = tmp3_1 * s1_449_1;
    gl64_t kF449 = tmp3_2 * s1_449_2;
    gl64_t kG449 = kD449 - kE449;
    tmp3_0 = (kC449 + kG449) - kF449;
    tmp3_1 = ((((kA449 + kC449) - kE449) - kE449) - kD449);
    tmp3_2 = kB449 - kG449;
    // Op 450: dim3x1 add
    gl64_t s1_450 = *(gl64_t*)&expressions_params[9][13];
    tmp3_0 = tmp3_0 + s1_450; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 451: dim3x3 add
    gl64_t s1_451_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_451_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_451_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_0 + s1_451_0; tmp3_1 = tmp3_1 + s1_451_1; tmp3_2 = tmp3_2 + s1_451_2;
    // Op 452: dim3x3 mul
    gl64_t s1_452_0 = *(gl64_t*)&expressions_params[10][15];
    gl64_t s1_452_1 = *(gl64_t*)&expressions_params[10][15+1];
    gl64_t s1_452_2 = *(gl64_t*)&expressions_params[10][15+2];
    gl64_t kA452 = (tmp3_0 + tmp3_1) * (s1_452_0 + s1_452_1);
    gl64_t kB452 = (tmp3_0 + tmp3_2) * (s1_452_0 + s1_452_2);
    gl64_t kC452 = (tmp3_1 + tmp3_2) * (s1_452_1 + s1_452_2);
    gl64_t kD452 = tmp3_0 * s1_452_0;
    gl64_t kE452 = tmp3_1 * s1_452_1;
    gl64_t kF452 = tmp3_2 * s1_452_2;
    gl64_t kG452 = kD452 - kE452;
    tmp3_0 = (kC452 + kG452) - kF452;
    tmp3_1 = ((((kA452 + kC452) - kE452) - kE452) - kD452);
    tmp3_2 = kB452 - kG452;
    // Op 453: dim3x1 add
    gl64_t s1_453 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_453; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 454: dim3x3 add
    tmp3_0 = tmp3_6 + tmp3_0; tmp3_1 = tmp3_7 + tmp3_1; tmp3_2 = tmp3_8 + tmp3_2;
    // Op 455: dim3x3 mul
    gl64_t s1_455_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_455_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_455_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA455 = (tmp3_0 + tmp3_1) * (s1_455_0 + s1_455_1);
    gl64_t kB455 = (tmp3_0 + tmp3_2) * (s1_455_0 + s1_455_2);
    gl64_t kC455 = (tmp3_1 + tmp3_2) * (s1_455_1 + s1_455_2);
    gl64_t kD455 = tmp3_0 * s1_455_0;
    gl64_t kE455 = tmp3_1 * s1_455_1;
    gl64_t kF455 = tmp3_2 * s1_455_2;
    gl64_t kG455 = kD455 - kE455;
    tmp3_6 = (kC455 + kG455) - kF455;
    tmp3_7 = ((((kA455 + kC455) - kE455) - kE455) - kD455);
    tmp3_8 = kB455 - kG455;
    // Op 456: dim3x1 mul
    gl64_t s0_456_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_456_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_456_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_456 = *(gl64_t*)&expressions_params[10][10];
    tmp3_0 = s0_456_0 * s1_456; tmp3_1 = s0_456_1 * s1_456; tmp3_2 = s0_456_2 * s1_456;
    // Op 457: dim3x3 mul
    gl64_t s1_457_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_457_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_457_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA457 = (tmp3_0 + tmp3_1) * (s1_457_0 + s1_457_1);
    gl64_t kB457 = (tmp3_0 + tmp3_2) * (s1_457_0 + s1_457_2);
    gl64_t kC457 = (tmp3_1 + tmp3_2) * (s1_457_1 + s1_457_2);
    gl64_t kD457 = tmp3_0 * s1_457_0;
    gl64_t kE457 = tmp3_1 * s1_457_1;
    gl64_t kF457 = tmp3_2 * s1_457_2;
    gl64_t kG457 = kD457 - kE457;
    tmp3_0 = (kC457 + kG457) - kF457;
    tmp3_1 = ((((kA457 + kC457) - kE457) - kE457) - kD457);
    tmp3_2 = kB457 - kG457;
    // Op 458: dim3x1 add
    gl64_t s1_458 = *(gl64_t*)&expressions_params[10][8];
    tmp3_0 = tmp3_0 + s1_458; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 459: dim3x3 mul
    gl64_t s1_459_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_459_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_459_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA459 = (tmp3_0 + tmp3_1) * (s1_459_0 + s1_459_1);
    gl64_t kB459 = (tmp3_0 + tmp3_2) * (s1_459_0 + s1_459_2);
    gl64_t kC459 = (tmp3_1 + tmp3_2) * (s1_459_1 + s1_459_2);
    gl64_t kD459 = tmp3_0 * s1_459_0;
    gl64_t kE459 = tmp3_1 * s1_459_1;
    gl64_t kF459 = tmp3_2 * s1_459_2;
    gl64_t kG459 = kD459 - kE459;
    tmp3_0 = (kC459 + kG459) - kF459;
    tmp3_1 = ((((kA459 + kC459) - kE459) - kE459) - kD459);
    tmp3_2 = kB459 - kG459;
    // Op 460: dim3x1 add
    gl64_t s1_460 = *(gl64_t*)&expressions_params[10][9];
    tmp3_0 = tmp3_0 + s1_460; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 461: dim3x3 mul
    gl64_t s1_461_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_461_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_461_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA461 = (tmp3_0 + tmp3_1) * (s1_461_0 + s1_461_1);
    gl64_t kB461 = (tmp3_0 + tmp3_2) * (s1_461_0 + s1_461_2);
    gl64_t kC461 = (tmp3_1 + tmp3_2) * (s1_461_1 + s1_461_2);
    gl64_t kD461 = tmp3_0 * s1_461_0;
    gl64_t kE461 = tmp3_1 * s1_461_1;
    gl64_t kF461 = tmp3_2 * s1_461_2;
    gl64_t kG461 = kD461 - kE461;
    tmp3_0 = (kC461 + kG461) - kF461;
    tmp3_1 = ((((kA461 + kC461) - kE461) - kE461) - kD461);
    tmp3_2 = kB461 - kG461;
    // Op 462: dim3x1 add
    gl64_t s1_462 = *(gl64_t*)&expressions_params[10][7];
    tmp3_0 = tmp3_0 + s1_462; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 463: dim3x3 mul
    gl64_t s1_463_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_463_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_463_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA463 = (tmp3_0 + tmp3_1) * (s1_463_0 + s1_463_1);
    gl64_t kB463 = (tmp3_0 + tmp3_2) * (s1_463_0 + s1_463_2);
    gl64_t kC463 = (tmp3_1 + tmp3_2) * (s1_463_1 + s1_463_2);
    gl64_t kD463 = tmp3_0 * s1_463_0;
    gl64_t kE463 = tmp3_1 * s1_463_1;
    gl64_t kF463 = tmp3_2 * s1_463_2;
    gl64_t kG463 = kD463 - kE463;
    tmp3_0 = (kC463 + kG463) - kF463;
    tmp3_1 = ((((kA463 + kC463) - kE463) - kE463) - kD463);
    tmp3_2 = kB463 - kG463;
    // Op 464: dim3x3 mul
    gl64_t s1_464_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_464_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_464_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA464 = (tmp3_0 + tmp3_1) * (s1_464_0 + s1_464_1);
    gl64_t kB464 = (tmp3_0 + tmp3_2) * (s1_464_0 + s1_464_2);
    gl64_t kC464 = (tmp3_1 + tmp3_2) * (s1_464_1 + s1_464_2);
    gl64_t kD464 = tmp3_0 * s1_464_0;
    gl64_t kE464 = tmp3_1 * s1_464_1;
    gl64_t kF464 = tmp3_2 * s1_464_2;
    gl64_t kG464 = kD464 - kE464;
    tmp3_0 = (kC464 + kG464) - kF464;
    tmp3_1 = ((((kA464 + kC464) - kE464) - kE464) - kD464);
    tmp3_2 = kB464 - kG464;
    // Op 465: dim3x1 add
    gl64_t s1_465 = *(gl64_t*)&expressions_params[10][6];
    tmp3_0 = tmp3_0 + s1_465; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 466: dim3x3 mul
    gl64_t s1_466_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_466_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_466_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA466 = (tmp3_0 + tmp3_1) * (s1_466_0 + s1_466_1);
    gl64_t kB466 = (tmp3_0 + tmp3_2) * (s1_466_0 + s1_466_2);
    gl64_t kC466 = (tmp3_1 + tmp3_2) * (s1_466_1 + s1_466_2);
    gl64_t kD466 = tmp3_0 * s1_466_0;
    gl64_t kE466 = tmp3_1 * s1_466_1;
    gl64_t kF466 = tmp3_2 * s1_466_2;
    gl64_t kG466 = kD466 - kE466;
    tmp3_0 = (kC466 + kG466) - kF466;
    tmp3_1 = ((((kA466 + kC466) - kE466) - kE466) - kD466);
    tmp3_2 = kB466 - kG466;
    // Op 467: dim3x1 add
    gl64_t s1_467 = *(gl64_t*)&expressions_params[9][7];
    tmp3_0 = tmp3_0 + s1_467; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 468: dim3x3 mul
    gl64_t s1_468_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_468_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_468_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA468 = (tmp3_0 + tmp3_1) * (s1_468_0 + s1_468_1);
    gl64_t kB468 = (tmp3_0 + tmp3_2) * (s1_468_0 + s1_468_2);
    gl64_t kC468 = (tmp3_1 + tmp3_2) * (s1_468_1 + s1_468_2);
    gl64_t kD468 = tmp3_0 * s1_468_0;
    gl64_t kE468 = tmp3_1 * s1_468_1;
    gl64_t kF468 = tmp3_2 * s1_468_2;
    gl64_t kG468 = kD468 - kE468;
    tmp3_0 = (kC468 + kG468) - kF468;
    tmp3_1 = ((((kA468 + kC468) - kE468) - kE468) - kD468);
    tmp3_2 = kB468 - kG468;
    // Op 469: dim3x1 add
    gl64_t s1_469 = *(gl64_t*)&expressions_params[10][11];
    tmp3_0 = tmp3_0 + s1_469; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 470: dim3x3 mul
    gl64_t s1_470_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_470_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_470_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA470 = (tmp3_0 + tmp3_1) * (s1_470_0 + s1_470_1);
    gl64_t kB470 = (tmp3_0 + tmp3_2) * (s1_470_0 + s1_470_2);
    gl64_t kC470 = (tmp3_1 + tmp3_2) * (s1_470_1 + s1_470_2);
    gl64_t kD470 = tmp3_0 * s1_470_0;
    gl64_t kE470 = tmp3_1 * s1_470_1;
    gl64_t kF470 = tmp3_2 * s1_470_2;
    gl64_t kG470 = kD470 - kE470;
    tmp3_0 = (kC470 + kG470) - kF470;
    tmp3_1 = ((((kA470 + kC470) - kE470) - kE470) - kD470);
    tmp3_2 = kB470 - kG470;
    // Op 471: dim1x1 add
    gl64_t s0_471 = *(gl64_t*)&expressions_params[9][0];
    gl64_t s1_471 = *(gl64_t*)&expressions_params[10][0];
    tmp1_0 = s0_471 + s1_471;
    // Op 472: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 473: dim3x3 mul
    gl64_t s1_473_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_473_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_473_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA473 = (tmp3_0 + tmp3_1) * (s1_473_0 + s1_473_1);
    gl64_t kB473 = (tmp3_0 + tmp3_2) * (s1_473_0 + s1_473_2);
    gl64_t kC473 = (tmp3_1 + tmp3_2) * (s1_473_1 + s1_473_2);
    gl64_t kD473 = tmp3_0 * s1_473_0;
    gl64_t kE473 = tmp3_1 * s1_473_1;
    gl64_t kF473 = tmp3_2 * s1_473_2;
    gl64_t kG473 = kD473 - kE473;
    tmp3_0 = (kC473 + kG473) - kF473;
    tmp3_1 = ((((kA473 + kC473) - kE473) - kE473) - kD473);
    tmp3_2 = kB473 - kG473;
    // Op 474: dim3x1 add
    gl64_t s1_474 = *(gl64_t*)&expressions_params[9][13];
    tmp3_0 = tmp3_0 + s1_474; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 475: dim3x3 add
    gl64_t s1_475_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_475_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_475_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_0 + s1_475_0; tmp3_1 = tmp3_1 + s1_475_1; tmp3_2 = tmp3_2 + s1_475_2;
    // Op 476: dim3x3 mul
    gl64_t s1_476_0 = *(gl64_t*)&expressions_params[10][18];
    gl64_t s1_476_1 = *(gl64_t*)&expressions_params[10][18+1];
    gl64_t s1_476_2 = *(gl64_t*)&expressions_params[10][18+2];
    gl64_t kA476 = (tmp3_0 + tmp3_1) * (s1_476_0 + s1_476_1);
    gl64_t kB476 = (tmp3_0 + tmp3_2) * (s1_476_0 + s1_476_2);
    gl64_t kC476 = (tmp3_1 + tmp3_2) * (s1_476_1 + s1_476_2);
    gl64_t kD476 = tmp3_0 * s1_476_0;
    gl64_t kE476 = tmp3_1 * s1_476_1;
    gl64_t kF476 = tmp3_2 * s1_476_2;
    gl64_t kG476 = kD476 - kE476;
    tmp3_0 = (kC476 + kG476) - kF476;
    tmp3_1 = ((((kA476 + kC476) - kE476) - kE476) - kD476);
    tmp3_2 = kB476 - kG476;
    // Op 477: dim1x1 sub
    gl64_t s0_477 = *(gl64_t*)&expressions_params[9][0];
    gl64_t s1_477 = *(gl64_t*)&expressions_params[10][11];
    tmp1_0 = s0_477 - s1_477;
    // Op 478: dim3x1 sub
    tmp3_0 = tmp3_0 - tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 479: dim3x3 add
    tmp3_0 = tmp3_6 + tmp3_0; tmp3_1 = tmp3_7 + tmp3_1; tmp3_2 = tmp3_8 + tmp3_2;
    // Op 480: dim3x3 mul
    gl64_t s1_480_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_480_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_480_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA480 = (tmp3_0 + tmp3_1) * (s1_480_0 + s1_480_1);
    gl64_t kB480 = (tmp3_0 + tmp3_2) * (s1_480_0 + s1_480_2);
    gl64_t kC480 = (tmp3_1 + tmp3_2) * (s1_480_1 + s1_480_2);
    gl64_t kD480 = tmp3_0 * s1_480_0;
    gl64_t kE480 = tmp3_1 * s1_480_1;
    gl64_t kF480 = tmp3_2 * s1_480_2;
    gl64_t kG480 = kD480 - kE480;
    tmp3_6 = (kC480 + kG480) - kF480;
    tmp3_7 = ((((kA480 + kC480) - kE480) - kE480) - kD480);
    tmp3_8 = kB480 - kG480;
    // Op 481: dim3x1 add
    gl64_t s0_481_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s0_481_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s0_481_2 = *(gl64_t*)&expressions_params[13][3+2];
    gl64_t s1_481 = *(gl64_t*)&expressions_params[9][11];
    tmp3_0 = s0_481_0 + s1_481; tmp3_1 = s0_481_1; tmp3_2 = s0_481_2;
    // Op 482: dim3x3 mul
    gl64_t s1_482_0 = *(gl64_t*)&expressions_params[10][21];
    gl64_t s1_482_1 = *(gl64_t*)&expressions_params[10][21+1];
    gl64_t s1_482_2 = *(gl64_t*)&expressions_params[10][21+2];
    gl64_t kA482 = (tmp3_0 + tmp3_1) * (s1_482_0 + s1_482_1);
    gl64_t kB482 = (tmp3_0 + tmp3_2) * (s1_482_0 + s1_482_2);
    gl64_t kC482 = (tmp3_1 + tmp3_2) * (s1_482_1 + s1_482_2);
    gl64_t kD482 = tmp3_0 * s1_482_0;
    gl64_t kE482 = tmp3_1 * s1_482_1;
    gl64_t kF482 = tmp3_2 * s1_482_2;
    gl64_t kG482 = kD482 - kE482;
    tmp3_0 = (kC482 + kG482) - kF482;
    tmp3_1 = ((((kA482 + kC482) - kE482) - kE482) - kD482);
    tmp3_2 = kB482 - kG482;
    // Op 483: dim1x1 sub
    gl64_t s0_483 = *(gl64_t*)&expressions_params[9][1];
    gl64_t s1_483 = *(gl64_t*)&expressions_params[10][14];
    tmp1_0 = s0_483 - s1_483;
    // Op 484: dim3x1 sub
    tmp3_0 = tmp3_0 - tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 485: dim3x3 add
    tmp3_0 = tmp3_6 + tmp3_0; tmp3_1 = tmp3_7 + tmp3_1; tmp3_2 = tmp3_8 + tmp3_2;
    // Op 486: dim3x3 mul
    gl64_t s1_486_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_486_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_486_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA486 = (tmp3_0 + tmp3_1) * (s1_486_0 + s1_486_1);
    gl64_t kB486 = (tmp3_0 + tmp3_2) * (s1_486_0 + s1_486_2);
    gl64_t kC486 = (tmp3_1 + tmp3_2) * (s1_486_1 + s1_486_2);
    gl64_t kD486 = tmp3_0 * s1_486_0;
    gl64_t kE486 = tmp3_1 * s1_486_1;
    gl64_t kF486 = tmp3_2 * s1_486_2;
    gl64_t kG486 = kD486 - kE486;
    tmp3_6 = (kC486 + kG486) - kF486;
    tmp3_7 = ((((kA486 + kC486) - kE486) - kE486) - kD486);
    tmp3_8 = kB486 - kG486;
    // Op 487: dim3x1 mul
    gl64_t s0_487_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_487_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_487_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_487 = *(gl64_t*)&expressions_params[10][12];
    tmp3_0 = s0_487_0 * s1_487; tmp3_1 = s0_487_1 * s1_487; tmp3_2 = s0_487_2 * s1_487;
    // Op 488: dim3x1 add
    gl64_t s1_488 = *(gl64_t*)&expressions_params[9][14];
    tmp3_0 = tmp3_0 + s1_488; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 489: dim3x3 add
    gl64_t s1_489_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_489_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_489_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_0 + s1_489_0; tmp3_1 = tmp3_1 + s1_489_1; tmp3_2 = tmp3_2 + s1_489_2;
    // Op 490: dim3x3 mul
    gl64_t s1_490_0 = *(gl64_t*)&expressions_params[10][24];
    gl64_t s1_490_1 = *(gl64_t*)&expressions_params[10][24+1];
    gl64_t s1_490_2 = *(gl64_t*)&expressions_params[10][24+2];
    gl64_t kA490 = (tmp3_0 + tmp3_1) * (s1_490_0 + s1_490_1);
    gl64_t kB490 = (tmp3_0 + tmp3_2) * (s1_490_0 + s1_490_2);
    gl64_t kC490 = (tmp3_1 + tmp3_2) * (s1_490_1 + s1_490_2);
    gl64_t kD490 = tmp3_0 * s1_490_0;
    gl64_t kE490 = tmp3_1 * s1_490_1;
    gl64_t kF490 = tmp3_2 * s1_490_2;
    gl64_t kG490 = kD490 - kE490;
    tmp3_0 = (kC490 + kG490) - kF490;
    tmp3_1 = ((((kA490 + kC490) - kE490) - kE490) - kD490);
    tmp3_2 = kB490 - kG490;
    // Op 491: dim3x1 add
    gl64_t s1_491 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_491; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 492: dim3x3 add
    tmp3_0 = tmp3_6 + tmp3_0; tmp3_1 = tmp3_7 + tmp3_1; tmp3_2 = tmp3_8 + tmp3_2;
    // Op 493: dim3x3 mul
    gl64_t s1_493_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_493_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_493_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA493 = (tmp3_0 + tmp3_1) * (s1_493_0 + s1_493_1);
    gl64_t kB493 = (tmp3_0 + tmp3_2) * (s1_493_0 + s1_493_2);
    gl64_t kC493 = (tmp3_1 + tmp3_2) * (s1_493_1 + s1_493_2);
    gl64_t kD493 = tmp3_0 * s1_493_0;
    gl64_t kE493 = tmp3_1 * s1_493_1;
    gl64_t kF493 = tmp3_2 * s1_493_2;
    gl64_t kG493 = kD493 - kE493;
    tmp3_6 = (kC493 + kG493) - kF493;
    tmp3_7 = ((((kA493 + kC493) - kE493) - kE493) - kD493);
    tmp3_8 = kB493 - kG493;
    // Op 494: dim3x1 mul
    gl64_t s0_494_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_494_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_494_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_494 = *(gl64_t*)&expressions_params[10][13];
    tmp3_0 = s0_494_0 * s1_494; tmp3_1 = s0_494_1 * s1_494; tmp3_2 = s0_494_2 * s1_494;
    // Op 495: dim3x1 add
    gl64_t s1_495 = *(gl64_t*)&expressions_params[9][14];
    tmp3_0 = tmp3_0 + s1_495; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 496: dim3x3 add
    gl64_t s1_496_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_496_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_496_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_0 + s1_496_0; tmp3_1 = tmp3_1 + s1_496_1; tmp3_2 = tmp3_2 + s1_496_2;
    // Op 497: dim3x3 mul
    gl64_t s1_497_0 = *(gl64_t*)&expressions_params[10][27];
    gl64_t s1_497_1 = *(gl64_t*)&expressions_params[10][27+1];
    gl64_t s1_497_2 = *(gl64_t*)&expressions_params[10][27+2];
    gl64_t kA497 = (tmp3_0 + tmp3_1) * (s1_497_0 + s1_497_1);
    gl64_t kB497 = (tmp3_0 + tmp3_2) * (s1_497_0 + s1_497_2);
    gl64_t kC497 = (tmp3_1 + tmp3_2) * (s1_497_1 + s1_497_2);
    gl64_t kD497 = tmp3_0 * s1_497_0;
    gl64_t kE497 = tmp3_1 * s1_497_1;
    gl64_t kF497 = tmp3_2 * s1_497_2;
    gl64_t kG497 = kD497 - kE497;
    tmp3_0 = (kC497 + kG497) - kF497;
    tmp3_1 = ((((kA497 + kC497) - kE497) - kE497) - kD497);
    tmp3_2 = kB497 - kG497;
    // Op 498: dim3x1 add
    gl64_t s1_498 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_498; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 499: dim3x3 add
    tmp3_0 = tmp3_6 + tmp3_0; tmp3_1 = tmp3_7 + tmp3_1; tmp3_2 = tmp3_8 + tmp3_2;
    // Op 500: dim3x3 mul
    gl64_t s1_500_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_500_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_500_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA500 = (tmp3_0 + tmp3_1) * (s1_500_0 + s1_500_1);
    gl64_t kB500 = (tmp3_0 + tmp3_2) * (s1_500_0 + s1_500_2);
    gl64_t kC500 = (tmp3_1 + tmp3_2) * (s1_500_1 + s1_500_2);
    gl64_t kD500 = tmp3_0 * s1_500_0;
    gl64_t kE500 = tmp3_1 * s1_500_1;
    gl64_t kF500 = tmp3_2 * s1_500_2;
    gl64_t kG500 = kD500 - kE500;
    tmp3_3 = (kC500 + kG500) - kF500;
    tmp3_4 = ((((kA500 + kC500) - kE500) - kE500) - kD500);
    tmp3_5 = kB500 - kG500;
    // Op 501: dim3x3 sub_swap
    uint64_t s0_501_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_2));
    gl64_t s0_501_0 = *(gl64_t*)&dParams->aux_trace[s0_501_pos];
    gl64_t s0_501_1 = *(gl64_t*)&dParams->aux_trace[s0_501_pos + TILE_HEIGHT];
    gl64_t s0_501_2 = *(gl64_t*)&dParams->aux_trace[s0_501_pos + 2*TILE_HEIGHT];
    gl64_t s1_501_0 = *(gl64_t*)&expressions_params[12][0];
    gl64_t s1_501_1 = *(gl64_t*)&expressions_params[12][0+1];
    gl64_t s1_501_2 = *(gl64_t*)&expressions_params[12][0+2];
    tmp3_6 = s1_501_0 - s0_501_0; tmp3_7 = s1_501_1 - s0_501_1; tmp3_8 = s1_501_2 - s0_501_2;
    // Op 502: dim3x3 add
    gl64_t s0_502_0 = *(gl64_t*)&expressions_params[10][15];
    gl64_t s0_502_1 = *(gl64_t*)&expressions_params[10][15+1];
    gl64_t s0_502_2 = *(gl64_t*)&expressions_params[10][15+2];
    gl64_t s1_502_0 = *(gl64_t*)&expressions_params[10][18];
    gl64_t s1_502_1 = *(gl64_t*)&expressions_params[10][18+1];
    gl64_t s1_502_2 = *(gl64_t*)&expressions_params[10][18+2];
    tmp3_0 = s0_502_0 + s1_502_0; tmp3_1 = s0_502_1 + s1_502_1; tmp3_2 = s0_502_2 + s1_502_2;
    // Op 503: dim3x3 add
    gl64_t s1_503_0 = *(gl64_t*)&expressions_params[10][21];
    gl64_t s1_503_1 = *(gl64_t*)&expressions_params[10][21+1];
    gl64_t s1_503_2 = *(gl64_t*)&expressions_params[10][21+2];
    tmp3_0 = tmp3_0 + s1_503_0; tmp3_1 = tmp3_1 + s1_503_1; tmp3_2 = tmp3_2 + s1_503_2;
    // Op 504: dim3x3 add
    gl64_t s1_504_0 = *(gl64_t*)&expressions_params[10][24];
    gl64_t s1_504_1 = *(gl64_t*)&expressions_params[10][24+1];
    gl64_t s1_504_2 = *(gl64_t*)&expressions_params[10][24+2];
    tmp3_0 = tmp3_0 + s1_504_0; tmp3_1 = tmp3_1 + s1_504_1; tmp3_2 = tmp3_2 + s1_504_2;
    // Op 505: dim3x3 add
    gl64_t s1_505_0 = *(gl64_t*)&expressions_params[10][27];
    gl64_t s1_505_1 = *(gl64_t*)&expressions_params[10][27+1];
    gl64_t s1_505_2 = *(gl64_t*)&expressions_params[10][27+2];
    tmp3_0 = tmp3_0 + s1_505_0; tmp3_1 = tmp3_1 + s1_505_1; tmp3_2 = tmp3_2 + s1_505_2;
    // Op 506: dim3x3 sub
    tmp3_0 = tmp3_6 - tmp3_0; tmp3_1 = tmp3_7 - tmp3_1; tmp3_2 = tmp3_8 - tmp3_2;
    // Op 507: dim3x1 mul
    gl64_t s1_507 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    tmp3_0 = tmp3_0 * s1_507; tmp3_1 = tmp3_1 * s1_507; tmp3_2 = tmp3_2 * s1_507;
    // Op 508: dim3x3 add
    tmp3_0 = tmp3_3 + tmp3_0; tmp3_1 = tmp3_4 + tmp3_1; tmp3_2 = tmp3_5 + tmp3_2;
    // Op 509: dim3x1 mul
    gl64_t s1_509 = *(gl64_t*)&dParams->aux_trace[dArgs->zi_offset + (1 - 1) * domainSize + row + threadIdx.x];
    tmp3_0 = tmp3_0 * s1_509; tmp3_1 = tmp3_1 * s1_509; tmp3_2 = tmp3_2 * s1_509;

    // Write final result to shared memory and store to output
    *(gl64_t*)&expressions_params[bufferCommitsSize + 1][0 * blockDim.x + threadIdx.x] = tmp3_0;
    *(gl64_t*)&expressions_params[bufferCommitsSize + 1][1 * blockDim.x + threadIdx.x] = tmp3_1;
    *(gl64_t*)&expressions_params[bufferCommitsSize + 1][2 * blockDim.x + threadIdx.x] = tmp3_2;
    storePolynomial__((ExpsArguments*)dExpsArgs, (Goldilocks::Element*)&expressions_params[bufferCommitsSize + 1][0 * blockDim.x], row);
}
