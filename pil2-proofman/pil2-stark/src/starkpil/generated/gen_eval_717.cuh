// Auto-generated expression evaluator - matches load__() semantics exactly
// Q expressions: domainExtended=true always, type 1 goes through aux_trace

// Fingerprint: ac8c88ed  nOps=548 nTemp1=5 nTemp3=5
#define GENERATED_EVAL_NOPS_ac8c88ed 548
#define GENERATED_EVAL_NTEMP1_ac8c88ed 5
#define GENERATED_EVAL_NTEMP3_ac8c88ed 5

template<bool IsCyclic>
__device__ __forceinline__ void eval_expr_ac8c88ed(
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
    gl64_t s0_25 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_25 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_25 - s0_25;
    // Op 26: dim1x1 mul
    gl64_t s0_26 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    tmp1_0 = s0_26 * tmp1_0;
    // Op 27: dim1x1 sub
    gl64_t s0_27 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_27 = *(gl64_t*)&expressions_params[10][13];
    tmp1_1 = s0_27 - s1_27;
    // Op 28: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
    // Op 29: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 30: dim3x3 mul
    gl64_t s1_30_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_30_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_30_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA30 = (tmp3_0 + tmp3_1) * (s1_30_0 + s1_30_1);
    gl64_t kB30 = (tmp3_0 + tmp3_2) * (s1_30_0 + s1_30_2);
    gl64_t kC30 = (tmp3_1 + tmp3_2) * (s1_30_1 + s1_30_2);
    gl64_t kD30 = tmp3_0 * s1_30_0;
    gl64_t kE30 = tmp3_1 * s1_30_1;
    gl64_t kF30 = tmp3_2 * s1_30_2;
    gl64_t kG30 = kD30 - kE30;
    tmp3_0 = (kC30 + kG30) - kF30;
    tmp3_1 = ((((kA30 + kC30) - kE30) - kE30) - kD30);
    tmp3_2 = kB30 - kG30;
    // Op 31: dim1x1 sub_swap
    gl64_t s0_31 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    gl64_t s1_31 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_31 - s0_31;
    // Op 32: dim1x1 mul
    gl64_t s0_32 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    tmp1_0 = s0_32 * tmp1_0;
    // Op 33: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 34: dim3x3 mul
    gl64_t s1_34_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_34_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_34_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA34 = (tmp3_0 + tmp3_1) * (s1_34_0 + s1_34_1);
    gl64_t kB34 = (tmp3_0 + tmp3_2) * (s1_34_0 + s1_34_2);
    gl64_t kC34 = (tmp3_1 + tmp3_2) * (s1_34_1 + s1_34_2);
    gl64_t kD34 = tmp3_0 * s1_34_0;
    gl64_t kE34 = tmp3_1 * s1_34_1;
    gl64_t kF34 = tmp3_2 * s1_34_2;
    gl64_t kG34 = kD34 - kE34;
    tmp3_0 = (kC34 + kG34) - kF34;
    tmp3_1 = ((((kA34 + kC34) - kE34) - kE34) - kD34);
    tmp3_2 = kB34 - kG34;
    // Op 35: dim1x1 mul
    gl64_t s0_35 = *(gl64_t*)&expressions_params[10][13];
    gl64_t s1_35 = *(gl64_t*)&expressions_params[10][6];
    tmp1_0 = s0_35 * s1_35;
    // Op 36: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 37: dim3x3 mul
    gl64_t s1_37_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_37_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_37_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA37 = (tmp3_0 + tmp3_1) * (s1_37_0 + s1_37_1);
    gl64_t kB37 = (tmp3_0 + tmp3_2) * (s1_37_0 + s1_37_2);
    gl64_t kC37 = (tmp3_1 + tmp3_2) * (s1_37_1 + s1_37_2);
    gl64_t kD37 = tmp3_0 * s1_37_0;
    gl64_t kE37 = tmp3_1 * s1_37_1;
    gl64_t kF37 = tmp3_2 * s1_37_2;
    gl64_t kG37 = kD37 - kE37;
    tmp3_0 = (kC37 + kG37) - kF37;
    tmp3_1 = ((((kA37 + kC37) - kE37) - kE37) - kD37);
    tmp3_2 = kB37 - kG37;
    // Op 38: dim1x1 mul
    gl64_t s0_38 = *(gl64_t*)&expressions_params[10][12];
    gl64_t s1_38 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_38 * s1_38;
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
    gl64_t s0_41 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    gl64_t s1_41 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_41 - s0_41;
    // Op 42: dim1x1 mul
    gl64_t s0_42 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
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
    gl64_t s0_45 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    gl64_t s1_45 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_45 - s0_45;
    // Op 46: dim1x1 mul
    gl64_t s0_46 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
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
    gl64_t s0_49 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    gl64_t s1_49 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_49 - s0_49;
    // Op 50: dim1x1 mul
    gl64_t s0_50 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
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
    // Op 53: dim1x1 sub_swap
    gl64_t s0_53 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    gl64_t s1_53 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_53 - s0_53;
    // Op 54: dim1x1 mul
    gl64_t s0_54 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
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
    gl64_t s0_57 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    gl64_t s1_57 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_57 - s0_57;
    // Op 58: dim1x1 mul
    gl64_t s0_58 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    tmp1_0 = s0_58 * tmp1_0;
    // Op 59: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 60: dim3x3 mul
    gl64_t s1_60_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_60_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_60_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA60 = (tmp3_0 + tmp3_1) * (s1_60_0 + s1_60_1);
    gl64_t kB60 = (tmp3_0 + tmp3_2) * (s1_60_0 + s1_60_2);
    gl64_t kC60 = (tmp3_1 + tmp3_2) * (s1_60_1 + s1_60_2);
    gl64_t kD60 = tmp3_0 * s1_60_0;
    gl64_t kE60 = tmp3_1 * s1_60_1;
    gl64_t kF60 = tmp3_2 * s1_60_2;
    gl64_t kG60 = kD60 - kE60;
    tmp3_0 = (kC60 + kG60) - kF60;
    tmp3_1 = ((((kA60 + kC60) - kE60) - kE60) - kD60);
    tmp3_2 = kB60 - kG60;
    // Op 61: dim1x1 sub_swap
    gl64_t s0_61 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    gl64_t s1_61 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_61 - s0_61;
    // Op 62: dim1x1 mul
    gl64_t s0_62 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    tmp1_0 = s0_62 * tmp1_0;
    // Op 63: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 64: dim3x3 mul
    gl64_t s1_64_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_64_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_64_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA64 = (tmp3_0 + tmp3_1) * (s1_64_0 + s1_64_1);
    gl64_t kB64 = (tmp3_0 + tmp3_2) * (s1_64_0 + s1_64_2);
    gl64_t kC64 = (tmp3_1 + tmp3_2) * (s1_64_1 + s1_64_2);
    gl64_t kD64 = tmp3_0 * s1_64_0;
    gl64_t kE64 = tmp3_1 * s1_64_1;
    gl64_t kF64 = tmp3_2 * s1_64_2;
    gl64_t kG64 = kD64 - kE64;
    tmp3_0 = (kC64 + kG64) - kF64;
    tmp3_1 = ((((kA64 + kC64) - kE64) - kE64) - kD64);
    tmp3_2 = kB64 - kG64;
    // Op 65: dim1x1 sub_swap
    gl64_t s0_65 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    gl64_t s1_65 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_65 - s0_65;
    // Op 66: dim1x1 mul
    gl64_t s0_66 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    tmp1_0 = s0_66 * tmp1_0;
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
    gl64_t s0_69 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    gl64_t s1_69 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_69 - s0_69;
    // Op 70: dim1x1 mul
    gl64_t s0_70 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    tmp1_0 = s0_70 * tmp1_0;
    // Op 71: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 72: dim3x3 mul
    gl64_t s1_72_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_72_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_72_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA72 = (tmp3_0 + tmp3_1) * (s1_72_0 + s1_72_1);
    gl64_t kB72 = (tmp3_0 + tmp3_2) * (s1_72_0 + s1_72_2);
    gl64_t kC72 = (tmp3_1 + tmp3_2) * (s1_72_1 + s1_72_2);
    gl64_t kD72 = tmp3_0 * s1_72_0;
    gl64_t kE72 = tmp3_1 * s1_72_1;
    gl64_t kF72 = tmp3_2 * s1_72_2;
    gl64_t kG72 = kD72 - kE72;
    tmp3_0 = (kC72 + kG72) - kF72;
    tmp3_1 = ((((kA72 + kC72) - kE72) - kE72) - kD72);
    tmp3_2 = kB72 - kG72;
    // Op 73: dim1x1 sub_swap
    gl64_t s0_73 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    gl64_t s1_73 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_73 - s0_73;
    // Op 74: dim1x1 mul
    gl64_t s0_74 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    tmp1_0 = s0_74 * tmp1_0;
    // Op 75: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 76: dim3x3 mul
    gl64_t s1_76_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_76_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_76_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA76 = (tmp3_0 + tmp3_1) * (s1_76_0 + s1_76_1);
    gl64_t kB76 = (tmp3_0 + tmp3_2) * (s1_76_0 + s1_76_2);
    gl64_t kC76 = (tmp3_1 + tmp3_2) * (s1_76_1 + s1_76_2);
    gl64_t kD76 = tmp3_0 * s1_76_0;
    gl64_t kE76 = tmp3_1 * s1_76_1;
    gl64_t kF76 = tmp3_2 * s1_76_2;
    gl64_t kG76 = kD76 - kE76;
    tmp3_0 = (kC76 + kG76) - kF76;
    tmp3_1 = ((((kA76 + kC76) - kE76) - kE76) - kD76);
    tmp3_2 = kB76 - kG76;
    // Op 77: dim1x1 sub_swap
    gl64_t s0_77 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    gl64_t s1_77 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_77 - s0_77;
    // Op 78: dim1x1 mul
    gl64_t s0_78 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    tmp1_0 = s0_78 * tmp1_0;
    // Op 79: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 80: dim3x3 mul
    gl64_t s1_80_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_80_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_80_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA80 = (tmp3_0 + tmp3_1) * (s1_80_0 + s1_80_1);
    gl64_t kB80 = (tmp3_0 + tmp3_2) * (s1_80_0 + s1_80_2);
    gl64_t kC80 = (tmp3_1 + tmp3_2) * (s1_80_1 + s1_80_2);
    gl64_t kD80 = tmp3_0 * s1_80_0;
    gl64_t kE80 = tmp3_1 * s1_80_1;
    gl64_t kF80 = tmp3_2 * s1_80_2;
    gl64_t kG80 = kD80 - kE80;
    tmp3_0 = (kC80 + kG80) - kF80;
    tmp3_1 = ((((kA80 + kC80) - kE80) - kE80) - kD80);
    tmp3_2 = kB80 - kG80;
    // Op 81: dim1x1 sub_swap
    gl64_t s0_81 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    gl64_t s1_81 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_81 - s0_81;
    // Op 82: dim1x1 mul
    gl64_t s0_82 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    tmp1_0 = s0_82 * tmp1_0;
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
    // Op 85: dim1x1 sub_swap
    gl64_t s0_85 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    gl64_t s1_85 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_85 - s0_85;
    // Op 86: dim1x1 mul
    gl64_t s0_86 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    tmp1_0 = s0_86 * tmp1_0;
    // Op 87: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 88: dim3x3 mul
    gl64_t s1_88_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_88_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_88_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA88 = (tmp3_0 + tmp3_1) * (s1_88_0 + s1_88_1);
    gl64_t kB88 = (tmp3_0 + tmp3_2) * (s1_88_0 + s1_88_2);
    gl64_t kC88 = (tmp3_1 + tmp3_2) * (s1_88_1 + s1_88_2);
    gl64_t kD88 = tmp3_0 * s1_88_0;
    gl64_t kE88 = tmp3_1 * s1_88_1;
    gl64_t kF88 = tmp3_2 * s1_88_2;
    gl64_t kG88 = kD88 - kE88;
    tmp3_0 = (kC88 + kG88) - kF88;
    tmp3_1 = ((((kA88 + kC88) - kE88) - kE88) - kD88);
    tmp3_2 = kB88 - kG88;
    // Op 89: dim1x1 sub_swap
    gl64_t s0_89 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    gl64_t s1_89 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_89 - s0_89;
    // Op 90: dim1x1 mul
    gl64_t s0_90 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    tmp1_0 = s0_90 * tmp1_0;
    // Op 91: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 92: dim3x3 mul
    gl64_t s1_92_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_92_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_92_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA92 = (tmp3_0 + tmp3_1) * (s1_92_0 + s1_92_1);
    gl64_t kB92 = (tmp3_0 + tmp3_2) * (s1_92_0 + s1_92_2);
    gl64_t kC92 = (tmp3_1 + tmp3_2) * (s1_92_1 + s1_92_2);
    gl64_t kD92 = tmp3_0 * s1_92_0;
    gl64_t kE92 = tmp3_1 * s1_92_1;
    gl64_t kF92 = tmp3_2 * s1_92_2;
    gl64_t kG92 = kD92 - kE92;
    tmp3_0 = (kC92 + kG92) - kF92;
    tmp3_1 = ((((kA92 + kC92) - kE92) - kE92) - kD92);
    tmp3_2 = kB92 - kG92;
    // Op 93: dim1x1 sub_swap
    gl64_t s0_93 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    gl64_t s1_93 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_93 - s0_93;
    // Op 94: dim1x1 mul
    gl64_t s0_94 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    tmp1_0 = s0_94 * tmp1_0;
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
    // Op 97: dim1x1 sub_swap
    gl64_t s0_97 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    gl64_t s1_97 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_97 - s0_97;
    // Op 98: dim1x1 mul
    gl64_t s0_98 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    tmp1_0 = s0_98 * tmp1_0;
    // Op 99: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 100: dim3x3 mul
    gl64_t s1_100_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_100_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_100_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA100 = (tmp3_0 + tmp3_1) * (s1_100_0 + s1_100_1);
    gl64_t kB100 = (tmp3_0 + tmp3_2) * (s1_100_0 + s1_100_2);
    gl64_t kC100 = (tmp3_1 + tmp3_2) * (s1_100_1 + s1_100_2);
    gl64_t kD100 = tmp3_0 * s1_100_0;
    gl64_t kE100 = tmp3_1 * s1_100_1;
    gl64_t kF100 = tmp3_2 * s1_100_2;
    gl64_t kG100 = kD100 - kE100;
    tmp3_0 = (kC100 + kG100) - kF100;
    tmp3_1 = ((((kA100 + kC100) - kE100) - kE100) - kD100);
    tmp3_2 = kB100 - kG100;
    // Op 101: dim1x1 sub
    gl64_t s0_101 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_101 = *(gl64_t*)&expressions_params[10][6];
    tmp1_0 = s0_101 - s1_101;
    // Op 102: dim1x1 mul
    gl64_t s0_102 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    tmp1_0 = s0_102 * tmp1_0;
    // Op 103: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 104: dim3x3 mul
    gl64_t s1_104_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_104_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_104_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA104 = (tmp3_0 + tmp3_1) * (s1_104_0 + s1_104_1);
    gl64_t kB104 = (tmp3_0 + tmp3_2) * (s1_104_0 + s1_104_2);
    gl64_t kC104 = (tmp3_1 + tmp3_2) * (s1_104_1 + s1_104_2);
    gl64_t kD104 = tmp3_0 * s1_104_0;
    gl64_t kE104 = tmp3_1 * s1_104_1;
    gl64_t kF104 = tmp3_2 * s1_104_2;
    gl64_t kG104 = kD104 - kE104;
    tmp3_0 = (kC104 + kG104) - kF104;
    tmp3_1 = ((((kA104 + kC104) - kE104) - kE104) - kD104);
    tmp3_2 = kB104 - kG104;
    // Op 105: dim1x1 sub_swap
    gl64_t s0_105 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_105 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_105 - s0_105;
    // Op 106: dim1x1 mul
    gl64_t s0_106 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    tmp1_0 = s0_106 * tmp1_0;
    // Op 107: dim1x1 sub
    gl64_t s0_107 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_107 = *(gl64_t*)&expressions_params[10][7];
    tmp1_1 = s0_107 - s1_107;
    // Op 108: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
    // Op 109: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 110: dim3x3 mul
    gl64_t s1_110_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_110_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_110_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA110 = (tmp3_0 + tmp3_1) * (s1_110_0 + s1_110_1);
    gl64_t kB110 = (tmp3_0 + tmp3_2) * (s1_110_0 + s1_110_2);
    gl64_t kC110 = (tmp3_1 + tmp3_2) * (s1_110_1 + s1_110_2);
    gl64_t kD110 = tmp3_0 * s1_110_0;
    gl64_t kE110 = tmp3_1 * s1_110_1;
    gl64_t kF110 = tmp3_2 * s1_110_2;
    gl64_t kG110 = kD110 - kE110;
    tmp3_0 = (kC110 + kG110) - kF110;
    tmp3_1 = ((((kA110 + kC110) - kE110) - kE110) - kD110);
    tmp3_2 = kB110 - kG110;
    // Op 111: dim1x1 sub_swap
    gl64_t s0_111 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_111 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_111 - s0_111;
    // Op 112: dim1x1 mul
    gl64_t s0_112 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    tmp1_0 = s0_112 * tmp1_0;
    // Op 113: dim1x1 sub
    gl64_t s0_113 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    gl64_t s1_113 = *(gl64_t*)&expressions_params[10][8];
    tmp1_1 = s0_113 - s1_113;
    // Op 114: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
    // Op 115: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 116: dim3x3 mul
    gl64_t s1_116_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_116_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_116_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA116 = (tmp3_0 + tmp3_1) * (s1_116_0 + s1_116_1);
    gl64_t kB116 = (tmp3_0 + tmp3_2) * (s1_116_0 + s1_116_2);
    gl64_t kC116 = (tmp3_1 + tmp3_2) * (s1_116_1 + s1_116_2);
    gl64_t kD116 = tmp3_0 * s1_116_0;
    gl64_t kE116 = tmp3_1 * s1_116_1;
    gl64_t kF116 = tmp3_2 * s1_116_2;
    gl64_t kG116 = kD116 - kE116;
    tmp3_0 = (kC116 + kG116) - kF116;
    tmp3_1 = ((((kA116 + kC116) - kE116) - kE116) - kD116);
    tmp3_2 = kB116 - kG116;
    // Op 117: dim1x1 sub_swap
    gl64_t s0_117 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_117 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_117 - s0_117;
    // Op 118: dim1x1 mul
    gl64_t s0_118 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    tmp1_0 = s0_118 * tmp1_0;
    // Op 119: dim1x1 sub
    gl64_t s0_119 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    gl64_t s1_119 = *(gl64_t*)&expressions_params[10][9];
    tmp1_1 = s0_119 - s1_119;
    // Op 120: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
    // Op 121: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 122: dim3x3 mul
    gl64_t s1_122_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_122_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_122_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA122 = (tmp3_0 + tmp3_1) * (s1_122_0 + s1_122_1);
    gl64_t kB122 = (tmp3_0 + tmp3_2) * (s1_122_0 + s1_122_2);
    gl64_t kC122 = (tmp3_1 + tmp3_2) * (s1_122_1 + s1_122_2);
    gl64_t kD122 = tmp3_0 * s1_122_0;
    gl64_t kE122 = tmp3_1 * s1_122_1;
    gl64_t kF122 = tmp3_2 * s1_122_2;
    gl64_t kG122 = kD122 - kE122;
    tmp3_0 = (kC122 + kG122) - kF122;
    tmp3_1 = ((((kA122 + kC122) - kE122) - kE122) - kD122);
    tmp3_2 = kB122 - kG122;
    // Op 123: dim1x1 sub_swap
    gl64_t s0_123 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_123 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_123 - s0_123;
    // Op 124: dim1x1 mul
    gl64_t s0_124 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    tmp1_0 = s0_124 * tmp1_0;
    // Op 125: dim1x1 mul
    gl64_t s0_125 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    gl64_t s1_125 = *(gl64_t*)&expressions_params[9][5];
    tmp1_2 = s0_125 * s1_125;
    // Op 126: dim1x1 sub
    gl64_t s1_126 = *(gl64_t*)&expressions_params[10][10];
    tmp1_1 = tmp1_2 - s1_126;
    // Op 127: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
    // Op 128: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 129: dim3x3 mul
    gl64_t s1_129_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_129_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_129_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA129 = (tmp3_0 + tmp3_1) * (s1_129_0 + s1_129_1);
    gl64_t kB129 = (tmp3_0 + tmp3_2) * (s1_129_0 + s1_129_2);
    gl64_t kC129 = (tmp3_1 + tmp3_2) * (s1_129_1 + s1_129_2);
    gl64_t kD129 = tmp3_0 * s1_129_0;
    gl64_t kE129 = tmp3_1 * s1_129_1;
    gl64_t kF129 = tmp3_2 * s1_129_2;
    gl64_t kG129 = kD129 - kE129;
    tmp3_0 = (kC129 + kG129) - kF129;
    tmp3_1 = ((((kA129 + kC129) - kE129) - kE129) - kD129);
    tmp3_2 = kB129 - kG129;
    // Op 130: dim1x1 mul
    gl64_t s0_130 = *(gl64_t*)&expressions_params[10][7];
    gl64_t s1_130 = *(gl64_t*)&expressions_params[10][6];
    tmp1_0 = s0_130 * s1_130;
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
    // Op 133: dim1x1 mul
    gl64_t s0_133 = *(gl64_t*)&expressions_params[10][9];
    gl64_t s1_133 = *(gl64_t*)&expressions_params[10][6];
    tmp1_0 = s0_133 * s1_133;
    // Op 134: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 135: dim3x3 mul
    gl64_t s1_135_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_135_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_135_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA135 = (tmp3_0 + tmp3_1) * (s1_135_0 + s1_135_1);
    gl64_t kB135 = (tmp3_0 + tmp3_2) * (s1_135_0 + s1_135_2);
    gl64_t kC135 = (tmp3_1 + tmp3_2) * (s1_135_1 + s1_135_2);
    gl64_t kD135 = tmp3_0 * s1_135_0;
    gl64_t kE135 = tmp3_1 * s1_135_1;
    gl64_t kF135 = tmp3_2 * s1_135_2;
    gl64_t kG135 = kD135 - kE135;
    tmp3_0 = (kC135 + kG135) - kF135;
    tmp3_1 = ((((kA135 + kC135) - kE135) - kE135) - kD135);
    tmp3_2 = kB135 - kG135;
    // Op 136: dim1x1 mul
    gl64_t s0_136 = *(gl64_t*)&expressions_params[10][8];
    gl64_t s1_136 = *(gl64_t*)&expressions_params[10][6];
    tmp1_0 = s0_136 * s1_136;
    // Op 137: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 138: dim3x3 mul
    gl64_t s1_138_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_138_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_138_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA138 = (tmp3_0 + tmp3_1) * (s1_138_0 + s1_138_1);
    gl64_t kB138 = (tmp3_0 + tmp3_2) * (s1_138_0 + s1_138_2);
    gl64_t kC138 = (tmp3_1 + tmp3_2) * (s1_138_1 + s1_138_2);
    gl64_t kD138 = tmp3_0 * s1_138_0;
    gl64_t kE138 = tmp3_1 * s1_138_1;
    gl64_t kF138 = tmp3_2 * s1_138_2;
    gl64_t kG138 = kD138 - kE138;
    tmp3_0 = (kC138 + kG138) - kF138;
    tmp3_1 = ((((kA138 + kC138) - kE138) - kE138) - kD138);
    tmp3_2 = kB138 - kG138;
    // Op 139: dim1x1 mul
    gl64_t s0_139 = *(gl64_t*)&expressions_params[10][10];
    gl64_t s1_139 = *(gl64_t*)&expressions_params[10][6];
    tmp1_0 = s0_139 * s1_139;
    // Op 140: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 141: dim3x3 mul
    gl64_t s1_141_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_141_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_141_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA141 = (tmp3_0 + tmp3_1) * (s1_141_0 + s1_141_1);
    gl64_t kB141 = (tmp3_0 + tmp3_2) * (s1_141_0 + s1_141_2);
    gl64_t kC141 = (tmp3_1 + tmp3_2) * (s1_141_1 + s1_141_2);
    gl64_t kD141 = tmp3_0 * s1_141_0;
    gl64_t kE141 = tmp3_1 * s1_141_1;
    gl64_t kF141 = tmp3_2 * s1_141_2;
    gl64_t kG141 = kD141 - kE141;
    tmp3_0 = (kC141 + kG141) - kF141;
    tmp3_1 = ((((kA141 + kC141) - kE141) - kE141) - kD141);
    tmp3_2 = kB141 - kG141;
    // Op 142: dim1x1 mul
    gl64_t s0_142 = *(gl64_t*)&expressions_params[10][2];
    gl64_t s1_142 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_142 * s1_142;
    // Op 143: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 144: dim3x3 mul
    gl64_t s1_144_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_144_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_144_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA144 = (tmp3_0 + tmp3_1) * (s1_144_0 + s1_144_1);
    gl64_t kB144 = (tmp3_0 + tmp3_2) * (s1_144_0 + s1_144_2);
    gl64_t kC144 = (tmp3_1 + tmp3_2) * (s1_144_1 + s1_144_2);
    gl64_t kD144 = tmp3_0 * s1_144_0;
    gl64_t kE144 = tmp3_1 * s1_144_1;
    gl64_t kF144 = tmp3_2 * s1_144_2;
    gl64_t kG144 = kD144 - kE144;
    tmp3_0 = (kC144 + kG144) - kF144;
    tmp3_1 = ((((kA144 + kC144) - kE144) - kE144) - kD144);
    tmp3_2 = kB144 - kG144;
    // Op 145: dim1x1 mul
    gl64_t s0_145 = *(gl64_t*)&expressions_params[10][4];
    gl64_t s1_145 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_145 * s1_145;
    // Op 146: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 147: dim3x3 mul
    gl64_t s1_147_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_147_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_147_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA147 = (tmp3_0 + tmp3_1) * (s1_147_0 + s1_147_1);
    gl64_t kB147 = (tmp3_0 + tmp3_2) * (s1_147_0 + s1_147_2);
    gl64_t kC147 = (tmp3_1 + tmp3_2) * (s1_147_1 + s1_147_2);
    gl64_t kD147 = tmp3_0 * s1_147_0;
    gl64_t kE147 = tmp3_1 * s1_147_1;
    gl64_t kF147 = tmp3_2 * s1_147_2;
    gl64_t kG147 = kD147 - kE147;
    tmp3_0 = (kC147 + kG147) - kF147;
    tmp3_1 = ((((kA147 + kC147) - kE147) - kE147) - kD147);
    tmp3_2 = kB147 - kG147;
    // Op 148: dim1x1 mul
    gl64_t s0_148 = *(gl64_t*)&expressions_params[10][3];
    gl64_t s1_148 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_148 * s1_148;
    // Op 149: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 150: dim3x3 mul
    gl64_t s1_150_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_150_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_150_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA150 = (tmp3_0 + tmp3_1) * (s1_150_0 + s1_150_1);
    gl64_t kB150 = (tmp3_0 + tmp3_2) * (s1_150_0 + s1_150_2);
    gl64_t kC150 = (tmp3_1 + tmp3_2) * (s1_150_1 + s1_150_2);
    gl64_t kD150 = tmp3_0 * s1_150_0;
    gl64_t kE150 = tmp3_1 * s1_150_1;
    gl64_t kF150 = tmp3_2 * s1_150_2;
    gl64_t kG150 = kD150 - kE150;
    tmp3_0 = (kC150 + kG150) - kF150;
    tmp3_1 = ((((kA150 + kC150) - kE150) - kE150) - kD150);
    tmp3_2 = kB150 - kG150;
    // Op 151: dim1x1 mul
    gl64_t s0_151 = *(gl64_t*)&expressions_params[10][5];
    gl64_t s1_151 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_151 * s1_151;
    // Op 152: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 153: dim3x3 mul
    gl64_t s1_153_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_153_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_153_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA153 = (tmp3_0 + tmp3_1) * (s1_153_0 + s1_153_1);
    gl64_t kB153 = (tmp3_0 + tmp3_2) * (s1_153_0 + s1_153_2);
    gl64_t kC153 = (tmp3_1 + tmp3_2) * (s1_153_1 + s1_153_2);
    gl64_t kD153 = tmp3_0 * s1_153_0;
    gl64_t kE153 = tmp3_1 * s1_153_1;
    gl64_t kF153 = tmp3_2 * s1_153_2;
    gl64_t kG153 = kD153 - kE153;
    tmp3_0 = (kC153 + kG153) - kF153;
    tmp3_1 = ((((kA153 + kC153) - kE153) - kE153) - kD153);
    tmp3_2 = kB153 - kG153;
    // Op 154: dim1x1 sub
    gl64_t s0_154 = *(gl64_t*)&expressions_params[9][0];
    gl64_t s1_154 = *(gl64_t*)&expressions_params[10][1];
    tmp1_0 = s0_154 - s1_154;
    // Op 155: dim1x1 mul
    gl64_t s0_155 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_0)];
    tmp1_3 = s0_155 * tmp1_0;
    // Op 156: dim1x1 sub_swap
    gl64_t s0_156 = *(gl64_t*)&expressions_params[9][5];
    gl64_t s1_156 = *(gl64_t*)&expressions_params[10][4];
    tmp1_0 = s1_156 - s0_156;
    // Op 157: dim1x1 sub
    gl64_t s0_157 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    tmp1_0 = s0_157 - tmp1_0;
    // Op 158: dim1x1 mul
    tmp1_0 = tmp1_3 * tmp1_0;
    // Op 159: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 160: dim3x3 mul
    gl64_t s1_160_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_160_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_160_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA160 = (tmp3_0 + tmp3_1) * (s1_160_0 + s1_160_1);
    gl64_t kB160 = (tmp3_0 + tmp3_2) * (s1_160_0 + s1_160_2);
    gl64_t kC160 = (tmp3_1 + tmp3_2) * (s1_160_1 + s1_160_2);
    gl64_t kD160 = tmp3_0 * s1_160_0;
    gl64_t kE160 = tmp3_1 * s1_160_1;
    gl64_t kF160 = tmp3_2 * s1_160_2;
    gl64_t kG160 = kD160 - kE160;
    tmp3_0 = (kC160 + kG160) - kF160;
    tmp3_1 = ((((kA160 + kC160) - kE160) - kE160) - kD160);
    tmp3_2 = kB160 - kG160;
    // Op 161: dim1x1 sub_swap
    gl64_t s0_161 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_0)];
    gl64_t s1_161 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_161 - s0_161;
    // Op 162: dim1x1 sub_swap
    gl64_t s0_162 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 0, domainSize, nCols_1))];
    gl64_t s1_162 = *(gl64_t*)&expressions_params[9][0];
    tmp1_1 = s1_162 - s0_162;
    // Op 163: dim1x1 mul
    tmp1_4 = tmp1_0 * tmp1_1;
    // Op 164: dim1x1 sub
    gl64_t s0_164 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 6, domainSize, nCols_1))];
    gl64_t s1_164 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_164 - s1_164;
    // Op 165: dim1x1 sub
    gl64_t s0_165 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    tmp1_0 = s0_165 - tmp1_0;
    // Op 166: dim1x1 mul
    tmp1_0 = tmp1_4 * tmp1_0;
    // Op 167: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 168: dim3x3 mul
    gl64_t s1_168_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_168_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_168_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA168 = (tmp3_0 + tmp3_1) * (s1_168_0 + s1_168_1);
    gl64_t kB168 = (tmp3_0 + tmp3_2) * (s1_168_0 + s1_168_2);
    gl64_t kC168 = (tmp3_1 + tmp3_2) * (s1_168_1 + s1_168_2);
    gl64_t kD168 = tmp3_0 * s1_168_0;
    gl64_t kE168 = tmp3_1 * s1_168_1;
    gl64_t kF168 = tmp3_2 * s1_168_2;
    gl64_t kG168 = kD168 - kE168;
    tmp3_0 = (kC168 + kG168) - kF168;
    tmp3_1 = ((((kA168 + kC168) - kE168) - kE168) - kD168);
    tmp3_2 = kB168 - kG168;
    // Op 169: dim1x1 add
    gl64_t s0_169 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    gl64_t s1_169 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    tmp1_0 = s0_169 + s1_169;
    // Op 170: dim1x1 add
    gl64_t s0_170 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    tmp1_0 = s0_170 + tmp1_0;
    // Op 171: dim1x1 add
    gl64_t s0_171 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    tmp1_0 = s0_171 + tmp1_0;
    // Op 172: dim1x1 add
    gl64_t s0_172 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    tmp1_0 = s0_172 + tmp1_0;
    // Op 173: dim1x1 add
    gl64_t s0_173 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    tmp1_0 = s0_173 + tmp1_0;
    // Op 174: dim1x1 add
    gl64_t s0_174 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    tmp1_0 = s0_174 + tmp1_0;
    // Op 175: dim1x1 add
    gl64_t s0_175 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    tmp1_1 = s0_175 + tmp1_0;
    // Op 176: dim1x1 sub
    gl64_t s0_176 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    tmp1_0 = s0_176 - tmp1_1;
    // Op 177: dim1x1 mul
    gl64_t s0_177 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    tmp1_0 = s0_177 * tmp1_0;
    // Op 178: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 179: dim3x3 mul
    gl64_t s1_179_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_179_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_179_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA179 = (tmp3_0 + tmp3_1) * (s1_179_0 + s1_179_1);
    gl64_t kB179 = (tmp3_0 + tmp3_2) * (s1_179_0 + s1_179_2);
    gl64_t kC179 = (tmp3_1 + tmp3_2) * (s1_179_1 + s1_179_2);
    gl64_t kD179 = tmp3_0 * s1_179_0;
    gl64_t kE179 = tmp3_1 * s1_179_1;
    gl64_t kF179 = tmp3_2 * s1_179_2;
    gl64_t kG179 = kD179 - kE179;
    tmp3_0 = (kC179 + kG179) - kF179;
    tmp3_1 = ((((kA179 + kC179) - kE179) - kE179) - kD179);
    tmp3_2 = kB179 - kG179;
    // Op 180: dim1x1 sub_swap
    gl64_t s0_180 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_1))];
    gl64_t s1_180 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_180 - s0_180;
    // Op 181: dim1x1 sub
    gl64_t s1_181 = *(gl64_t*)&expressions_params[9][5];
    tmp1_1 = tmp1_1 - s1_181;
    // Op 182: dim1x1 mul
    tmp1_0 = tmp1_0 * tmp1_1;
    // Op 183: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    tmp3_0 = (kC184 + kG184) - kF184;
    tmp3_1 = ((((kA184 + kC184) - kE184) - kE184) - kD184);
    tmp3_2 = kB184 - kG184;
    // Op 185: dim1x1 add
    gl64_t s0_185 = *(gl64_t*)&expressions_params[9][5];
    gl64_t s1_185 = *(gl64_t*)&expressions_params[10][2];
    tmp1_0 = s0_185 + s1_185;
    // Op 186: dim1x1 sub
    gl64_t s0_186 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    tmp1_0 = s0_186 - tmp1_0;
    // Op 187: dim1x1 mul
    tmp1_0 = tmp1_3 * tmp1_0;
    // Op 188: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 189: dim3x3 mul
    gl64_t s1_189_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_189_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_189_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA189 = (tmp3_0 + tmp3_1) * (s1_189_0 + s1_189_1);
    gl64_t kB189 = (tmp3_0 + tmp3_2) * (s1_189_0 + s1_189_2);
    gl64_t kC189 = (tmp3_1 + tmp3_2) * (s1_189_1 + s1_189_2);
    gl64_t kD189 = tmp3_0 * s1_189_0;
    gl64_t kE189 = tmp3_1 * s1_189_1;
    gl64_t kF189 = tmp3_2 * s1_189_2;
    gl64_t kG189 = kD189 - kE189;
    tmp3_0 = (kC189 + kG189) - kF189;
    tmp3_1 = ((((kA189 + kC189) - kE189) - kE189) - kD189);
    tmp3_2 = kB189 - kG189;
    // Op 190: dim1x1 add
    gl64_t s0_190 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 5, domainSize, nCols_1))];
    gl64_t s1_190 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_190 + s1_190;
    // Op 191: dim1x1 sub
    gl64_t s0_191 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    tmp1_0 = s0_191 - tmp1_0;
    // Op 192: dim1x1 mul
    tmp1_0 = tmp1_4 * tmp1_0;
    // Op 193: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 194: dim3x3 mul
    gl64_t s1_194_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_194_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_194_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA194 = (tmp3_0 + tmp3_1) * (s1_194_0 + s1_194_1);
    gl64_t kB194 = (tmp3_0 + tmp3_2) * (s1_194_0 + s1_194_2);
    gl64_t kC194 = (tmp3_1 + tmp3_2) * (s1_194_1 + s1_194_2);
    gl64_t kD194 = tmp3_0 * s1_194_0;
    gl64_t kE194 = tmp3_1 * s1_194_1;
    gl64_t kF194 = tmp3_2 * s1_194_2;
    gl64_t kG194 = kD194 - kE194;
    tmp3_0 = (kC194 + kG194) - kF194;
    tmp3_1 = ((((kA194 + kC194) - kE194) - kE194) - kD194);
    tmp3_2 = kB194 - kG194;
    // Op 195: dim1x1 sub
    gl64_t s1_195 = *(gl64_t*)&expressions_params[10][5];
    tmp1_0 = tmp1_2 - s1_195;
    // Op 196: dim1x1 mul
    tmp1_0 = tmp1_3 * tmp1_0;
    // Op 197: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 198: dim3x3 mul
    gl64_t s1_198_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_198_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_198_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA198 = (tmp3_0 + tmp3_1) * (s1_198_0 + s1_198_1);
    gl64_t kB198 = (tmp3_0 + tmp3_2) * (s1_198_0 + s1_198_2);
    gl64_t kC198 = (tmp3_1 + tmp3_2) * (s1_198_1 + s1_198_2);
    gl64_t kD198 = tmp3_0 * s1_198_0;
    gl64_t kE198 = tmp3_1 * s1_198_1;
    gl64_t kF198 = tmp3_2 * s1_198_2;
    gl64_t kG198 = kD198 - kE198;
    tmp3_0 = (kC198 + kG198) - kF198;
    tmp3_1 = ((((kA198 + kC198) - kE198) - kE198) - kD198);
    tmp3_2 = kB198 - kG198;
    // Op 199: dim1x1 mul
    gl64_t s0_199 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 2, domainSize, nCols_1))];
    gl64_t s1_199 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_199 * s1_199;
    // Op 200: dim1x1 sub
    tmp1_0 = tmp1_2 - tmp1_0;
    // Op 201: dim1x1 mul
    tmp1_0 = tmp1_4 * tmp1_0;
    // Op 202: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 203: dim3x3 mul
    gl64_t s1_203_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_203_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_203_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA203 = (tmp3_0 + tmp3_1) * (s1_203_0 + s1_203_1);
    gl64_t kB203 = (tmp3_0 + tmp3_2) * (s1_203_0 + s1_203_2);
    gl64_t kC203 = (tmp3_1 + tmp3_2) * (s1_203_1 + s1_203_2);
    gl64_t kD203 = tmp3_0 * s1_203_0;
    gl64_t kE203 = tmp3_1 * s1_203_1;
    gl64_t kF203 = tmp3_2 * s1_203_2;
    gl64_t kG203 = kD203 - kE203;
    tmp3_0 = (kC203 + kG203) - kF203;
    tmp3_1 = ((((kA203 + kC203) - kE203) - kE203) - kD203);
    tmp3_2 = kB203 - kG203;
    // Op 204: dim1x1 sub
    gl64_t s0_204 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    gl64_t s1_204 = *(gl64_t*)&expressions_params[10][3];
    tmp1_0 = s0_204 - s1_204;
    // Op 205: dim1x1 mul
    tmp1_0 = tmp1_3 * tmp1_0;
    // Op 206: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 207: dim3x3 mul
    gl64_t s1_207_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_207_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_207_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA207 = (tmp3_0 + tmp3_1) * (s1_207_0 + s1_207_1);
    gl64_t kB207 = (tmp3_0 + tmp3_2) * (s1_207_0 + s1_207_2);
    gl64_t kC207 = (tmp3_1 + tmp3_2) * (s1_207_1 + s1_207_2);
    gl64_t kD207 = tmp3_0 * s1_207_0;
    gl64_t kE207 = tmp3_1 * s1_207_1;
    gl64_t kF207 = tmp3_2 * s1_207_2;
    gl64_t kG207 = kD207 - kE207;
    tmp3_0 = (kC207 + kG207) - kF207;
    tmp3_1 = ((((kA207 + kC207) - kE207) - kE207) - kD207);
    tmp3_2 = kB207 - kG207;
    // Op 208: dim1x1 sub
    gl64_t s0_208 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    gl64_t s1_208 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 4, domainSize, nCols_1))];
    tmp1_0 = s0_208 - s1_208;
    // Op 209: dim1x1 mul
    tmp1_0 = tmp1_4 * tmp1_0;
    // Op 210: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 211: dim3x3 mul
    gl64_t s1_211_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_211_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_211_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA211 = (tmp3_0 + tmp3_1) * (s1_211_0 + s1_211_1);
    gl64_t kB211 = (tmp3_0 + tmp3_2) * (s1_211_0 + s1_211_2);
    gl64_t kC211 = (tmp3_1 + tmp3_2) * (s1_211_1 + s1_211_2);
    gl64_t kD211 = tmp3_0 * s1_211_0;
    gl64_t kE211 = tmp3_1 * s1_211_1;
    gl64_t kF211 = tmp3_2 * s1_211_2;
    gl64_t kG211 = kD211 - kE211;
    tmp3_0 = (kC211 + kG211) - kF211;
    tmp3_1 = ((((kA211 + kC211) - kE211) - kE211) - kD211);
    tmp3_2 = kB211 - kG211;
    // Op 212: dim1x1 sub
    gl64_t s0_212 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_212 = *(gl64_t*)&expressions_params[10][12];
    tmp1_0 = s0_212 - s1_212;
    // Op 213: dim1x1 mul
    tmp1_0 = tmp1_3 * tmp1_0;
    // Op 214: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 215: dim3x3 mul
    gl64_t s1_215_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_215_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_215_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA215 = (tmp3_0 + tmp3_1) * (s1_215_0 + s1_215_1);
    gl64_t kB215 = (tmp3_0 + tmp3_2) * (s1_215_0 + s1_215_2);
    gl64_t kC215 = (tmp3_1 + tmp3_2) * (s1_215_1 + s1_215_2);
    gl64_t kD215 = tmp3_0 * s1_215_0;
    gl64_t kE215 = tmp3_1 * s1_215_1;
    gl64_t kF215 = tmp3_2 * s1_215_2;
    gl64_t kG215 = kD215 - kE215;
    tmp3_0 = (kC215 + kG215) - kF215;
    tmp3_1 = ((((kA215 + kC215) - kE215) - kE215) - kD215);
    tmp3_2 = kB215 - kG215;
    // Op 216: dim1x1 sub
    gl64_t s0_216 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_216 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (false ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_0, 3, domainSize, nCols_1))];
    tmp1_0 = s0_216 - s1_216;
    // Op 217: dim1x1 mul
    tmp1_0 = tmp1_4 * tmp1_0;
    // Op 218: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 219: dim3x3 mul
    gl64_t s1_219_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_219_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_219_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA219 = (tmp3_0 + tmp3_1) * (s1_219_0 + s1_219_1);
    gl64_t kB219 = (tmp3_0 + tmp3_2) * (s1_219_0 + s1_219_2);
    gl64_t kC219 = (tmp3_1 + tmp3_2) * (s1_219_1 + s1_219_2);
    gl64_t kD219 = tmp3_0 * s1_219_0;
    gl64_t kE219 = tmp3_1 * s1_219_1;
    gl64_t kF219 = tmp3_2 * s1_219_2;
    gl64_t kG219 = kD219 - kE219;
    tmp3_0 = (kC219 + kG219) - kF219;
    tmp3_1 = ((((kA219 + kC219) - kE219) - kE219) - kD219);
    tmp3_2 = kB219 - kG219;
    // Op 220: dim1x1 mul
    gl64_t s0_220 = *(gl64_t*)&expressions_params[9][3];
    gl64_t s1_220 = *(gl64_t*)&expressions_params[10][15];
    tmp1_0 = s0_220 * s1_220;
    // Op 221: dim1x1 add
    gl64_t s1_221 = *(gl64_t*)&expressions_params[10][14];
    tmp1_0 = tmp1_0 + s1_221;
    // Op 222: dim1x1 sub
    gl64_t s1_222 = *(gl64_t*)&expressions_params[10][9];
    tmp1_0 = tmp1_0 - s1_222;
    // Op 223: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 224: dim3x3 mul
    gl64_t s1_224_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_224_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_224_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA224 = (tmp3_0 + tmp3_1) * (s1_224_0 + s1_224_1);
    gl64_t kB224 = (tmp3_0 + tmp3_2) * (s1_224_0 + s1_224_2);
    gl64_t kC224 = (tmp3_1 + tmp3_2) * (s1_224_1 + s1_224_2);
    gl64_t kD224 = tmp3_0 * s1_224_0;
    gl64_t kE224 = tmp3_1 * s1_224_1;
    gl64_t kF224 = tmp3_2 * s1_224_2;
    gl64_t kG224 = kD224 - kE224;
    tmp3_12 = (kC224 + kG224) - kF224;
    tmp3_13 = ((((kA224 + kC224) - kE224) - kE224) - kD224);
    tmp3_14 = kB224 - kG224;
    // Op 225: dim1x1 mul
    gl64_t s0_225 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_225 = *(gl64_t*)&expressions_params[9][2];
    tmp1_0 = s0_225 * s1_225;
    // Op 226: dim1x1 add
    gl64_t s0_226 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    tmp1_0 = s0_226 + tmp1_0;
    // Op 227: dim1x1 mul
    gl64_t s0_227 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_227 = *(gl64_t*)&expressions_params[9][3];
    tmp1_4 = s0_227 * s1_227;
    // Op 228: dim1x1 add
    tmp1_0 = tmp1_0 + tmp1_4;
    // Op 229: dim1x1 mul
    gl64_t s0_229 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    gl64_t s1_229 = *(gl64_t*)&expressions_params[9][4];
    tmp1_4 = s0_229 * s1_229;
    // Op 230: dim1x1 add
    tmp1_4 = tmp1_0 + tmp1_4;
    // Op 231: dim3x1 mul
    gl64_t s0_231_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_231_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_231_2 = *(gl64_t*)&expressions_params[13][0+2];
    tmp3_0 = s0_231_0 * tmp1_4; tmp3_1 = s0_231_1 * tmp1_4; tmp3_2 = s0_231_2 * tmp1_4;
    // Op 232: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_4; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 233: dim3x3 mul
    gl64_t s1_233_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_233_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_233_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA233 = (tmp3_0 + tmp3_1) * (s1_233_0 + s1_233_1);
    gl64_t kB233 = (tmp3_0 + tmp3_2) * (s1_233_0 + s1_233_2);
    gl64_t kC233 = (tmp3_1 + tmp3_2) * (s1_233_1 + s1_233_2);
    gl64_t kD233 = tmp3_0 * s1_233_0;
    gl64_t kE233 = tmp3_1 * s1_233_1;
    gl64_t kF233 = tmp3_2 * s1_233_2;
    gl64_t kG233 = kD233 - kE233;
    tmp3_0 = (kC233 + kG233) - kF233;
    tmp3_1 = ((((kA233 + kC233) - kE233) - kE233) - kD233);
    tmp3_2 = kB233 - kG233;
    // Op 234: dim3x1 add
    gl64_t s1_234 = *(gl64_t*)&expressions_params[9][5];
    tmp3_0 = tmp3_0 + s1_234; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 235: dim3x3 mul
    gl64_t s1_235_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_235_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_235_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA235 = (tmp3_0 + tmp3_1) * (s1_235_0 + s1_235_1);
    gl64_t kB235 = (tmp3_0 + tmp3_2) * (s1_235_0 + s1_235_2);
    gl64_t kC235 = (tmp3_1 + tmp3_2) * (s1_235_1 + s1_235_2);
    gl64_t kD235 = tmp3_0 * s1_235_0;
    gl64_t kE235 = tmp3_1 * s1_235_1;
    gl64_t kF235 = tmp3_2 * s1_235_2;
    gl64_t kG235 = kD235 - kE235;
    tmp3_0 = (kC235 + kG235) - kF235;
    tmp3_1 = ((((kA235 + kC235) - kE235) - kE235) - kD235);
    tmp3_2 = kB235 - kG235;
    // Op 236: dim1x1 mul
    gl64_t s0_236 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    gl64_t s1_236 = *(gl64_t*)&expressions_params[9][6];
    tmp1_0 = s0_236 * s1_236;
    // Op 237: dim1x1 add
    gl64_t s1_237 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_237;
    // Op 238: dim1x1 add
    gl64_t s0_238 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    tmp1_0 = s0_238 + tmp1_0;
    // Op 239: dim1x1 add
    gl64_t s1_239 = *(gl64_t*)&expressions_params[9][7];
    tmp1_0 = tmp1_0 + s1_239;
    // Op 240: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 241: dim3x3 mul
    gl64_t s1_241_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_241_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_241_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA241 = (tmp3_0 + tmp3_1) * (s1_241_0 + s1_241_1);
    gl64_t kB241 = (tmp3_0 + tmp3_2) * (s1_241_0 + s1_241_2);
    gl64_t kC241 = (tmp3_1 + tmp3_2) * (s1_241_1 + s1_241_2);
    gl64_t kD241 = tmp3_0 * s1_241_0;
    gl64_t kE241 = tmp3_1 * s1_241_1;
    gl64_t kF241 = tmp3_2 * s1_241_2;
    gl64_t kG241 = kD241 - kE241;
    tmp3_0 = (kC241 + kG241) - kF241;
    tmp3_1 = ((((kA241 + kC241) - kE241) - kE241) - kD241);
    tmp3_2 = kB241 - kG241;
    // Op 242: dim1x1 mul
    gl64_t s0_242 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_242 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_242 * s1_242;
    // Op 243: dim1x1 add
    gl64_t s1_243 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = tmp1_0 + s1_243;
    // Op 244: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 245: dim3x3 mul
    gl64_t s1_245_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_245_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_245_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA245 = (tmp3_0 + tmp3_1) * (s1_245_0 + s1_245_1);
    gl64_t kB245 = (tmp3_0 + tmp3_2) * (s1_245_0 + s1_245_2);
    gl64_t kC245 = (tmp3_1 + tmp3_2) * (s1_245_1 + s1_245_2);
    gl64_t kD245 = tmp3_0 * s1_245_0;
    gl64_t kE245 = tmp3_1 * s1_245_1;
    gl64_t kF245 = tmp3_2 * s1_245_2;
    gl64_t kG245 = kD245 - kE245;
    tmp3_0 = (kC245 + kG245) - kF245;
    tmp3_1 = ((((kA245 + kC245) - kE245) - kE245) - kD245);
    tmp3_2 = kB245 - kG245;
    // Op 246: dim1x1 add
    gl64_t s0_246 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    gl64_t s1_246 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s0_246 + s1_246;
    // Op 247: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 248: dim3x3 mul
    gl64_t s1_248_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_248_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_248_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA248 = (tmp3_0 + tmp3_1) * (s1_248_0 + s1_248_1);
    gl64_t kB248 = (tmp3_0 + tmp3_2) * (s1_248_0 + s1_248_2);
    gl64_t kC248 = (tmp3_1 + tmp3_2) * (s1_248_1 + s1_248_2);
    gl64_t kD248 = tmp3_0 * s1_248_0;
    gl64_t kE248 = tmp3_1 * s1_248_1;
    gl64_t kF248 = tmp3_2 * s1_248_2;
    gl64_t kG248 = kD248 - kE248;
    tmp3_0 = (kC248 + kG248) - kF248;
    tmp3_1 = ((((kA248 + kC248) - kE248) - kE248) - kD248);
    tmp3_2 = kB248 - kG248;
    // Op 249: dim3x1 add
    gl64_t s1_249 = *(gl64_t*)&expressions_params[9][9];
    tmp3_9 = tmp3_0 + s1_249; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 250: dim3x3 add
    gl64_t s1_250_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_250_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_250_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_3 = tmp3_9 + s1_250_0; tmp3_4 = tmp3_10 + s1_250_1; tmp3_5 = tmp3_11 + s1_250_2;
    // Op 251: dim3x1 mul
    gl64_t s0_251_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_251_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_251_2 = *(gl64_t*)&expressions_params[13][0+2];
    tmp3_0 = s0_251_0 * tmp1_4; tmp3_1 = s0_251_1 * tmp1_4; tmp3_2 = s0_251_2 * tmp1_4;
    // Op 252: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_4; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 253: dim3x3 mul
    gl64_t s1_253_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_253_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_253_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA253 = (tmp3_0 + tmp3_1) * (s1_253_0 + s1_253_1);
    gl64_t kB253 = (tmp3_0 + tmp3_2) * (s1_253_0 + s1_253_2);
    gl64_t kC253 = (tmp3_1 + tmp3_2) * (s1_253_1 + s1_253_2);
    gl64_t kD253 = tmp3_0 * s1_253_0;
    gl64_t kE253 = tmp3_1 * s1_253_1;
    gl64_t kF253 = tmp3_2 * s1_253_2;
    gl64_t kG253 = kD253 - kE253;
    tmp3_0 = (kC253 + kG253) - kF253;
    tmp3_1 = ((((kA253 + kC253) - kE253) - kE253) - kD253);
    tmp3_2 = kB253 - kG253;
    // Op 254: dim3x1 add
    gl64_t s1_254 = *(gl64_t*)&expressions_params[9][5];
    tmp3_0 = tmp3_0 + s1_254; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 255: dim3x3 mul
    gl64_t s1_255_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_255_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_255_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA255 = (tmp3_0 + tmp3_1) * (s1_255_0 + s1_255_1);
    gl64_t kB255 = (tmp3_0 + tmp3_2) * (s1_255_0 + s1_255_2);
    gl64_t kC255 = (tmp3_1 + tmp3_2) * (s1_255_1 + s1_255_2);
    gl64_t kD255 = tmp3_0 * s1_255_0;
    gl64_t kE255 = tmp3_1 * s1_255_1;
    gl64_t kF255 = tmp3_2 * s1_255_2;
    gl64_t kG255 = kD255 - kE255;
    tmp3_0 = (kC255 + kG255) - kF255;
    tmp3_1 = ((((kA255 + kC255) - kE255) - kE255) - kD255);
    tmp3_2 = kB255 - kG255;
    // Op 256: dim1x1 mul
    gl64_t s0_256 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    gl64_t s1_256 = *(gl64_t*)&expressions_params[9][6];
    tmp1_0 = s0_256 * s1_256;
    // Op 257: dim1x1 add
    gl64_t s1_257 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_257;
    // Op 258: dim1x1 add
    gl64_t s0_258 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    tmp1_0 = s0_258 + tmp1_0;
    // Op 259: dim1x1 add
    gl64_t s1_259 = *(gl64_t*)&expressions_params[9][7];
    tmp1_0 = tmp1_0 + s1_259;
    // Op 260: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 261: dim3x3 mul
    gl64_t s1_261_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_261_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_261_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA261 = (tmp3_0 + tmp3_1) * (s1_261_0 + s1_261_1);
    gl64_t kB261 = (tmp3_0 + tmp3_2) * (s1_261_0 + s1_261_2);
    gl64_t kC261 = (tmp3_1 + tmp3_2) * (s1_261_1 + s1_261_2);
    gl64_t kD261 = tmp3_0 * s1_261_0;
    gl64_t kE261 = tmp3_1 * s1_261_1;
    gl64_t kF261 = tmp3_2 * s1_261_2;
    gl64_t kG261 = kD261 - kE261;
    tmp3_0 = (kC261 + kG261) - kF261;
    tmp3_1 = ((((kA261 + kC261) - kE261) - kE261) - kD261);
    tmp3_2 = kB261 - kG261;
    // Op 262: dim1x1 mul
    gl64_t s0_262 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_262 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_262 * s1_262;
    // Op 263: dim1x1 add
    gl64_t s1_263 = *(gl64_t*)&expressions_params[9][8];
    tmp1_0 = tmp1_0 + s1_263;
    // Op 264: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 265: dim3x3 mul
    gl64_t s1_265_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_265_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_265_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA265 = (tmp3_0 + tmp3_1) * (s1_265_0 + s1_265_1);
    gl64_t kB265 = (tmp3_0 + tmp3_2) * (s1_265_0 + s1_265_2);
    gl64_t kC265 = (tmp3_1 + tmp3_2) * (s1_265_1 + s1_265_2);
    gl64_t kD265 = tmp3_0 * s1_265_0;
    gl64_t kE265 = tmp3_1 * s1_265_1;
    gl64_t kF265 = tmp3_2 * s1_265_2;
    gl64_t kG265 = kD265 - kE265;
    tmp3_0 = (kC265 + kG265) - kF265;
    tmp3_1 = ((((kA265 + kC265) - kE265) - kE265) - kD265);
    tmp3_2 = kB265 - kG265;
    // Op 266: dim1x1 add
    gl64_t s0_266 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    gl64_t s1_266 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s0_266 + s1_266;
    // Op 267: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 268: dim3x3 mul
    gl64_t s1_268_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_268_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_268_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA268 = (tmp3_0 + tmp3_1) * (s1_268_0 + s1_268_1);
    gl64_t kB268 = (tmp3_0 + tmp3_2) * (s1_268_0 + s1_268_2);
    gl64_t kC268 = (tmp3_1 + tmp3_2) * (s1_268_1 + s1_268_2);
    gl64_t kD268 = tmp3_0 * s1_268_0;
    gl64_t kE268 = tmp3_1 * s1_268_1;
    gl64_t kF268 = tmp3_2 * s1_268_2;
    gl64_t kG268 = kD268 - kE268;
    tmp3_0 = (kC268 + kG268) - kF268;
    tmp3_1 = ((((kA268 + kC268) - kE268) - kE268) - kD268);
    tmp3_2 = kB268 - kG268;
    // Op 269: dim3x1 add
    gl64_t s1_269 = *(gl64_t*)&expressions_params[9][9];
    tmp3_6 = tmp3_0 + s1_269; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 270: dim3x3 add
    gl64_t s1_270_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_270_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_270_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_270_0; tmp3_1 = tmp3_7 + s1_270_1; tmp3_2 = tmp3_8 + s1_270_2;
    // Op 271: dim3x3 mul
    gl64_t kA271 = (tmp3_3 + tmp3_4) * (tmp3_0 + tmp3_1);
    gl64_t kB271 = (tmp3_3 + tmp3_5) * (tmp3_0 + tmp3_2);
    gl64_t kC271 = (tmp3_4 + tmp3_5) * (tmp3_1 + tmp3_2);
    gl64_t kD271 = tmp3_3 * tmp3_0;
    gl64_t kE271 = tmp3_4 * tmp3_1;
    gl64_t kF271 = tmp3_5 * tmp3_2;
    gl64_t kG271 = kD271 - kE271;
    tmp3_0 = (kC271 + kG271) - kF271;
    tmp3_1 = ((((kA271 + kC271) - kE271) - kE271) - kD271);
    tmp3_2 = kB271 - kG271;
    // Op 272: dim3x3 mul
    gl64_t s0_272_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+0, domainSize, nCols_2))];
    gl64_t s0_272_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+1, domainSize, nCols_2))];
    gl64_t s0_272_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+2, domainSize, nCols_2))];
    gl64_t kA272 = (s0_272_0 + s0_272_1) * (tmp3_0 + tmp3_1);
    gl64_t kB272 = (s0_272_0 + s0_272_2) * (tmp3_0 + tmp3_2);
    gl64_t kC272 = (s0_272_1 + s0_272_2) * (tmp3_1 + tmp3_2);
    gl64_t kD272 = s0_272_0 * tmp3_0;
    gl64_t kE272 = s0_272_1 * tmp3_1;
    gl64_t kF272 = s0_272_2 * tmp3_2;
    gl64_t kG272 = kD272 - kE272;
    tmp3_0 = (kC272 + kG272) - kF272;
    tmp3_1 = ((((kA272 + kC272) - kE272) - kE272) - kD272);
    tmp3_2 = kB272 - kG272;
    // Op 273: dim1x1 sub_swap
    gl64_t s0_273 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 7, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 7, domainSize, nCols_1))];
    gl64_t s1_273 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_273 - s0_273;
    // Op 274: dim3x3 add
    gl64_t s1_274_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_274_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_274_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_274_0; tmp3_7 = tmp3_7 + s1_274_1; tmp3_8 = tmp3_8 + s1_274_2;
    // Op 275: dim3x1 mul
    tmp3_6 = tmp3_6 * tmp1_0; tmp3_7 = tmp3_7 * tmp1_0; tmp3_8 = tmp3_8 * tmp1_0;
    // Op 276: dim1x1 sub_swap
    gl64_t s0_276 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 8, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 8, domainSize, nCols_1))];
    gl64_t s1_276 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_276 - s0_276;
    // Op 277: dim3x3 add
    gl64_t s1_277_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_277_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_277_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_277_0; tmp3_10 = tmp3_10 + s1_277_1; tmp3_11 = tmp3_11 + s1_277_2;
    // Op 278: dim3x1 mul
    tmp3_9 = tmp3_9 * tmp1_0; tmp3_10 = tmp3_10 * tmp1_0; tmp3_11 = tmp3_11 * tmp1_0;
    // Op 279: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 280: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 281: dim3x3 add
    tmp3_0 = tmp3_12 + tmp3_0; tmp3_1 = tmp3_13 + tmp3_1; tmp3_2 = tmp3_14 + tmp3_2;
    // Op 282: dim3x3 mul
    gl64_t s1_282_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_282_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_282_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA282 = (tmp3_0 + tmp3_1) * (s1_282_0 + s1_282_1);
    gl64_t kB282 = (tmp3_0 + tmp3_2) * (s1_282_0 + s1_282_2);
    gl64_t kC282 = (tmp3_1 + tmp3_2) * (s1_282_1 + s1_282_2);
    gl64_t kD282 = tmp3_0 * s1_282_0;
    gl64_t kE282 = tmp3_1 * s1_282_1;
    gl64_t kF282 = tmp3_2 * s1_282_2;
    gl64_t kG282 = kD282 - kE282;
    tmp3_3 = (kC282 + kG282) - kF282;
    tmp3_4 = ((((kA282 + kC282) - kE282) - kE282) - kD282);
    tmp3_5 = kB282 - kG282;
    // Op 283: dim3x1 mul
    gl64_t s0_283_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_283_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_283_2 = *(gl64_t*)&expressions_params[13][0+2];
    tmp3_0 = s0_283_0 * tmp1_4; tmp3_1 = s0_283_1 * tmp1_4; tmp3_2 = s0_283_2 * tmp1_4;
    // Op 284: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_4; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 285: dim3x3 mul
    gl64_t s1_285_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_285_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_285_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA285 = (tmp3_0 + tmp3_1) * (s1_285_0 + s1_285_1);
    gl64_t kB285 = (tmp3_0 + tmp3_2) * (s1_285_0 + s1_285_2);
    gl64_t kC285 = (tmp3_1 + tmp3_2) * (s1_285_1 + s1_285_2);
    gl64_t kD285 = tmp3_0 * s1_285_0;
    gl64_t kE285 = tmp3_1 * s1_285_1;
    gl64_t kF285 = tmp3_2 * s1_285_2;
    gl64_t kG285 = kD285 - kE285;
    tmp3_0 = (kC285 + kG285) - kF285;
    tmp3_1 = ((((kA285 + kC285) - kE285) - kE285) - kD285);
    tmp3_2 = kB285 - kG285;
    // Op 286: dim3x1 add
    gl64_t s1_286 = *(gl64_t*)&expressions_params[9][5];
    tmp3_0 = tmp3_0 + s1_286; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 287: dim3x3 mul
    gl64_t s1_287_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_287_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_287_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA287 = (tmp3_0 + tmp3_1) * (s1_287_0 + s1_287_1);
    gl64_t kB287 = (tmp3_0 + tmp3_2) * (s1_287_0 + s1_287_2);
    gl64_t kC287 = (tmp3_1 + tmp3_2) * (s1_287_1 + s1_287_2);
    gl64_t kD287 = tmp3_0 * s1_287_0;
    gl64_t kE287 = tmp3_1 * s1_287_1;
    gl64_t kF287 = tmp3_2 * s1_287_2;
    gl64_t kG287 = kD287 - kE287;
    tmp3_0 = (kC287 + kG287) - kF287;
    tmp3_1 = ((((kA287 + kC287) - kE287) - kE287) - kD287);
    tmp3_2 = kB287 - kG287;
    // Op 288: dim1x1 mul
    gl64_t s0_288 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    gl64_t s1_288 = *(gl64_t*)&expressions_params[9][6];
    tmp1_0 = s0_288 * s1_288;
    // Op 289: dim1x1 add
    gl64_t s1_289 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_289;
    // Op 290: dim1x1 add
    gl64_t s0_290 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    tmp1_0 = s0_290 + tmp1_0;
    // Op 291: dim1x1 add
    gl64_t s1_291 = *(gl64_t*)&expressions_params[9][7];
    tmp1_0 = tmp1_0 + s1_291;
    // Op 292: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 293: dim3x3 mul
    gl64_t s1_293_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_293_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_293_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA293 = (tmp3_0 + tmp3_1) * (s1_293_0 + s1_293_1);
    gl64_t kB293 = (tmp3_0 + tmp3_2) * (s1_293_0 + s1_293_2);
    gl64_t kC293 = (tmp3_1 + tmp3_2) * (s1_293_1 + s1_293_2);
    gl64_t kD293 = tmp3_0 * s1_293_0;
    gl64_t kE293 = tmp3_1 * s1_293_1;
    gl64_t kF293 = tmp3_2 * s1_293_2;
    gl64_t kG293 = kD293 - kE293;
    tmp3_0 = (kC293 + kG293) - kF293;
    tmp3_1 = ((((kA293 + kC293) - kE293) - kE293) - kD293);
    tmp3_2 = kB293 - kG293;
    // Op 294: dim1x1 mul
    gl64_t s0_294 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_294 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_294 * s1_294;
    // Op 295: dim1x1 add
    gl64_t s1_295 = *(gl64_t*)&expressions_params[9][11];
    tmp1_0 = tmp1_0 + s1_295;
    // Op 296: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 297: dim3x3 mul
    gl64_t s1_297_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_297_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_297_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA297 = (tmp3_0 + tmp3_1) * (s1_297_0 + s1_297_1);
    gl64_t kB297 = (tmp3_0 + tmp3_2) * (s1_297_0 + s1_297_2);
    gl64_t kC297 = (tmp3_1 + tmp3_2) * (s1_297_1 + s1_297_2);
    gl64_t kD297 = tmp3_0 * s1_297_0;
    gl64_t kE297 = tmp3_1 * s1_297_1;
    gl64_t kF297 = tmp3_2 * s1_297_2;
    gl64_t kG297 = kD297 - kE297;
    tmp3_0 = (kC297 + kG297) - kF297;
    tmp3_1 = ((((kA297 + kC297) - kE297) - kE297) - kD297);
    tmp3_2 = kB297 - kG297;
    // Op 298: dim1x1 add
    gl64_t s0_298 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    gl64_t s1_298 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s0_298 + s1_298;
    // Op 299: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 300: dim3x3 mul
    gl64_t s1_300_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_300_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_300_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA300 = (tmp3_0 + tmp3_1) * (s1_300_0 + s1_300_1);
    gl64_t kB300 = (tmp3_0 + tmp3_2) * (s1_300_0 + s1_300_2);
    gl64_t kC300 = (tmp3_1 + tmp3_2) * (s1_300_1 + s1_300_2);
    gl64_t kD300 = tmp3_0 * s1_300_0;
    gl64_t kE300 = tmp3_1 * s1_300_1;
    gl64_t kF300 = tmp3_2 * s1_300_2;
    gl64_t kG300 = kD300 - kE300;
    tmp3_0 = (kC300 + kG300) - kF300;
    tmp3_1 = ((((kA300 + kC300) - kE300) - kE300) - kD300);
    tmp3_2 = kB300 - kG300;
    // Op 301: dim3x1 add
    gl64_t s1_301 = *(gl64_t*)&expressions_params[9][9];
    tmp3_9 = tmp3_0 + s1_301; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 302: dim3x3 add
    gl64_t s1_302_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_302_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_302_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_12 = tmp3_9 + s1_302_0; tmp3_13 = tmp3_10 + s1_302_1; tmp3_14 = tmp3_11 + s1_302_2;
    // Op 303: dim3x1 mul
    gl64_t s0_303_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_303_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_303_2 = *(gl64_t*)&expressions_params[13][0+2];
    tmp3_0 = s0_303_0 * tmp1_4; tmp3_1 = s0_303_1 * tmp1_4; tmp3_2 = s0_303_2 * tmp1_4;
    // Op 304: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_4; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 305: dim3x3 mul
    gl64_t s1_305_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_305_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_305_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA305 = (tmp3_0 + tmp3_1) * (s1_305_0 + s1_305_1);
    gl64_t kB305 = (tmp3_0 + tmp3_2) * (s1_305_0 + s1_305_2);
    gl64_t kC305 = (tmp3_1 + tmp3_2) * (s1_305_1 + s1_305_2);
    gl64_t kD305 = tmp3_0 * s1_305_0;
    gl64_t kE305 = tmp3_1 * s1_305_1;
    gl64_t kF305 = tmp3_2 * s1_305_2;
    gl64_t kG305 = kD305 - kE305;
    tmp3_0 = (kC305 + kG305) - kF305;
    tmp3_1 = ((((kA305 + kC305) - kE305) - kE305) - kD305);
    tmp3_2 = kB305 - kG305;
    // Op 306: dim3x1 add
    gl64_t s1_306 = *(gl64_t*)&expressions_params[9][5];
    tmp3_0 = tmp3_0 + s1_306; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    // Op 308: dim1x1 mul
    gl64_t s0_308 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    gl64_t s1_308 = *(gl64_t*)&expressions_params[9][6];
    tmp1_0 = s0_308 * s1_308;
    // Op 309: dim1x1 add
    gl64_t s1_309 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_309;
    // Op 310: dim1x1 add
    gl64_t s0_310 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    tmp1_0 = s0_310 + tmp1_0;
    // Op 311: dim1x1 add
    gl64_t s1_311 = *(gl64_t*)&expressions_params[9][7];
    tmp1_0 = tmp1_0 + s1_311;
    // Op 312: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 313: dim3x3 mul
    gl64_t s1_313_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_313_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_313_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA313 = (tmp3_0 + tmp3_1) * (s1_313_0 + s1_313_1);
    gl64_t kB313 = (tmp3_0 + tmp3_2) * (s1_313_0 + s1_313_2);
    gl64_t kC313 = (tmp3_1 + tmp3_2) * (s1_313_1 + s1_313_2);
    gl64_t kD313 = tmp3_0 * s1_313_0;
    gl64_t kE313 = tmp3_1 * s1_313_1;
    gl64_t kF313 = tmp3_2 * s1_313_2;
    gl64_t kG313 = kD313 - kE313;
    tmp3_0 = (kC313 + kG313) - kF313;
    tmp3_1 = ((((kA313 + kC313) - kE313) - kE313) - kD313);
    tmp3_2 = kB313 - kG313;
    // Op 314: dim1x1 mul
    gl64_t s0_314 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_314 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_314 * s1_314;
    // Op 315: dim1x1 add
    gl64_t s1_315 = *(gl64_t*)&expressions_params[9][10];
    tmp1_0 = tmp1_0 + s1_315;
    // Op 316: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 317: dim3x3 mul
    gl64_t s1_317_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_317_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_317_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA317 = (tmp3_0 + tmp3_1) * (s1_317_0 + s1_317_1);
    gl64_t kB317 = (tmp3_0 + tmp3_2) * (s1_317_0 + s1_317_2);
    gl64_t kC317 = (tmp3_1 + tmp3_2) * (s1_317_1 + s1_317_2);
    gl64_t kD317 = tmp3_0 * s1_317_0;
    gl64_t kE317 = tmp3_1 * s1_317_1;
    gl64_t kF317 = tmp3_2 * s1_317_2;
    gl64_t kG317 = kD317 - kE317;
    tmp3_0 = (kC317 + kG317) - kF317;
    tmp3_1 = ((((kA317 + kC317) - kE317) - kE317) - kD317);
    tmp3_2 = kB317 - kG317;
    // Op 318: dim1x1 add
    gl64_t s0_318 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    gl64_t s1_318 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s0_318 + s1_318;
    // Op 319: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 320: dim3x3 mul
    gl64_t s1_320_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_320_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_320_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA320 = (tmp3_0 + tmp3_1) * (s1_320_0 + s1_320_1);
    gl64_t kB320 = (tmp3_0 + tmp3_2) * (s1_320_0 + s1_320_2);
    gl64_t kC320 = (tmp3_1 + tmp3_2) * (s1_320_1 + s1_320_2);
    gl64_t kD320 = tmp3_0 * s1_320_0;
    gl64_t kE320 = tmp3_1 * s1_320_1;
    gl64_t kF320 = tmp3_2 * s1_320_2;
    gl64_t kG320 = kD320 - kE320;
    tmp3_0 = (kC320 + kG320) - kF320;
    tmp3_1 = ((((kA320 + kC320) - kE320) - kE320) - kD320);
    tmp3_2 = kB320 - kG320;
    // Op 321: dim3x1 add
    gl64_t s1_321 = *(gl64_t*)&expressions_params[9][9];
    tmp3_6 = tmp3_0 + s1_321; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 322: dim3x3 add
    gl64_t s1_322_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_322_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_322_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_322_0; tmp3_1 = tmp3_7 + s1_322_1; tmp3_2 = tmp3_8 + s1_322_2;
    // Op 323: dim3x3 mul
    gl64_t kA323 = (tmp3_12 + tmp3_13) * (tmp3_0 + tmp3_1);
    gl64_t kB323 = (tmp3_12 + tmp3_14) * (tmp3_0 + tmp3_2);
    gl64_t kC323 = (tmp3_13 + tmp3_14) * (tmp3_1 + tmp3_2);
    gl64_t kD323 = tmp3_12 * tmp3_0;
    gl64_t kE323 = tmp3_13 * tmp3_1;
    gl64_t kF323 = tmp3_14 * tmp3_2;
    gl64_t kG323 = kD323 - kE323;
    tmp3_0 = (kC323 + kG323) - kF323;
    tmp3_1 = ((((kA323 + kC323) - kE323) - kE323) - kD323);
    tmp3_2 = kB323 - kG323;
    // Op 324: dim3x3 mul
    gl64_t s0_324_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+0, domainSize, nCols_2))];
    gl64_t s0_324_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+1, domainSize, nCols_2))];
    gl64_t s0_324_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+2, domainSize, nCols_2))];
    gl64_t kA324 = (s0_324_0 + s0_324_1) * (tmp3_0 + tmp3_1);
    gl64_t kB324 = (s0_324_0 + s0_324_2) * (tmp3_0 + tmp3_2);
    gl64_t kC324 = (s0_324_1 + s0_324_2) * (tmp3_1 + tmp3_2);
    gl64_t kD324 = s0_324_0 * tmp3_0;
    gl64_t kE324 = s0_324_1 * tmp3_1;
    gl64_t kF324 = s0_324_2 * tmp3_2;
    gl64_t kG324 = kD324 - kE324;
    tmp3_0 = (kC324 + kG324) - kF324;
    tmp3_1 = ((((kA324 + kC324) - kE324) - kE324) - kD324);
    tmp3_2 = kB324 - kG324;
    // Op 325: dim1x1 sub_swap
    gl64_t s0_325 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_1))];
    gl64_t s1_325 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_325 - s0_325;
    // Op 326: dim3x3 add
    gl64_t s1_326_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_326_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_326_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_326_0; tmp3_7 = tmp3_7 + s1_326_1; tmp3_8 = tmp3_8 + s1_326_2;
    // Op 327: dim3x1 mul
    tmp3_6 = tmp3_6 * tmp1_0; tmp3_7 = tmp3_7 * tmp1_0; tmp3_8 = tmp3_8 * tmp1_0;
    // Op 328: dim1x1 sub_swap
    gl64_t s0_328 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 10, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 10, domainSize, nCols_1))];
    gl64_t s1_328 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_328 - s0_328;
    // Op 329: dim3x3 add
    gl64_t s1_329_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_329_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_329_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_329_0; tmp3_10 = tmp3_10 + s1_329_1; tmp3_11 = tmp3_11 + s1_329_2;
    // Op 330: dim3x1 mul
    tmp3_9 = tmp3_9 * tmp1_0; tmp3_10 = tmp3_10 * tmp1_0; tmp3_11 = tmp3_11 * tmp1_0;
    // Op 331: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 332: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 333: dim3x3 add
    tmp3_0 = tmp3_3 + tmp3_0; tmp3_1 = tmp3_4 + tmp3_1; tmp3_2 = tmp3_5 + tmp3_2;
    // Op 334: dim3x3 mul
    gl64_t s1_334_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_334_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_334_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA334 = (tmp3_0 + tmp3_1) * (s1_334_0 + s1_334_1);
    gl64_t kB334 = (tmp3_0 + tmp3_2) * (s1_334_0 + s1_334_2);
    gl64_t kC334 = (tmp3_1 + tmp3_2) * (s1_334_1 + s1_334_2);
    gl64_t kD334 = tmp3_0 * s1_334_0;
    gl64_t kE334 = tmp3_1 * s1_334_1;
    gl64_t kF334 = tmp3_2 * s1_334_2;
    gl64_t kG334 = kD334 - kE334;
    tmp3_12 = (kC334 + kG334) - kF334;
    tmp3_13 = ((((kA334 + kC334) - kE334) - kE334) - kD334);
    tmp3_14 = kB334 - kG334;
    // Op 335: dim3x1 mul
    gl64_t s0_335_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_335_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_335_2 = *(gl64_t*)&expressions_params[13][0+2];
    tmp3_0 = s0_335_0 * tmp1_4; tmp3_1 = s0_335_1 * tmp1_4; tmp3_2 = s0_335_2 * tmp1_4;
    // Op 336: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_4; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 337: dim3x3 mul
    gl64_t s1_337_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_337_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_337_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA337 = (tmp3_0 + tmp3_1) * (s1_337_0 + s1_337_1);
    gl64_t kB337 = (tmp3_0 + tmp3_2) * (s1_337_0 + s1_337_2);
    gl64_t kC337 = (tmp3_1 + tmp3_2) * (s1_337_1 + s1_337_2);
    gl64_t kD337 = tmp3_0 * s1_337_0;
    gl64_t kE337 = tmp3_1 * s1_337_1;
    gl64_t kF337 = tmp3_2 * s1_337_2;
    gl64_t kG337 = kD337 - kE337;
    tmp3_0 = (kC337 + kG337) - kF337;
    tmp3_1 = ((((kA337 + kC337) - kE337) - kE337) - kD337);
    tmp3_2 = kB337 - kG337;
    // Op 338: dim3x1 add
    gl64_t s1_338 = *(gl64_t*)&expressions_params[9][5];
    tmp3_0 = tmp3_0 + s1_338; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    gl64_t s1_340 = *(gl64_t*)&expressions_params[9][6];
    tmp1_0 = s0_340 * s1_340;
    // Op 341: dim1x1 add
    gl64_t s1_341 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_341;
    // Op 342: dim1x1 add
    gl64_t s0_342 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    tmp1_0 = s0_342 + tmp1_0;
    // Op 343: dim1x1 add
    gl64_t s1_343 = *(gl64_t*)&expressions_params[9][7];
    tmp1_0 = tmp1_0 + s1_343;
    // Op 344: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 345: dim3x3 mul
    gl64_t s1_345_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_345_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_345_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA345 = (tmp3_0 + tmp3_1) * (s1_345_0 + s1_345_1);
    gl64_t kB345 = (tmp3_0 + tmp3_2) * (s1_345_0 + s1_345_2);
    gl64_t kC345 = (tmp3_1 + tmp3_2) * (s1_345_1 + s1_345_2);
    gl64_t kD345 = tmp3_0 * s1_345_0;
    gl64_t kE345 = tmp3_1 * s1_345_1;
    gl64_t kF345 = tmp3_2 * s1_345_2;
    gl64_t kG345 = kD345 - kE345;
    tmp3_0 = (kC345 + kG345) - kF345;
    tmp3_1 = ((((kA345 + kC345) - kE345) - kE345) - kD345);
    tmp3_2 = kB345 - kG345;
    // Op 346: dim1x1 mul
    gl64_t s0_346 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_346 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_346 * s1_346;
    // Op 347: dim1x1 add
    gl64_t s1_347 = *(gl64_t*)&expressions_params[9][13];
    tmp1_0 = tmp1_0 + s1_347;
    // Op 348: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 349: dim3x3 mul
    gl64_t s1_349_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_349_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_349_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA349 = (tmp3_0 + tmp3_1) * (s1_349_0 + s1_349_1);
    gl64_t kB349 = (tmp3_0 + tmp3_2) * (s1_349_0 + s1_349_2);
    gl64_t kC349 = (tmp3_1 + tmp3_2) * (s1_349_1 + s1_349_2);
    gl64_t kD349 = tmp3_0 * s1_349_0;
    gl64_t kE349 = tmp3_1 * s1_349_1;
    gl64_t kF349 = tmp3_2 * s1_349_2;
    gl64_t kG349 = kD349 - kE349;
    tmp3_0 = (kC349 + kG349) - kF349;
    tmp3_1 = ((((kA349 + kC349) - kE349) - kE349) - kD349);
    tmp3_2 = kB349 - kG349;
    // Op 350: dim1x1 add
    gl64_t s0_350 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    gl64_t s1_350 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s0_350 + s1_350;
    // Op 351: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 352: dim3x3 mul
    gl64_t s1_352_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_352_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_352_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA352 = (tmp3_0 + tmp3_1) * (s1_352_0 + s1_352_1);
    gl64_t kB352 = (tmp3_0 + tmp3_2) * (s1_352_0 + s1_352_2);
    gl64_t kC352 = (tmp3_1 + tmp3_2) * (s1_352_1 + s1_352_2);
    gl64_t kD352 = tmp3_0 * s1_352_0;
    gl64_t kE352 = tmp3_1 * s1_352_1;
    gl64_t kF352 = tmp3_2 * s1_352_2;
    gl64_t kG352 = kD352 - kE352;
    tmp3_0 = (kC352 + kG352) - kF352;
    tmp3_1 = ((((kA352 + kC352) - kE352) - kE352) - kD352);
    tmp3_2 = kB352 - kG352;
    // Op 353: dim3x1 add
    gl64_t s1_353 = *(gl64_t*)&expressions_params[9][9];
    tmp3_9 = tmp3_0 + s1_353; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 354: dim3x3 add
    gl64_t s1_354_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_354_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_354_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_3 = tmp3_9 + s1_354_0; tmp3_4 = tmp3_10 + s1_354_1; tmp3_5 = tmp3_11 + s1_354_2;
    // Op 355: dim3x1 mul
    gl64_t s0_355_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_355_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_355_2 = *(gl64_t*)&expressions_params[13][0+2];
    tmp3_0 = s0_355_0 * tmp1_4; tmp3_1 = s0_355_1 * tmp1_4; tmp3_2 = s0_355_2 * tmp1_4;
    // Op 356: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_4; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 357: dim3x3 mul
    gl64_t s1_357_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_357_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_357_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA357 = (tmp3_0 + tmp3_1) * (s1_357_0 + s1_357_1);
    gl64_t kB357 = (tmp3_0 + tmp3_2) * (s1_357_0 + s1_357_2);
    gl64_t kC357 = (tmp3_1 + tmp3_2) * (s1_357_1 + s1_357_2);
    gl64_t kD357 = tmp3_0 * s1_357_0;
    gl64_t kE357 = tmp3_1 * s1_357_1;
    gl64_t kF357 = tmp3_2 * s1_357_2;
    gl64_t kG357 = kD357 - kE357;
    tmp3_0 = (kC357 + kG357) - kF357;
    tmp3_1 = ((((kA357 + kC357) - kE357) - kE357) - kD357);
    tmp3_2 = kB357 - kG357;
    // Op 358: dim3x1 add
    gl64_t s1_358 = *(gl64_t*)&expressions_params[9][5];
    tmp3_0 = tmp3_0 + s1_358; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 359: dim3x3 mul
    gl64_t s1_359_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_359_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_359_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA359 = (tmp3_0 + tmp3_1) * (s1_359_0 + s1_359_1);
    gl64_t kB359 = (tmp3_0 + tmp3_2) * (s1_359_0 + s1_359_2);
    gl64_t kC359 = (tmp3_1 + tmp3_2) * (s1_359_1 + s1_359_2);
    gl64_t kD359 = tmp3_0 * s1_359_0;
    gl64_t kE359 = tmp3_1 * s1_359_1;
    gl64_t kF359 = tmp3_2 * s1_359_2;
    gl64_t kG359 = kD359 - kE359;
    tmp3_0 = (kC359 + kG359) - kF359;
    tmp3_1 = ((((kA359 + kC359) - kE359) - kE359) - kD359);
    tmp3_2 = kB359 - kG359;
    // Op 360: dim1x1 mul
    gl64_t s0_360 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    gl64_t s1_360 = *(gl64_t*)&expressions_params[9][6];
    tmp1_0 = s0_360 * s1_360;
    // Op 361: dim1x1 add
    gl64_t s1_361 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_361;
    // Op 362: dim1x1 add
    gl64_t s0_362 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    tmp1_0 = s0_362 + tmp1_0;
    // Op 363: dim1x1 add
    gl64_t s1_363 = *(gl64_t*)&expressions_params[9][7];
    tmp1_0 = tmp1_0 + s1_363;
    // Op 364: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 365: dim3x3 mul
    gl64_t s1_365_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_365_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_365_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA365 = (tmp3_0 + tmp3_1) * (s1_365_0 + s1_365_1);
    gl64_t kB365 = (tmp3_0 + tmp3_2) * (s1_365_0 + s1_365_2);
    gl64_t kC365 = (tmp3_1 + tmp3_2) * (s1_365_1 + s1_365_2);
    gl64_t kD365 = tmp3_0 * s1_365_0;
    gl64_t kE365 = tmp3_1 * s1_365_1;
    gl64_t kF365 = tmp3_2 * s1_365_2;
    gl64_t kG365 = kD365 - kE365;
    tmp3_0 = (kC365 + kG365) - kF365;
    tmp3_1 = ((((kA365 + kC365) - kE365) - kE365) - kD365);
    tmp3_2 = kB365 - kG365;
    // Op 366: dim1x1 mul
    gl64_t s0_366 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_366 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_366 * s1_366;
    // Op 367: dim1x1 add
    gl64_t s1_367 = *(gl64_t*)&expressions_params[9][12];
    tmp1_0 = tmp1_0 + s1_367;
    // Op 368: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    // Op 370: dim1x1 add
    gl64_t s0_370 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    gl64_t s1_370 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s0_370 + s1_370;
    // Op 371: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 372: dim3x3 mul
    gl64_t s1_372_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_372_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_372_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA372 = (tmp3_0 + tmp3_1) * (s1_372_0 + s1_372_1);
    gl64_t kB372 = (tmp3_0 + tmp3_2) * (s1_372_0 + s1_372_2);
    gl64_t kC372 = (tmp3_1 + tmp3_2) * (s1_372_1 + s1_372_2);
    gl64_t kD372 = tmp3_0 * s1_372_0;
    gl64_t kE372 = tmp3_1 * s1_372_1;
    gl64_t kF372 = tmp3_2 * s1_372_2;
    gl64_t kG372 = kD372 - kE372;
    tmp3_0 = (kC372 + kG372) - kF372;
    tmp3_1 = ((((kA372 + kC372) - kE372) - kE372) - kD372);
    tmp3_2 = kB372 - kG372;
    // Op 373: dim3x1 add
    gl64_t s1_373 = *(gl64_t*)&expressions_params[9][9];
    tmp3_6 = tmp3_0 + s1_373; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 374: dim3x3 add
    gl64_t s1_374_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_374_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_374_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_374_0; tmp3_1 = tmp3_7 + s1_374_1; tmp3_2 = tmp3_8 + s1_374_2;
    // Op 375: dim3x3 mul
    gl64_t kA375 = (tmp3_3 + tmp3_4) * (tmp3_0 + tmp3_1);
    gl64_t kB375 = (tmp3_3 + tmp3_5) * (tmp3_0 + tmp3_2);
    gl64_t kC375 = (tmp3_4 + tmp3_5) * (tmp3_1 + tmp3_2);
    gl64_t kD375 = tmp3_3 * tmp3_0;
    gl64_t kE375 = tmp3_4 * tmp3_1;
    gl64_t kF375 = tmp3_5 * tmp3_2;
    gl64_t kG375 = kD375 - kE375;
    tmp3_0 = (kC375 + kG375) - kF375;
    tmp3_1 = ((((kA375 + kC375) - kE375) - kE375) - kD375);
    tmp3_2 = kB375 - kG375;
    // Op 376: dim3x3 mul
    uint64_t s0_376_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_2));
    gl64_t s0_376_0 = *(gl64_t*)&dParams->aux_trace[s0_376_pos];
    gl64_t s0_376_1 = *(gl64_t*)&dParams->aux_trace[s0_376_pos + TILE_HEIGHT];
    gl64_t s0_376_2 = *(gl64_t*)&dParams->aux_trace[s0_376_pos + 2*TILE_HEIGHT];
    gl64_t kA376 = (s0_376_0 + s0_376_1) * (tmp3_0 + tmp3_1);
    gl64_t kB376 = (s0_376_0 + s0_376_2) * (tmp3_0 + tmp3_2);
    gl64_t kC376 = (s0_376_1 + s0_376_2) * (tmp3_1 + tmp3_2);
    gl64_t kD376 = s0_376_0 * tmp3_0;
    gl64_t kE376 = s0_376_1 * tmp3_1;
    gl64_t kF376 = s0_376_2 * tmp3_2;
    gl64_t kG376 = kD376 - kE376;
    tmp3_0 = (kC376 + kG376) - kF376;
    tmp3_1 = ((((kA376 + kC376) - kE376) - kE376) - kD376);
    tmp3_2 = kB376 - kG376;
    // Op 377: dim1x1 sub_swap
    gl64_t s0_377 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 11, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 11, domainSize, nCols_1))];
    gl64_t s1_377 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_377 - s0_377;
    // Op 378: dim3x3 add
    gl64_t s1_378_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_378_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_378_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_378_0; tmp3_7 = tmp3_7 + s1_378_1; tmp3_8 = tmp3_8 + s1_378_2;
    // Op 379: dim3x1 mul
    tmp3_6 = tmp3_6 * tmp1_0; tmp3_7 = tmp3_7 * tmp1_0; tmp3_8 = tmp3_8 * tmp1_0;
    // Op 380: dim1x1 sub_swap
    gl64_t s0_380 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_1))];
    gl64_t s1_380 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_380 - s0_380;
    // Op 381: dim3x3 add
    gl64_t s1_381_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_381_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_381_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_381_0; tmp3_10 = tmp3_10 + s1_381_1; tmp3_11 = tmp3_11 + s1_381_2;
    // Op 382: dim3x1 mul
    tmp3_9 = tmp3_9 * tmp1_0; tmp3_10 = tmp3_10 * tmp1_0; tmp3_11 = tmp3_11 * tmp1_0;
    // Op 383: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 384: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 385: dim3x3 add
    tmp3_0 = tmp3_12 + tmp3_0; tmp3_1 = tmp3_13 + tmp3_1; tmp3_2 = tmp3_14 + tmp3_2;
    // Op 386: dim3x3 mul
    gl64_t s1_386_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_386_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_386_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA386 = (tmp3_0 + tmp3_1) * (s1_386_0 + s1_386_1);
    gl64_t kB386 = (tmp3_0 + tmp3_2) * (s1_386_0 + s1_386_2);
    gl64_t kC386 = (tmp3_1 + tmp3_2) * (s1_386_1 + s1_386_2);
    gl64_t kD386 = tmp3_0 * s1_386_0;
    gl64_t kE386 = tmp3_1 * s1_386_1;
    gl64_t kF386 = tmp3_2 * s1_386_2;
    gl64_t kG386 = kD386 - kE386;
    tmp3_3 = (kC386 + kG386) - kF386;
    tmp3_4 = ((((kA386 + kC386) - kE386) - kE386) - kD386);
    tmp3_5 = kB386 - kG386;
    // Op 387: dim3x1 mul
    gl64_t s0_387_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_387_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_387_2 = *(gl64_t*)&expressions_params[13][0+2];
    tmp3_0 = s0_387_0 * tmp1_4; tmp3_1 = s0_387_1 * tmp1_4; tmp3_2 = s0_387_2 * tmp1_4;
    // Op 388: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_4; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 389: dim3x3 mul
    gl64_t s1_389_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_389_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_389_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA389 = (tmp3_0 + tmp3_1) * (s1_389_0 + s1_389_1);
    gl64_t kB389 = (tmp3_0 + tmp3_2) * (s1_389_0 + s1_389_2);
    gl64_t kC389 = (tmp3_1 + tmp3_2) * (s1_389_1 + s1_389_2);
    gl64_t kD389 = tmp3_0 * s1_389_0;
    gl64_t kE389 = tmp3_1 * s1_389_1;
    gl64_t kF389 = tmp3_2 * s1_389_2;
    gl64_t kG389 = kD389 - kE389;
    tmp3_0 = (kC389 + kG389) - kF389;
    tmp3_1 = ((((kA389 + kC389) - kE389) - kE389) - kD389);
    tmp3_2 = kB389 - kG389;
    // Op 390: dim3x1 add
    gl64_t s1_390 = *(gl64_t*)&expressions_params[9][5];
    tmp3_0 = tmp3_0 + s1_390; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    gl64_t s0_392 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    gl64_t s1_392 = *(gl64_t*)&expressions_params[9][6];
    tmp1_0 = s0_392 * s1_392;
    // Op 393: dim1x1 add
    gl64_t s1_393 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = tmp1_0 + s1_393;
    // Op 394: dim1x1 add
    gl64_t s0_394 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    tmp1_0 = s0_394 + tmp1_0;
    // Op 395: dim1x1 add
    gl64_t s1_395 = *(gl64_t*)&expressions_params[9][7];
    tmp1_0 = tmp1_0 + s1_395;
    // Op 396: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 397: dim3x3 mul
    gl64_t s1_397_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_397_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_397_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA397 = (tmp3_0 + tmp3_1) * (s1_397_0 + s1_397_1);
    gl64_t kB397 = (tmp3_0 + tmp3_2) * (s1_397_0 + s1_397_2);
    gl64_t kC397 = (tmp3_1 + tmp3_2) * (s1_397_1 + s1_397_2);
    gl64_t kD397 = tmp3_0 * s1_397_0;
    gl64_t kE397 = tmp3_1 * s1_397_1;
    gl64_t kF397 = tmp3_2 * s1_397_2;
    gl64_t kG397 = kD397 - kE397;
    tmp3_0 = (kC397 + kG397) - kF397;
    tmp3_1 = ((((kA397 + kC397) - kE397) - kE397) - kD397);
    tmp3_2 = kB397 - kG397;
    // Op 398: dim1x1 mul
    gl64_t s0_398 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_398 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_398 * s1_398;
    // Op 399: dim1x1 add
    gl64_t s1_399 = *(gl64_t*)&expressions_params[9][16];
    tmp1_0 = tmp1_0 + s1_399;
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
    // Op 402: dim1x1 add
    gl64_t s0_402 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    gl64_t s1_402 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s0_402 + s1_402;
    // Op 403: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 404: dim3x3 mul
    gl64_t s1_404_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_404_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_404_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA404 = (tmp3_0 + tmp3_1) * (s1_404_0 + s1_404_1);
    gl64_t kB404 = (tmp3_0 + tmp3_2) * (s1_404_0 + s1_404_2);
    gl64_t kC404 = (tmp3_1 + tmp3_2) * (s1_404_1 + s1_404_2);
    gl64_t kD404 = tmp3_0 * s1_404_0;
    gl64_t kE404 = tmp3_1 * s1_404_1;
    gl64_t kF404 = tmp3_2 * s1_404_2;
    gl64_t kG404 = kD404 - kE404;
    tmp3_0 = (kC404 + kG404) - kF404;
    tmp3_1 = ((((kA404 + kC404) - kE404) - kE404) - kD404);
    tmp3_2 = kB404 - kG404;
    // Op 405: dim3x1 add
    gl64_t s1_405 = *(gl64_t*)&expressions_params[9][9];
    tmp3_9 = tmp3_0 + s1_405; tmp3_10 = tmp3_1; tmp3_11 = tmp3_2;
    // Op 406: dim3x3 add
    gl64_t s1_406_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_406_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_406_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_12 = tmp3_9 + s1_406_0; tmp3_13 = tmp3_10 + s1_406_1; tmp3_14 = tmp3_11 + s1_406_2;
    // Op 407: dim3x1 mul
    gl64_t s0_407_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_407_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_407_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_407 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 3, domainSize, nCols_1))];
    tmp3_0 = s0_407_0 * s1_407; tmp3_1 = s0_407_1 * s1_407; tmp3_2 = s0_407_2 * s1_407;
    // Op 408: dim3x1 add
    gl64_t s1_408 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    tmp3_0 = tmp3_0 + s1_408; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 409: dim3x3 mul
    gl64_t s1_409_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_409_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_409_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA409 = (tmp3_0 + tmp3_1) * (s1_409_0 + s1_409_1);
    gl64_t kB409 = (tmp3_0 + tmp3_2) * (s1_409_0 + s1_409_2);
    gl64_t kC409 = (tmp3_1 + tmp3_2) * (s1_409_1 + s1_409_2);
    gl64_t kD409 = tmp3_0 * s1_409_0;
    gl64_t kE409 = tmp3_1 * s1_409_1;
    gl64_t kF409 = tmp3_2 * s1_409_2;
    gl64_t kG409 = kD409 - kE409;
    tmp3_0 = (kC409 + kG409) - kF409;
    tmp3_1 = ((((kA409 + kC409) - kE409) - kE409) - kD409);
    tmp3_2 = kB409 - kG409;
    // Op 410: dim3x3 mul
    gl64_t s1_410_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_410_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_410_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA410 = (tmp3_0 + tmp3_1) * (s1_410_0 + s1_410_1);
    gl64_t kB410 = (tmp3_0 + tmp3_2) * (s1_410_0 + s1_410_2);
    gl64_t kC410 = (tmp3_1 + tmp3_2) * (s1_410_1 + s1_410_2);
    gl64_t kD410 = tmp3_0 * s1_410_0;
    gl64_t kE410 = tmp3_1 * s1_410_1;
    gl64_t kF410 = tmp3_2 * s1_410_2;
    gl64_t kG410 = kD410 - kE410;
    tmp3_0 = (kC410 + kG410) - kF410;
    tmp3_1 = ((((kA410 + kC410) - kE410) - kE410) - kD410);
    tmp3_2 = kB410 - kG410;
    // Op 411: dim3x3 mul
    gl64_t s1_411_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_411_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_411_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA411 = (tmp3_0 + tmp3_1) * (s1_411_0 + s1_411_1);
    gl64_t kB411 = (tmp3_0 + tmp3_2) * (s1_411_0 + s1_411_2);
    gl64_t kC411 = (tmp3_1 + tmp3_2) * (s1_411_1 + s1_411_2);
    gl64_t kD411 = tmp3_0 * s1_411_0;
    gl64_t kE411 = tmp3_1 * s1_411_1;
    gl64_t kF411 = tmp3_2 * s1_411_2;
    gl64_t kG411 = kD411 - kE411;
    tmp3_0 = (kC411 + kG411) - kF411;
    tmp3_1 = ((((kA411 + kC411) - kE411) - kE411) - kD411);
    tmp3_2 = kB411 - kG411;
    // Op 412: dim1x1 mul
    gl64_t s0_412 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_412 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_412 * s1_412;
    // Op 413: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 414: dim3x3 mul
    gl64_t s1_414_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_414_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_414_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA414 = (tmp3_0 + tmp3_1) * (s1_414_0 + s1_414_1);
    gl64_t kB414 = (tmp3_0 + tmp3_2) * (s1_414_0 + s1_414_2);
    gl64_t kC414 = (tmp3_1 + tmp3_2) * (s1_414_1 + s1_414_2);
    gl64_t kD414 = tmp3_0 * s1_414_0;
    gl64_t kE414 = tmp3_1 * s1_414_1;
    gl64_t kF414 = tmp3_2 * s1_414_2;
    gl64_t kG414 = kD414 - kE414;
    tmp3_0 = (kC414 + kG414) - kF414;
    tmp3_1 = ((((kA414 + kC414) - kE414) - kE414) - kD414);
    tmp3_2 = kB414 - kG414;
    // Op 415: dim3x3 mul
    gl64_t s1_415_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_415_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_415_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA415 = (tmp3_0 + tmp3_1) * (s1_415_0 + s1_415_1);
    gl64_t kB415 = (tmp3_0 + tmp3_2) * (s1_415_0 + s1_415_2);
    gl64_t kC415 = (tmp3_1 + tmp3_2) * (s1_415_1 + s1_415_2);
    gl64_t kD415 = tmp3_0 * s1_415_0;
    gl64_t kE415 = tmp3_1 * s1_415_1;
    gl64_t kF415 = tmp3_2 * s1_415_2;
    gl64_t kG415 = kD415 - kE415;
    tmp3_0 = (kC415 + kG415) - kF415;
    tmp3_1 = ((((kA415 + kC415) - kE415) - kE415) - kD415);
    tmp3_2 = kB415 - kG415;
    // Op 416: dim1x1 mul
    gl64_t s0_416 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 6, domainSize, nCols_1))];
    gl64_t s1_416 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_416 * s1_416;
    // Op 417: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 418: dim3x3 mul
    gl64_t s1_418_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_418_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_418_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA418 = (tmp3_0 + tmp3_1) * (s1_418_0 + s1_418_1);
    gl64_t kB418 = (tmp3_0 + tmp3_2) * (s1_418_0 + s1_418_2);
    gl64_t kC418 = (tmp3_1 + tmp3_2) * (s1_418_1 + s1_418_2);
    gl64_t kD418 = tmp3_0 * s1_418_0;
    gl64_t kE418 = tmp3_1 * s1_418_1;
    gl64_t kF418 = tmp3_2 * s1_418_2;
    gl64_t kG418 = kD418 - kE418;
    tmp3_0 = (kC418 + kG418) - kF418;
    tmp3_1 = ((((kA418 + kC418) - kE418) - kE418) - kD418);
    tmp3_2 = kB418 - kG418;
    // Op 419: dim3x3 mul
    gl64_t s1_419_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_419_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_419_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA419 = (tmp3_0 + tmp3_1) * (s1_419_0 + s1_419_1);
    gl64_t kB419 = (tmp3_0 + tmp3_2) * (s1_419_0 + s1_419_2);
    gl64_t kC419 = (tmp3_1 + tmp3_2) * (s1_419_1 + s1_419_2);
    gl64_t kD419 = tmp3_0 * s1_419_0;
    gl64_t kE419 = tmp3_1 * s1_419_1;
    gl64_t kF419 = tmp3_2 * s1_419_2;
    gl64_t kG419 = kD419 - kE419;
    tmp3_0 = (kC419 + kG419) - kF419;
    tmp3_1 = ((((kA419 + kC419) - kE419) - kE419) - kD419);
    tmp3_2 = kB419 - kG419;
    // Op 420: dim1x1 mul
    gl64_t s0_420 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_420 = *(gl64_t*)&expressions_params[9][5];
    tmp1_0 = s0_420 * s1_420;
    // Op 421: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 422: dim3x3 mul
    gl64_t s1_422_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_422_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_422_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA422 = (tmp3_0 + tmp3_1) * (s1_422_0 + s1_422_1);
    gl64_t kB422 = (tmp3_0 + tmp3_2) * (s1_422_0 + s1_422_2);
    gl64_t kC422 = (tmp3_1 + tmp3_2) * (s1_422_1 + s1_422_2);
    gl64_t kD422 = tmp3_0 * s1_422_0;
    gl64_t kE422 = tmp3_1 * s1_422_1;
    gl64_t kF422 = tmp3_2 * s1_422_2;
    gl64_t kG422 = kD422 - kE422;
    tmp3_0 = (kC422 + kG422) - kF422;
    tmp3_1 = ((((kA422 + kC422) - kE422) - kE422) - kD422);
    tmp3_2 = kB422 - kG422;
    // Op 423: dim1x1 mul
    gl64_t s0_423 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    gl64_t s1_423 = *(gl64_t*)&expressions_params[9][14];
    tmp1_0 = s0_423 * s1_423;
    // Op 424: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_0; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 425: dim3x3 mul
    gl64_t s1_425_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_425_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_425_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA425 = (tmp3_0 + tmp3_1) * (s1_425_0 + s1_425_1);
    gl64_t kB425 = (tmp3_0 + tmp3_2) * (s1_425_0 + s1_425_2);
    gl64_t kC425 = (tmp3_1 + tmp3_2) * (s1_425_1 + s1_425_2);
    gl64_t kD425 = tmp3_0 * s1_425_0;
    gl64_t kE425 = tmp3_1 * s1_425_1;
    gl64_t kF425 = tmp3_2 * s1_425_2;
    gl64_t kG425 = kD425 - kE425;
    tmp3_0 = (kC425 + kG425) - kF425;
    tmp3_1 = ((((kA425 + kC425) - kE425) - kE425) - kD425);
    tmp3_2 = kB425 - kG425;
    // Op 426: dim3x1 add
    gl64_t s1_426 = *(gl64_t*)&expressions_params[9][15];
    tmp3_6 = tmp3_0 + s1_426; tmp3_7 = tmp3_1; tmp3_8 = tmp3_2;
    // Op 427: dim3x3 add
    gl64_t s1_427_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_427_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_427_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_6 + s1_427_0; tmp3_1 = tmp3_7 + s1_427_1; tmp3_2 = tmp3_8 + s1_427_2;
    // Op 428: dim3x3 mul
    gl64_t kA428 = (tmp3_12 + tmp3_13) * (tmp3_0 + tmp3_1);
    gl64_t kB428 = (tmp3_12 + tmp3_14) * (tmp3_0 + tmp3_2);
    gl64_t kC428 = (tmp3_13 + tmp3_14) * (tmp3_1 + tmp3_2);
    gl64_t kD428 = tmp3_12 * tmp3_0;
    gl64_t kE428 = tmp3_13 * tmp3_1;
    gl64_t kF428 = tmp3_14 * tmp3_2;
    gl64_t kG428 = kD428 - kE428;
    tmp3_0 = (kC428 + kG428) - kF428;
    tmp3_1 = ((((kA428 + kC428) - kE428) - kE428) - kD428);
    tmp3_2 = kB428 - kG428;
    // Op 429: dim3x3 mul
    uint64_t s0_429_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_2));
    gl64_t s0_429_0 = *(gl64_t*)&dParams->aux_trace[s0_429_pos];
    gl64_t s0_429_1 = *(gl64_t*)&dParams->aux_trace[s0_429_pos + TILE_HEIGHT];
    gl64_t s0_429_2 = *(gl64_t*)&dParams->aux_trace[s0_429_pos + 2*TILE_HEIGHT];
    gl64_t kA429 = (s0_429_0 + s0_429_1) * (tmp3_0 + tmp3_1);
    gl64_t kB429 = (s0_429_0 + s0_429_2) * (tmp3_0 + tmp3_2);
    gl64_t kC429 = (s0_429_1 + s0_429_2) * (tmp3_1 + tmp3_2);
    gl64_t kD429 = s0_429_0 * tmp3_0;
    gl64_t kE429 = s0_429_1 * tmp3_1;
    gl64_t kF429 = s0_429_2 * tmp3_2;
    gl64_t kG429 = kD429 - kE429;
    tmp3_0 = (kC429 + kG429) - kF429;
    tmp3_1 = ((((kA429 + kC429) - kE429) - kE429) - kD429);
    tmp3_2 = kB429 - kG429;
    // Op 430: dim1x1 sub_swap
    gl64_t s0_430 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 13, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 13, domainSize, nCols_1))];
    gl64_t s1_430 = *(gl64_t*)&expressions_params[9][1];
    tmp1_0 = s1_430 - s0_430;
    // Op 431: dim3x3 add
    gl64_t s1_431_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_431_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_431_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_6 = tmp3_6 + s1_431_0; tmp3_7 = tmp3_7 + s1_431_1; tmp3_8 = tmp3_8 + s1_431_2;
    // Op 432: dim3x1 mul
    tmp3_6 = tmp3_6 * tmp1_0; tmp3_7 = tmp3_7 * tmp1_0; tmp3_8 = tmp3_8 * tmp1_0;
    // Op 433: dim3x3 add
    gl64_t s1_433_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_433_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_433_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_9 = tmp3_9 + s1_433_0; tmp3_10 = tmp3_10 + s1_433_1; tmp3_11 = tmp3_11 + s1_433_2;
    // Op 434: dim3x1 mul
    gl64_t s1_434 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 1, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 1, domainSize, nCols_1))];
    tmp3_9 = tmp3_9 * s1_434; tmp3_10 = tmp3_10 * s1_434; tmp3_11 = tmp3_11 * s1_434;
    // Op 435: dim3x3 add
    tmp3_6 = tmp3_6 + tmp3_9; tmp3_7 = tmp3_7 + tmp3_10; tmp3_8 = tmp3_8 + tmp3_11;
    // Op 436: dim3x3 sub
    tmp3_0 = tmp3_0 - tmp3_6; tmp3_1 = tmp3_1 - tmp3_7; tmp3_2 = tmp3_2 - tmp3_8;
    // Op 437: dim3x3 add
    tmp3_0 = tmp3_3 + tmp3_0; tmp3_1 = tmp3_4 + tmp3_1; tmp3_2 = tmp3_5 + tmp3_2;
    // Op 438: dim3x3 mul
    gl64_t s1_438_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_438_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_438_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA438 = (tmp3_0 + tmp3_1) * (s1_438_0 + s1_438_1);
    gl64_t kB438 = (tmp3_0 + tmp3_2) * (s1_438_0 + s1_438_2);
    gl64_t kC438 = (tmp3_1 + tmp3_2) * (s1_438_1 + s1_438_2);
    gl64_t kD438 = tmp3_0 * s1_438_0;
    gl64_t kE438 = tmp3_1 * s1_438_1;
    gl64_t kF438 = tmp3_2 * s1_438_2;
    gl64_t kG438 = kD438 - kE438;
    tmp3_6 = (kC438 + kG438) - kF438;
    tmp3_7 = ((((kA438 + kC438) - kE438) - kE438) - kD438);
    tmp3_8 = kB438 - kG438;
    // Op 439: dim1x1 sub_swap
    gl64_t s0_439 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_0)];
    gl64_t s1_439 = *(gl64_t*)&expressions_params[9][0];
    tmp1_0 = s1_439 - s0_439;
    // Op 440: dim3x1 mul
    uint64_t s0_440_pos = dExpsArgs->mapOffsetsExps[2] + (false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_2) : getBufferOffset(logicalRow_0, 0, domainSize, nCols_2));
    gl64_t s0_440_0 = *(gl64_t*)&dParams->aux_trace[s0_440_pos];
    gl64_t s0_440_1 = *(gl64_t*)&dParams->aux_trace[s0_440_pos + TILE_HEIGHT];
    gl64_t s0_440_2 = *(gl64_t*)&dParams->aux_trace[s0_440_pos + 2*TILE_HEIGHT];
    tmp3_0 = s0_440_0 * tmp1_0; tmp3_1 = s0_440_1 * tmp1_0; tmp3_2 = s0_440_2 * tmp1_0;
    // Op 441: dim3x3 sub
    uint64_t s0_441_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_2));
    gl64_t s0_441_0 = *(gl64_t*)&dParams->aux_trace[s0_441_pos];
    gl64_t s0_441_1 = *(gl64_t*)&dParams->aux_trace[s0_441_pos + TILE_HEIGHT];
    gl64_t s0_441_2 = *(gl64_t*)&dParams->aux_trace[s0_441_pos + 2*TILE_HEIGHT];
    tmp3_3 = s0_441_0 - tmp3_0; tmp3_4 = s0_441_1 - tmp3_1; tmp3_5 = s0_441_2 - tmp3_2;
    // Op 442: dim3x3 add
    gl64_t s0_442_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+0, domainSize, nCols_2))];
    gl64_t s0_442_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+1, domainSize, nCols_2))];
    gl64_t s0_442_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 3+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 3+2, domainSize, nCols_2))];
    gl64_t s1_442_0 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+0, domainSize, nCols_2))];
    gl64_t s1_442_1 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+1, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+1, domainSize, nCols_2))];
    gl64_t s1_442_2 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 6+2, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 6+2, domainSize, nCols_2))];
    tmp3_0 = s0_442_0 + s1_442_0; tmp3_1 = s0_442_1 + s1_442_1; tmp3_2 = s0_442_2 + s1_442_2;
    // Op 443: dim3x3 add
    uint64_t s0_443_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 9, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 9, domainSize, nCols_2));
    gl64_t s0_443_0 = *(gl64_t*)&dParams->aux_trace[s0_443_pos];
    gl64_t s0_443_1 = *(gl64_t*)&dParams->aux_trace[s0_443_pos + TILE_HEIGHT];
    gl64_t s0_443_2 = *(gl64_t*)&dParams->aux_trace[s0_443_pos + 2*TILE_HEIGHT];
    tmp3_0 = s0_443_0 + tmp3_0; tmp3_1 = s0_443_1 + tmp3_1; tmp3_2 = s0_443_2 + tmp3_2;
    // Op 444: dim3x3 add
    uint64_t s0_444_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 12, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 12, domainSize, nCols_2));
    gl64_t s0_444_0 = *(gl64_t*)&dParams->aux_trace[s0_444_pos];
    gl64_t s0_444_1 = *(gl64_t*)&dParams->aux_trace[s0_444_pos + TILE_HEIGHT];
    gl64_t s0_444_2 = *(gl64_t*)&dParams->aux_trace[s0_444_pos + 2*TILE_HEIGHT];
    tmp3_0 = s0_444_0 + tmp3_0; tmp3_1 = s0_444_1 + tmp3_1; tmp3_2 = s0_444_2 + tmp3_2;
    // Op 445: dim3x3 sub
    tmp3_3 = tmp3_3 - tmp3_0; tmp3_4 = tmp3_4 - tmp3_1; tmp3_5 = tmp3_5 - tmp3_2;
    // Op 446: dim3x1 mul
    gl64_t s0_446_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_446_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_446_2 = *(gl64_t*)&expressions_params[13][0+2];
    tmp3_0 = s0_446_0 * tmp1_4; tmp3_1 = s0_446_1 * tmp1_4; tmp3_2 = s0_446_2 * tmp1_4;
    // Op 447: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_4; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 448: dim3x3 mul
    gl64_t s1_448_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_448_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_448_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA448 = (tmp3_0 + tmp3_1) * (s1_448_0 + s1_448_1);
    gl64_t kB448 = (tmp3_0 + tmp3_2) * (s1_448_0 + s1_448_2);
    gl64_t kC448 = (tmp3_1 + tmp3_2) * (s1_448_1 + s1_448_2);
    gl64_t kD448 = tmp3_0 * s1_448_0;
    gl64_t kE448 = tmp3_1 * s1_448_1;
    gl64_t kF448 = tmp3_2 * s1_448_2;
    gl64_t kG448 = kD448 - kE448;
    tmp3_0 = (kC448 + kG448) - kF448;
    tmp3_1 = ((((kA448 + kC448) - kE448) - kE448) - kD448);
    tmp3_2 = kB448 - kG448;
    // Op 449: dim3x1 add
    gl64_t s1_449 = *(gl64_t*)&expressions_params[9][5];
    tmp3_0 = tmp3_0 + s1_449; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 450: dim3x3 mul
    gl64_t s1_450_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_450_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_450_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA450 = (tmp3_0 + tmp3_1) * (s1_450_0 + s1_450_1);
    gl64_t kB450 = (tmp3_0 + tmp3_2) * (s1_450_0 + s1_450_2);
    gl64_t kC450 = (tmp3_1 + tmp3_2) * (s1_450_1 + s1_450_2);
    gl64_t kD450 = tmp3_0 * s1_450_0;
    gl64_t kE450 = tmp3_1 * s1_450_1;
    gl64_t kF450 = tmp3_2 * s1_450_2;
    gl64_t kG450 = kD450 - kE450;
    tmp3_0 = (kC450 + kG450) - kF450;
    tmp3_1 = ((((kA450 + kC450) - kE450) - kE450) - kD450);
    tmp3_2 = kB450 - kG450;
    // Op 451: dim1x1 mul
    gl64_t s0_451 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 4, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 4, domainSize, nCols_1))];
    gl64_t s1_451 = *(gl64_t*)&expressions_params[9][6];
    tmp1_4 = s0_451 * s1_451;
    // Op 452: dim1x1 add
    gl64_t s1_452 = *(gl64_t*)&expressions_params[9][0];
    tmp1_4 = tmp1_4 + s1_452;
    // Op 453: dim1x1 add
    gl64_t s0_453 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    tmp1_4 = s0_453 + tmp1_4;
    // Op 454: dim1x1 add
    gl64_t s1_454 = *(gl64_t*)&expressions_params[9][7];
    tmp1_4 = tmp1_4 + s1_454;
    // Op 455: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_4; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 456: dim3x3 mul
    gl64_t s1_456_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_456_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_456_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA456 = (tmp3_0 + tmp3_1) * (s1_456_0 + s1_456_1);
    gl64_t kB456 = (tmp3_0 + tmp3_2) * (s1_456_0 + s1_456_2);
    gl64_t kC456 = (tmp3_1 + tmp3_2) * (s1_456_1 + s1_456_2);
    gl64_t kD456 = tmp3_0 * s1_456_0;
    gl64_t kE456 = tmp3_1 * s1_456_1;
    gl64_t kF456 = tmp3_2 * s1_456_2;
    gl64_t kG456 = kD456 - kE456;
    tmp3_0 = (kC456 + kG456) - kF456;
    tmp3_1 = ((((kA456 + kC456) - kE456) - kE456) - kD456);
    tmp3_2 = kB456 - kG456;
    // Op 457: dim1x1 mul
    gl64_t s0_457 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 5, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 5, domainSize, nCols_1))];
    gl64_t s1_457 = *(gl64_t*)&expressions_params[9][5];
    tmp1_4 = s0_457 * s1_457;
    // Op 458: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_4; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
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
    // Op 460: dim1x1 add
    gl64_t s0_460 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    gl64_t s1_460 = *(gl64_t*)&expressions_params[9][0];
    tmp1_4 = s0_460 + s1_460;
    // Op 461: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_4; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 462: dim3x3 mul
    gl64_t s1_462_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_462_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_462_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA462 = (tmp3_0 + tmp3_1) * (s1_462_0 + s1_462_1);
    gl64_t kB462 = (tmp3_0 + tmp3_2) * (s1_462_0 + s1_462_2);
    gl64_t kC462 = (tmp3_1 + tmp3_2) * (s1_462_1 + s1_462_2);
    gl64_t kD462 = tmp3_0 * s1_462_0;
    gl64_t kE462 = tmp3_1 * s1_462_1;
    gl64_t kF462 = tmp3_2 * s1_462_2;
    gl64_t kG462 = kD462 - kE462;
    tmp3_0 = (kC462 + kG462) - kF462;
    tmp3_1 = ((((kA462 + kC462) - kE462) - kE462) - kD462);
    tmp3_2 = kB462 - kG462;
    // Op 463: dim3x1 add
    gl64_t s1_463 = *(gl64_t*)&expressions_params[9][9];
    tmp3_0 = tmp3_0 + s1_463; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 464: dim3x3 add
    gl64_t s1_464_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_464_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_464_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_0 + s1_464_0; tmp3_1 = tmp3_1 + s1_464_1; tmp3_2 = tmp3_2 + s1_464_2;
    // Op 465: dim3x3 mul
    gl64_t kA465 = (tmp3_3 + tmp3_4) * (tmp3_0 + tmp3_1);
    gl64_t kB465 = (tmp3_3 + tmp3_5) * (tmp3_0 + tmp3_2);
    gl64_t kC465 = (tmp3_4 + tmp3_5) * (tmp3_1 + tmp3_2);
    gl64_t kD465 = tmp3_3 * tmp3_0;
    gl64_t kE465 = tmp3_4 * tmp3_1;
    gl64_t kF465 = tmp3_5 * tmp3_2;
    gl64_t kG465 = kD465 - kE465;
    tmp3_0 = (kC465 + kG465) - kF465;
    tmp3_1 = ((((kA465 + kC465) - kE465) - kE465) - kD465);
    tmp3_2 = kB465 - kG465;
    // Op 466: dim1x1 sub_swap
    gl64_t s0_466 = *(gl64_t*)&dParams->aux_trace[dExpsArgs->mapOffsetsExps[1] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 2, domainSize, nCols_1) : getBufferOffset(logicalRow_1, 2, domainSize, nCols_1))];
    gl64_t s1_466 = *(gl64_t*)&expressions_params[9][1];
    tmp1_4 = s1_466 - s0_466;
    // Op 467: dim3x1 sub
    tmp3_0 = tmp3_0 - tmp1_4; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 468: dim3x3 add
    tmp3_0 = tmp3_6 + tmp3_0; tmp3_1 = tmp3_7 + tmp3_1; tmp3_2 = tmp3_8 + tmp3_2;
    // Op 469: dim3x3 mul
    gl64_t s1_469_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_469_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_469_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA469 = (tmp3_0 + tmp3_1) * (s1_469_0 + s1_469_1);
    gl64_t kB469 = (tmp3_0 + tmp3_2) * (s1_469_0 + s1_469_2);
    gl64_t kC469 = (tmp3_1 + tmp3_2) * (s1_469_1 + s1_469_2);
    gl64_t kD469 = tmp3_0 * s1_469_0;
    gl64_t kE469 = tmp3_1 * s1_469_1;
    gl64_t kF469 = tmp3_2 * s1_469_2;
    gl64_t kG469 = kD469 - kE469;
    tmp3_6 = (kC469 + kG469) - kF469;
    tmp3_7 = ((((kA469 + kC469) - kE469) - kE469) - kD469);
    tmp3_8 = kB469 - kG469;
    // Op 470: dim3x1 mul
    gl64_t s0_470_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_470_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_470_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_470 = *(gl64_t*)&expressions_params[10][5];
    tmp3_0 = s0_470_0 * s1_470; tmp3_1 = s0_470_1 * s1_470; tmp3_2 = s0_470_2 * s1_470;
    // Op 471: dim3x1 add
    gl64_t s1_471 = *(gl64_t*)&expressions_params[10][12];
    tmp3_0 = tmp3_0 + s1_471; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 472: dim3x3 mul
    gl64_t s1_472_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_472_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_472_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA472 = (tmp3_0 + tmp3_1) * (s1_472_0 + s1_472_1);
    gl64_t kB472 = (tmp3_0 + tmp3_2) * (s1_472_0 + s1_472_2);
    gl64_t kC472 = (tmp3_1 + tmp3_2) * (s1_472_1 + s1_472_2);
    gl64_t kD472 = tmp3_0 * s1_472_0;
    gl64_t kE472 = tmp3_1 * s1_472_1;
    gl64_t kF472 = tmp3_2 * s1_472_2;
    gl64_t kG472 = kD472 - kE472;
    tmp3_0 = (kC472 + kG472) - kF472;
    tmp3_1 = ((((kA472 + kC472) - kE472) - kE472) - kD472);
    tmp3_2 = kB472 - kG472;
    // Op 473: dim3x1 add
    gl64_t s1_473 = *(gl64_t*)&expressions_params[10][3];
    tmp3_0 = tmp3_0 + s1_473; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 474: dim3x3 mul
    gl64_t s1_474_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_474_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_474_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA474 = (tmp3_0 + tmp3_1) * (s1_474_0 + s1_474_1);
    gl64_t kB474 = (tmp3_0 + tmp3_2) * (s1_474_0 + s1_474_2);
    gl64_t kC474 = (tmp3_1 + tmp3_2) * (s1_474_1 + s1_474_2);
    gl64_t kD474 = tmp3_0 * s1_474_0;
    gl64_t kE474 = tmp3_1 * s1_474_1;
    gl64_t kF474 = tmp3_2 * s1_474_2;
    gl64_t kG474 = kD474 - kE474;
    tmp3_0 = (kC474 + kG474) - kF474;
    tmp3_1 = ((((kA474 + kC474) - kE474) - kE474) - kD474);
    tmp3_2 = kB474 - kG474;
    // Op 475: dim3x1 add
    gl64_t s1_475 = *(gl64_t*)&expressions_params[10][4];
    tmp3_0 = tmp3_0 + s1_475; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 476: dim3x3 mul
    gl64_t s1_476_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_476_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_476_2 = *(gl64_t*)&expressions_params[13][0+2];
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
    // Op 477: dim3x1 add
    gl64_t s1_477 = *(gl64_t*)&expressions_params[10][2];
    tmp3_0 = tmp3_0 + s1_477; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 478: dim3x3 mul
    gl64_t s1_478_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_478_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_478_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA478 = (tmp3_0 + tmp3_1) * (s1_478_0 + s1_478_1);
    gl64_t kB478 = (tmp3_0 + tmp3_2) * (s1_478_0 + s1_478_2);
    gl64_t kC478 = (tmp3_1 + tmp3_2) * (s1_478_1 + s1_478_2);
    gl64_t kD478 = tmp3_0 * s1_478_0;
    gl64_t kE478 = tmp3_1 * s1_478_1;
    gl64_t kF478 = tmp3_2 * s1_478_2;
    gl64_t kG478 = kD478 - kE478;
    tmp3_0 = (kC478 + kG478) - kF478;
    tmp3_1 = ((((kA478 + kC478) - kE478) - kE478) - kD478);
    tmp3_2 = kB478 - kG478;
    // Op 479: dim3x3 mul
    gl64_t s1_479_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_479_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_479_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA479 = (tmp3_0 + tmp3_1) * (s1_479_0 + s1_479_1);
    gl64_t kB479 = (tmp3_0 + tmp3_2) * (s1_479_0 + s1_479_2);
    gl64_t kC479 = (tmp3_1 + tmp3_2) * (s1_479_1 + s1_479_2);
    gl64_t kD479 = tmp3_0 * s1_479_0;
    gl64_t kE479 = tmp3_1 * s1_479_1;
    gl64_t kF479 = tmp3_2 * s1_479_2;
    gl64_t kG479 = kD479 - kE479;
    tmp3_0 = (kC479 + kG479) - kF479;
    tmp3_1 = ((((kA479 + kC479) - kE479) - kE479) - kD479);
    tmp3_2 = kB479 - kG479;
    // Op 480: dim3x1 add
    gl64_t s1_480 = *(gl64_t*)&expressions_params[10][1];
    tmp3_0 = tmp3_0 + s1_480; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 481: dim3x3 mul
    gl64_t s1_481_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_481_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_481_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA481 = (tmp3_0 + tmp3_1) * (s1_481_0 + s1_481_1);
    gl64_t kB481 = (tmp3_0 + tmp3_2) * (s1_481_0 + s1_481_2);
    gl64_t kC481 = (tmp3_1 + tmp3_2) * (s1_481_1 + s1_481_2);
    gl64_t kD481 = tmp3_0 * s1_481_0;
    gl64_t kE481 = tmp3_1 * s1_481_1;
    gl64_t kF481 = tmp3_2 * s1_481_2;
    gl64_t kG481 = kD481 - kE481;
    tmp3_0 = (kC481 + kG481) - kF481;
    tmp3_1 = ((((kA481 + kC481) - kE481) - kE481) - kD481);
    tmp3_2 = kB481 - kG481;
    // Op 482: dim3x1 add
    gl64_t s1_482 = *(gl64_t*)&expressions_params[9][17];
    tmp3_0 = tmp3_0 + s1_482; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 483: dim3x3 mul
    gl64_t s1_483_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_483_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_483_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA483 = (tmp3_0 + tmp3_1) * (s1_483_0 + s1_483_1);
    gl64_t kB483 = (tmp3_0 + tmp3_2) * (s1_483_0 + s1_483_2);
    gl64_t kC483 = (tmp3_1 + tmp3_2) * (s1_483_1 + s1_483_2);
    gl64_t kD483 = tmp3_0 * s1_483_0;
    gl64_t kE483 = tmp3_1 * s1_483_1;
    gl64_t kF483 = tmp3_2 * s1_483_2;
    gl64_t kG483 = kD483 - kE483;
    tmp3_0 = (kC483 + kG483) - kF483;
    tmp3_1 = ((((kA483 + kC483) - kE483) - kE483) - kD483);
    tmp3_2 = kB483 - kG483;
    // Op 484: dim3x3 mul
    gl64_t s1_484_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_484_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_484_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA484 = (tmp3_0 + tmp3_1) * (s1_484_0 + s1_484_1);
    gl64_t kB484 = (tmp3_0 + tmp3_2) * (s1_484_0 + s1_484_2);
    gl64_t kC484 = (tmp3_1 + tmp3_2) * (s1_484_1 + s1_484_2);
    gl64_t kD484 = tmp3_0 * s1_484_0;
    gl64_t kE484 = tmp3_1 * s1_484_1;
    gl64_t kF484 = tmp3_2 * s1_484_2;
    gl64_t kG484 = kD484 - kE484;
    tmp3_0 = (kC484 + kG484) - kF484;
    tmp3_1 = ((((kA484 + kC484) - kE484) - kE484) - kD484);
    tmp3_2 = kB484 - kG484;
    // Op 485: dim3x1 add
    gl64_t s1_485 = *(gl64_t*)&expressions_params[10][0];
    tmp3_0 = tmp3_0 + s1_485; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 486: dim3x3 mul
    gl64_t s1_486_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_486_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_486_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA486 = (tmp3_0 + tmp3_1) * (s1_486_0 + s1_486_1);
    gl64_t kB486 = (tmp3_0 + tmp3_2) * (s1_486_0 + s1_486_2);
    gl64_t kC486 = (tmp3_1 + tmp3_2) * (s1_486_1 + s1_486_2);
    gl64_t kD486 = tmp3_0 * s1_486_0;
    gl64_t kE486 = tmp3_1 * s1_486_1;
    gl64_t kF486 = tmp3_2 * s1_486_2;
    gl64_t kG486 = kD486 - kE486;
    tmp3_0 = (kC486 + kG486) - kF486;
    tmp3_1 = ((((kA486 + kC486) - kE486) - kE486) - kD486);
    tmp3_2 = kB486 - kG486;
    // Op 487: dim3x1 add
    gl64_t s1_487 = *(gl64_t*)&expressions_params[9][18];
    tmp3_0 = tmp3_0 + s1_487; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 488: dim3x3 add
    gl64_t s1_488_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_488_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_488_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_0 + s1_488_0; tmp3_1 = tmp3_1 + s1_488_1; tmp3_2 = tmp3_2 + s1_488_2;
    // Op 489: dim3x3 mul
    gl64_t s1_489_0 = *(gl64_t*)&expressions_params[10][17];
    gl64_t s1_489_1 = *(gl64_t*)&expressions_params[10][17+1];
    gl64_t s1_489_2 = *(gl64_t*)&expressions_params[10][17+2];
    gl64_t kA489 = (tmp3_0 + tmp3_1) * (s1_489_0 + s1_489_1);
    gl64_t kB489 = (tmp3_0 + tmp3_2) * (s1_489_0 + s1_489_2);
    gl64_t kC489 = (tmp3_1 + tmp3_2) * (s1_489_1 + s1_489_2);
    gl64_t kD489 = tmp3_0 * s1_489_0;
    gl64_t kE489 = tmp3_1 * s1_489_1;
    gl64_t kF489 = tmp3_2 * s1_489_2;
    gl64_t kG489 = kD489 - kE489;
    tmp3_0 = (kC489 + kG489) - kF489;
    tmp3_1 = ((((kA489 + kC489) - kE489) - kE489) - kD489);
    tmp3_2 = kB489 - kG489;
    // Op 490: dim3x1 add
    gl64_t s1_490 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_490; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 491: dim3x3 add
    tmp3_0 = tmp3_6 + tmp3_0; tmp3_1 = tmp3_7 + tmp3_1; tmp3_2 = tmp3_8 + tmp3_2;
    // Op 492: dim3x3 mul
    gl64_t s1_492_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_492_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_492_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA492 = (tmp3_0 + tmp3_1) * (s1_492_0 + s1_492_1);
    gl64_t kB492 = (tmp3_0 + tmp3_2) * (s1_492_0 + s1_492_2);
    gl64_t kC492 = (tmp3_1 + tmp3_2) * (s1_492_1 + s1_492_2);
    gl64_t kD492 = tmp3_0 * s1_492_0;
    gl64_t kE492 = tmp3_1 * s1_492_1;
    gl64_t kF492 = tmp3_2 * s1_492_2;
    gl64_t kG492 = kD492 - kE492;
    tmp3_6 = (kC492 + kG492) - kF492;
    tmp3_7 = ((((kA492 + kC492) - kE492) - kE492) - kD492);
    tmp3_8 = kB492 - kG492;
    // Op 493: dim3x1 mul
    gl64_t s0_493_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_493_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_493_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_493 = *(gl64_t*)&expressions_params[10][10];
    tmp3_0 = s0_493_0 * s1_493; tmp3_1 = s0_493_1 * s1_493; tmp3_2 = s0_493_2 * s1_493;
    // Op 494: dim3x1 add
    gl64_t s1_494 = *(gl64_t*)&expressions_params[10][13];
    tmp3_0 = tmp3_0 + s1_494; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 495: dim3x3 mul
    gl64_t s1_495_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_495_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_495_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA495 = (tmp3_0 + tmp3_1) * (s1_495_0 + s1_495_1);
    gl64_t kB495 = (tmp3_0 + tmp3_2) * (s1_495_0 + s1_495_2);
    gl64_t kC495 = (tmp3_1 + tmp3_2) * (s1_495_1 + s1_495_2);
    gl64_t kD495 = tmp3_0 * s1_495_0;
    gl64_t kE495 = tmp3_1 * s1_495_1;
    gl64_t kF495 = tmp3_2 * s1_495_2;
    gl64_t kG495 = kD495 - kE495;
    tmp3_0 = (kC495 + kG495) - kF495;
    tmp3_1 = ((((kA495 + kC495) - kE495) - kE495) - kD495);
    tmp3_2 = kB495 - kG495;
    // Op 496: dim3x1 add
    gl64_t s1_496 = *(gl64_t*)&expressions_params[10][8];
    tmp3_0 = tmp3_0 + s1_496; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 497: dim3x3 mul
    gl64_t s1_497_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_497_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_497_2 = *(gl64_t*)&expressions_params[13][0+2];
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
    gl64_t s1_498 = *(gl64_t*)&expressions_params[10][9];
    tmp3_0 = tmp3_0 + s1_498; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 499: dim3x3 mul
    gl64_t s1_499_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_499_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_499_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA499 = (tmp3_0 + tmp3_1) * (s1_499_0 + s1_499_1);
    gl64_t kB499 = (tmp3_0 + tmp3_2) * (s1_499_0 + s1_499_2);
    gl64_t kC499 = (tmp3_1 + tmp3_2) * (s1_499_1 + s1_499_2);
    gl64_t kD499 = tmp3_0 * s1_499_0;
    gl64_t kE499 = tmp3_1 * s1_499_1;
    gl64_t kF499 = tmp3_2 * s1_499_2;
    gl64_t kG499 = kD499 - kE499;
    tmp3_0 = (kC499 + kG499) - kF499;
    tmp3_1 = ((((kA499 + kC499) - kE499) - kE499) - kD499);
    tmp3_2 = kB499 - kG499;
    // Op 500: dim3x1 add
    gl64_t s1_500 = *(gl64_t*)&expressions_params[10][7];
    tmp3_0 = tmp3_0 + s1_500; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 501: dim3x3 mul
    gl64_t s1_501_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_501_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_501_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA501 = (tmp3_0 + tmp3_1) * (s1_501_0 + s1_501_1);
    gl64_t kB501 = (tmp3_0 + tmp3_2) * (s1_501_0 + s1_501_2);
    gl64_t kC501 = (tmp3_1 + tmp3_2) * (s1_501_1 + s1_501_2);
    gl64_t kD501 = tmp3_0 * s1_501_0;
    gl64_t kE501 = tmp3_1 * s1_501_1;
    gl64_t kF501 = tmp3_2 * s1_501_2;
    gl64_t kG501 = kD501 - kE501;
    tmp3_0 = (kC501 + kG501) - kF501;
    tmp3_1 = ((((kA501 + kC501) - kE501) - kE501) - kD501);
    tmp3_2 = kB501 - kG501;
    // Op 502: dim3x3 mul
    gl64_t s1_502_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_502_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_502_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA502 = (tmp3_0 + tmp3_1) * (s1_502_0 + s1_502_1);
    gl64_t kB502 = (tmp3_0 + tmp3_2) * (s1_502_0 + s1_502_2);
    gl64_t kC502 = (tmp3_1 + tmp3_2) * (s1_502_1 + s1_502_2);
    gl64_t kD502 = tmp3_0 * s1_502_0;
    gl64_t kE502 = tmp3_1 * s1_502_1;
    gl64_t kF502 = tmp3_2 * s1_502_2;
    gl64_t kG502 = kD502 - kE502;
    tmp3_0 = (kC502 + kG502) - kF502;
    tmp3_1 = ((((kA502 + kC502) - kE502) - kE502) - kD502);
    tmp3_2 = kB502 - kG502;
    // Op 503: dim3x1 add
    gl64_t s1_503 = *(gl64_t*)&expressions_params[10][6];
    tmp3_0 = tmp3_0 + s1_503; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 504: dim3x3 mul
    gl64_t s1_504_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_504_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_504_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA504 = (tmp3_0 + tmp3_1) * (s1_504_0 + s1_504_1);
    gl64_t kB504 = (tmp3_0 + tmp3_2) * (s1_504_0 + s1_504_2);
    gl64_t kC504 = (tmp3_1 + tmp3_2) * (s1_504_1 + s1_504_2);
    gl64_t kD504 = tmp3_0 * s1_504_0;
    gl64_t kE504 = tmp3_1 * s1_504_1;
    gl64_t kF504 = tmp3_2 * s1_504_2;
    gl64_t kG504 = kD504 - kE504;
    tmp3_0 = (kC504 + kG504) - kF504;
    tmp3_1 = ((((kA504 + kC504) - kE504) - kE504) - kD504);
    tmp3_2 = kB504 - kG504;
    // Op 505: dim3x1 add
    gl64_t s1_505 = *(gl64_t*)&expressions_params[9][17];
    tmp3_0 = tmp3_0 + s1_505; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 506: dim3x3 mul
    gl64_t s1_506_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_506_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_506_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA506 = (tmp3_0 + tmp3_1) * (s1_506_0 + s1_506_1);
    gl64_t kB506 = (tmp3_0 + tmp3_2) * (s1_506_0 + s1_506_2);
    gl64_t kC506 = (tmp3_1 + tmp3_2) * (s1_506_1 + s1_506_2);
    gl64_t kD506 = tmp3_0 * s1_506_0;
    gl64_t kE506 = tmp3_1 * s1_506_1;
    gl64_t kF506 = tmp3_2 * s1_506_2;
    gl64_t kG506 = kD506 - kE506;
    tmp3_0 = (kC506 + kG506) - kF506;
    tmp3_1 = ((((kA506 + kC506) - kE506) - kE506) - kD506);
    tmp3_2 = kB506 - kG506;
    // Op 507: dim3x1 add
    gl64_t s1_507 = *(gl64_t*)&expressions_params[10][11];
    tmp3_0 = tmp3_0 + s1_507; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 508: dim3x3 mul
    gl64_t s1_508_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_508_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_508_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA508 = (tmp3_0 + tmp3_1) * (s1_508_0 + s1_508_1);
    gl64_t kB508 = (tmp3_0 + tmp3_2) * (s1_508_0 + s1_508_2);
    gl64_t kC508 = (tmp3_1 + tmp3_2) * (s1_508_1 + s1_508_2);
    gl64_t kD508 = tmp3_0 * s1_508_0;
    gl64_t kE508 = tmp3_1 * s1_508_1;
    gl64_t kF508 = tmp3_2 * s1_508_2;
    gl64_t kG508 = kD508 - kE508;
    tmp3_0 = (kC508 + kG508) - kF508;
    tmp3_1 = ((((kA508 + kC508) - kE508) - kE508) - kD508);
    tmp3_2 = kB508 - kG508;
    // Op 509: dim1x1 add
    gl64_t s0_509 = *(gl64_t*)&expressions_params[9][0];
    gl64_t s1_509 = *(gl64_t*)&expressions_params[10][0];
    tmp1_4 = s0_509 + s1_509;
    // Op 510: dim3x1 add
    tmp3_0 = tmp3_0 + tmp1_4; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 511: dim3x3 mul
    gl64_t s1_511_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s1_511_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s1_511_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t kA511 = (tmp3_0 + tmp3_1) * (s1_511_0 + s1_511_1);
    gl64_t kB511 = (tmp3_0 + tmp3_2) * (s1_511_0 + s1_511_2);
    gl64_t kC511 = (tmp3_1 + tmp3_2) * (s1_511_1 + s1_511_2);
    gl64_t kD511 = tmp3_0 * s1_511_0;
    gl64_t kE511 = tmp3_1 * s1_511_1;
    gl64_t kF511 = tmp3_2 * s1_511_2;
    gl64_t kG511 = kD511 - kE511;
    tmp3_0 = (kC511 + kG511) - kF511;
    tmp3_1 = ((((kA511 + kC511) - kE511) - kE511) - kD511);
    tmp3_2 = kB511 - kG511;
    // Op 512: dim3x1 add
    gl64_t s1_512 = *(gl64_t*)&expressions_params[9][18];
    tmp3_0 = tmp3_0 + s1_512; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 513: dim3x3 add
    gl64_t s1_513_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_513_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_513_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_0 + s1_513_0; tmp3_1 = tmp3_1 + s1_513_1; tmp3_2 = tmp3_2 + s1_513_2;
    // Op 514: dim3x3 mul
    gl64_t s1_514_0 = *(gl64_t*)&expressions_params[10][20];
    gl64_t s1_514_1 = *(gl64_t*)&expressions_params[10][20+1];
    gl64_t s1_514_2 = *(gl64_t*)&expressions_params[10][20+2];
    gl64_t kA514 = (tmp3_0 + tmp3_1) * (s1_514_0 + s1_514_1);
    gl64_t kB514 = (tmp3_0 + tmp3_2) * (s1_514_0 + s1_514_2);
    gl64_t kC514 = (tmp3_1 + tmp3_2) * (s1_514_1 + s1_514_2);
    gl64_t kD514 = tmp3_0 * s1_514_0;
    gl64_t kE514 = tmp3_1 * s1_514_1;
    gl64_t kF514 = tmp3_2 * s1_514_2;
    gl64_t kG514 = kD514 - kE514;
    tmp3_0 = (kC514 + kG514) - kF514;
    tmp3_1 = ((((kA514 + kC514) - kE514) - kE514) - kD514);
    tmp3_2 = kB514 - kG514;
    // Op 515: dim1x1 sub
    gl64_t s0_515 = *(gl64_t*)&expressions_params[9][0];
    gl64_t s1_515 = *(gl64_t*)&expressions_params[10][11];
    tmp1_4 = s0_515 - s1_515;
    // Op 516: dim3x1 sub
    tmp3_0 = tmp3_0 - tmp1_4; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 517: dim3x3 add
    tmp3_0 = tmp3_6 + tmp3_0; tmp3_1 = tmp3_7 + tmp3_1; tmp3_2 = tmp3_8 + tmp3_2;
    // Op 518: dim3x3 mul
    gl64_t s1_518_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_518_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_518_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA518 = (tmp3_0 + tmp3_1) * (s1_518_0 + s1_518_1);
    gl64_t kB518 = (tmp3_0 + tmp3_2) * (s1_518_0 + s1_518_2);
    gl64_t kC518 = (tmp3_1 + tmp3_2) * (s1_518_1 + s1_518_2);
    gl64_t kD518 = tmp3_0 * s1_518_0;
    gl64_t kE518 = tmp3_1 * s1_518_1;
    gl64_t kF518 = tmp3_2 * s1_518_2;
    gl64_t kG518 = kD518 - kE518;
    tmp3_6 = (kC518 + kG518) - kF518;
    tmp3_7 = ((((kA518 + kC518) - kE518) - kE518) - kD518);
    tmp3_8 = kB518 - kG518;
    // Op 519: dim3x1 add
    gl64_t s0_519_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s0_519_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s0_519_2 = *(gl64_t*)&expressions_params[13][3+2];
    gl64_t s1_519 = *(gl64_t*)&expressions_params[9][15];
    tmp3_0 = s0_519_0 + s1_519; tmp3_1 = s0_519_1; tmp3_2 = s0_519_2;
    // Op 520: dim3x3 mul
    gl64_t s1_520_0 = *(gl64_t*)&expressions_params[10][23];
    gl64_t s1_520_1 = *(gl64_t*)&expressions_params[10][23+1];
    gl64_t s1_520_2 = *(gl64_t*)&expressions_params[10][23+2];
    gl64_t kA520 = (tmp3_0 + tmp3_1) * (s1_520_0 + s1_520_1);
    gl64_t kB520 = (tmp3_0 + tmp3_2) * (s1_520_0 + s1_520_2);
    gl64_t kC520 = (tmp3_1 + tmp3_2) * (s1_520_1 + s1_520_2);
    gl64_t kD520 = tmp3_0 * s1_520_0;
    gl64_t kE520 = tmp3_1 * s1_520_1;
    gl64_t kF520 = tmp3_2 * s1_520_2;
    gl64_t kG520 = kD520 - kE520;
    tmp3_0 = (kC520 + kG520) - kF520;
    tmp3_1 = ((((kA520 + kC520) - kE520) - kE520) - kD520);
    tmp3_2 = kB520 - kG520;
    // Op 521: dim1x1 sub
    gl64_t s0_521 = *(gl64_t*)&expressions_params[9][1];
    gl64_t s1_521 = *(gl64_t*)&expressions_params[10][16];
    tmp1_4 = s0_521 - s1_521;
    // Op 522: dim3x1 sub
    tmp3_0 = tmp3_0 - tmp1_4; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 523: dim3x3 add
    tmp3_0 = tmp3_6 + tmp3_0; tmp3_1 = tmp3_7 + tmp3_1; tmp3_2 = tmp3_8 + tmp3_2;
    // Op 524: dim3x3 mul
    gl64_t s1_524_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_524_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_524_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA524 = (tmp3_0 + tmp3_1) * (s1_524_0 + s1_524_1);
    gl64_t kB524 = (tmp3_0 + tmp3_2) * (s1_524_0 + s1_524_2);
    gl64_t kC524 = (tmp3_1 + tmp3_2) * (s1_524_1 + s1_524_2);
    gl64_t kD524 = tmp3_0 * s1_524_0;
    gl64_t kE524 = tmp3_1 * s1_524_1;
    gl64_t kF524 = tmp3_2 * s1_524_2;
    gl64_t kG524 = kD524 - kE524;
    tmp3_6 = (kC524 + kG524) - kF524;
    tmp3_7 = ((((kA524 + kC524) - kE524) - kE524) - kD524);
    tmp3_8 = kB524 - kG524;
    // Op 525: dim3x1 mul
    gl64_t s0_525_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_525_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_525_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_525 = *(gl64_t*)&expressions_params[10][14];
    tmp3_0 = s0_525_0 * s1_525; tmp3_1 = s0_525_1 * s1_525; tmp3_2 = s0_525_2 * s1_525;
    // Op 526: dim3x1 add
    gl64_t s1_526 = *(gl64_t*)&expressions_params[9][19];
    tmp3_0 = tmp3_0 + s1_526; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 527: dim3x3 add
    gl64_t s1_527_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_527_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_527_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_0 + s1_527_0; tmp3_1 = tmp3_1 + s1_527_1; tmp3_2 = tmp3_2 + s1_527_2;
    // Op 528: dim3x3 mul
    gl64_t s1_528_0 = *(gl64_t*)&expressions_params[10][26];
    gl64_t s1_528_1 = *(gl64_t*)&expressions_params[10][26+1];
    gl64_t s1_528_2 = *(gl64_t*)&expressions_params[10][26+2];
    gl64_t kA528 = (tmp3_0 + tmp3_1) * (s1_528_0 + s1_528_1);
    gl64_t kB528 = (tmp3_0 + tmp3_2) * (s1_528_0 + s1_528_2);
    gl64_t kC528 = (tmp3_1 + tmp3_2) * (s1_528_1 + s1_528_2);
    gl64_t kD528 = tmp3_0 * s1_528_0;
    gl64_t kE528 = tmp3_1 * s1_528_1;
    gl64_t kF528 = tmp3_2 * s1_528_2;
    gl64_t kG528 = kD528 - kE528;
    tmp3_0 = (kC528 + kG528) - kF528;
    tmp3_1 = ((((kA528 + kC528) - kE528) - kE528) - kD528);
    tmp3_2 = kB528 - kG528;
    // Op 529: dim3x1 add
    gl64_t s1_529 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_529; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 530: dim3x3 add
    tmp3_0 = tmp3_6 + tmp3_0; tmp3_1 = tmp3_7 + tmp3_1; tmp3_2 = tmp3_8 + tmp3_2;
    // Op 531: dim3x3 mul
    gl64_t s1_531_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_531_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_531_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA531 = (tmp3_0 + tmp3_1) * (s1_531_0 + s1_531_1);
    gl64_t kB531 = (tmp3_0 + tmp3_2) * (s1_531_0 + s1_531_2);
    gl64_t kC531 = (tmp3_1 + tmp3_2) * (s1_531_1 + s1_531_2);
    gl64_t kD531 = tmp3_0 * s1_531_0;
    gl64_t kE531 = tmp3_1 * s1_531_1;
    gl64_t kF531 = tmp3_2 * s1_531_2;
    gl64_t kG531 = kD531 - kE531;
    tmp3_6 = (kC531 + kG531) - kF531;
    tmp3_7 = ((((kA531 + kC531) - kE531) - kE531) - kD531);
    tmp3_8 = kB531 - kG531;
    // Op 532: dim3x1 mul
    gl64_t s0_532_0 = *(gl64_t*)&expressions_params[13][0];
    gl64_t s0_532_1 = *(gl64_t*)&expressions_params[13][0+1];
    gl64_t s0_532_2 = *(gl64_t*)&expressions_params[13][0+2];
    gl64_t s1_532 = *(gl64_t*)&expressions_params[10][15];
    tmp3_0 = s0_532_0 * s1_532; tmp3_1 = s0_532_1 * s1_532; tmp3_2 = s0_532_2 * s1_532;
    // Op 533: dim3x1 add
    gl64_t s1_533 = *(gl64_t*)&expressions_params[9][19];
    tmp3_0 = tmp3_0 + s1_533; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 534: dim3x3 add
    gl64_t s1_534_0 = *(gl64_t*)&expressions_params[13][3];
    gl64_t s1_534_1 = *(gl64_t*)&expressions_params[13][3+1];
    gl64_t s1_534_2 = *(gl64_t*)&expressions_params[13][3+2];
    tmp3_0 = tmp3_0 + s1_534_0; tmp3_1 = tmp3_1 + s1_534_1; tmp3_2 = tmp3_2 + s1_534_2;
    // Op 535: dim3x3 mul
    gl64_t s1_535_0 = *(gl64_t*)&expressions_params[10][29];
    gl64_t s1_535_1 = *(gl64_t*)&expressions_params[10][29+1];
    gl64_t s1_535_2 = *(gl64_t*)&expressions_params[10][29+2];
    gl64_t kA535 = (tmp3_0 + tmp3_1) * (s1_535_0 + s1_535_1);
    gl64_t kB535 = (tmp3_0 + tmp3_2) * (s1_535_0 + s1_535_2);
    gl64_t kC535 = (tmp3_1 + tmp3_2) * (s1_535_1 + s1_535_2);
    gl64_t kD535 = tmp3_0 * s1_535_0;
    gl64_t kE535 = tmp3_1 * s1_535_1;
    gl64_t kF535 = tmp3_2 * s1_535_2;
    gl64_t kG535 = kD535 - kE535;
    tmp3_0 = (kC535 + kG535) - kF535;
    tmp3_1 = ((((kA535 + kC535) - kE535) - kE535) - kD535);
    tmp3_2 = kB535 - kG535;
    // Op 536: dim3x1 add
    gl64_t s1_536 = *(gl64_t*)&expressions_params[9][0];
    tmp3_0 = tmp3_0 + s1_536; tmp3_1 = tmp3_1; tmp3_2 = tmp3_2;
    // Op 537: dim3x3 add
    tmp3_0 = tmp3_6 + tmp3_0; tmp3_1 = tmp3_7 + tmp3_1; tmp3_2 = tmp3_8 + tmp3_2;
    // Op 538: dim3x3 mul
    gl64_t s1_538_0 = *(gl64_t*)&expressions_params[13][6];
    gl64_t s1_538_1 = *(gl64_t*)&expressions_params[13][6+1];
    gl64_t s1_538_2 = *(gl64_t*)&expressions_params[13][6+2];
    gl64_t kA538 = (tmp3_0 + tmp3_1) * (s1_538_0 + s1_538_1);
    gl64_t kB538 = (tmp3_0 + tmp3_2) * (s1_538_0 + s1_538_2);
    gl64_t kC538 = (tmp3_1 + tmp3_2) * (s1_538_1 + s1_538_2);
    gl64_t kD538 = tmp3_0 * s1_538_0;
    gl64_t kE538 = tmp3_1 * s1_538_1;
    gl64_t kF538 = tmp3_2 * s1_538_2;
    gl64_t kG538 = kD538 - kE538;
    tmp3_3 = (kC538 + kG538) - kF538;
    tmp3_4 = ((((kA538 + kC538) - kE538) - kE538) - kD538);
    tmp3_5 = kB538 - kG538;
    // Op 539: dim3x3 sub_swap
    uint64_t s0_539_pos = dExpsArgs->mapOffsetsExps[2] + (usePack256_1 ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_2) : getBufferOffset(logicalRow_1, 0, domainSize, nCols_2));
    gl64_t s0_539_0 = *(gl64_t*)&dParams->aux_trace[s0_539_pos];
    gl64_t s0_539_1 = *(gl64_t*)&dParams->aux_trace[s0_539_pos + TILE_HEIGHT];
    gl64_t s0_539_2 = *(gl64_t*)&dParams->aux_trace[s0_539_pos + 2*TILE_HEIGHT];
    gl64_t s1_539_0 = *(gl64_t*)&expressions_params[12][0];
    gl64_t s1_539_1 = *(gl64_t*)&expressions_params[12][0+1];
    gl64_t s1_539_2 = *(gl64_t*)&expressions_params[12][0+2];
    tmp3_6 = s1_539_0 - s0_539_0; tmp3_7 = s1_539_1 - s0_539_1; tmp3_8 = s1_539_2 - s0_539_2;
    // Op 540: dim3x3 add
    gl64_t s0_540_0 = *(gl64_t*)&expressions_params[10][17];
    gl64_t s0_540_1 = *(gl64_t*)&expressions_params[10][17+1];
    gl64_t s0_540_2 = *(gl64_t*)&expressions_params[10][17+2];
    gl64_t s1_540_0 = *(gl64_t*)&expressions_params[10][20];
    gl64_t s1_540_1 = *(gl64_t*)&expressions_params[10][20+1];
    gl64_t s1_540_2 = *(gl64_t*)&expressions_params[10][20+2];
    tmp3_0 = s0_540_0 + s1_540_0; tmp3_1 = s0_540_1 + s1_540_1; tmp3_2 = s0_540_2 + s1_540_2;
    // Op 541: dim3x3 add
    gl64_t s1_541_0 = *(gl64_t*)&expressions_params[10][23];
    gl64_t s1_541_1 = *(gl64_t*)&expressions_params[10][23+1];
    gl64_t s1_541_2 = *(gl64_t*)&expressions_params[10][23+2];
    tmp3_0 = tmp3_0 + s1_541_0; tmp3_1 = tmp3_1 + s1_541_1; tmp3_2 = tmp3_2 + s1_541_2;
    // Op 542: dim3x3 add
    gl64_t s1_542_0 = *(gl64_t*)&expressions_params[10][26];
    gl64_t s1_542_1 = *(gl64_t*)&expressions_params[10][26+1];
    gl64_t s1_542_2 = *(gl64_t*)&expressions_params[10][26+2];
    tmp3_0 = tmp3_0 + s1_542_0; tmp3_1 = tmp3_1 + s1_542_1; tmp3_2 = tmp3_2 + s1_542_2;
    // Op 543: dim3x3 add
    gl64_t s1_543_0 = *(gl64_t*)&expressions_params[10][29];
    gl64_t s1_543_1 = *(gl64_t*)&expressions_params[10][29+1];
    gl64_t s1_543_2 = *(gl64_t*)&expressions_params[10][29+2];
    tmp3_0 = tmp3_0 + s1_543_0; tmp3_1 = tmp3_1 + s1_543_1; tmp3_2 = tmp3_2 + s1_543_2;
    // Op 544: dim3x3 sub
    tmp3_0 = tmp3_6 - tmp3_0; tmp3_1 = tmp3_7 - tmp3_1; tmp3_2 = tmp3_8 - tmp3_2;
    // Op 545: dim3x1 mul
    gl64_t s1_545 = *(gl64_t*)&dParams->pConstPolsExtendedTreeAddress[false ? getBufferOffset_pack256(chunkBase, 0, domainSize, nCols_0) : getBufferOffset(logicalRow_2, 0, domainSize, nCols_0)];
    tmp3_0 = tmp3_0 * s1_545; tmp3_1 = tmp3_1 * s1_545; tmp3_2 = tmp3_2 * s1_545;
    // Op 546: dim3x3 add
    tmp3_0 = tmp3_3 + tmp3_0; tmp3_1 = tmp3_4 + tmp3_1; tmp3_2 = tmp3_5 + tmp3_2;
    // Op 547: dim3x1 mul
    gl64_t s1_547 = *(gl64_t*)&dParams->aux_trace[dArgs->zi_offset + (1 - 1) * domainSize + row + threadIdx.x];
    tmp3_0 = tmp3_0 * s1_547; tmp3_1 = tmp3_1 * s1_547; tmp3_2 = tmp3_2 * s1_547;

    // Write final result to shared memory and store to output
    *(gl64_t*)&expressions_params[bufferCommitsSize + 1][0 * blockDim.x + threadIdx.x] = tmp3_0;
    *(gl64_t*)&expressions_params[bufferCommitsSize + 1][1 * blockDim.x + threadIdx.x] = tmp3_1;
    *(gl64_t*)&expressions_params[bufferCommitsSize + 1][2 * blockDim.x + threadIdx.x] = tmp3_2;
    storePolynomial__((ExpsArguments*)dExpsArgs, (Goldilocks::Element*)&expressions_params[bufferCommitsSize + 1][0 * blockDim.x], row);
}
