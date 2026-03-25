#ifndef EXPRESSIONS_GPU_HPP
#define EXPRESSIONS_GPU_HPP
#include "expressions_ctx.hpp"
#include "cuda_utils.cuh"
#include "cuda_utils.hpp"
#include "gpu_timer.cuh"
#include "data_layout.cuh"
#include <omp.h>
#include <map>

// Pre-decoded source operand: all metadata resolved at init time
struct PreDecodedSrcGPU {
    uint16_t paramsIdx;   // index into expressions_params[]
    uint16_t col;         // column for getBufferOffset
    uint16_t nCols;       // nCols for getBufferOffset (0 = temp/const, no offset needed)
    uint8_t  dim;         // 1 or 3
    uint8_t  isConst;     // 1 if broadcast (same value for all rows)
    int64_t  stride;      // pre-resolved stride value (0 for no stride)
    uint64_t baseOffset;  // offset from expressions_params[paramsIdx] base
};

// Pre-decoded operation: combines op type, arithmetic, dest, and both sources
struct PreDecodedOpGPU {
    uint8_t dimCombo;     // 0=1x1, 1=3x1, 2=3x3
    uint8_t arithOp;      // 0=add, 1=sub, 2=mul, 3=sub_swap
    uint16_t destIdx;     // temp buffer slot index
    PreDecodedSrcGPU src[2];
};

struct DeviceArguments
{
    uint64_t N;
    uint64_t NExtended;
    uint64_t nBlocks;
    uint32_t nStages;
    uint32_t nCustomCommits;
    uint32_t bufferCommitSize;

    uint64_t zi_offset;

    uint64_t *mapOffsets;
    uint64_t *mapOffsetsExtended;
    uint64_t *nextStrides;
    uint64_t *nextStridesExtended;
    uint64_t *mapOffsetsCustomFixed;
    uint64_t *mapOffsetsCustomFixedExtended;
    uint64_t *mapSectionsN;
    uint64_t *mapSectionsNCustomFixed;

    // Expressions bin
    uint8_t *ops;
    uint16_t *args;
    Goldilocks::Element *numbers;

    uint8_t *opsConstraints;
    uint16_t *argsConstraints;
    Goldilocks::Element *numbersConstraints;
};

__global__  void computeExpressions_(StepsParams *h_params, DeviceArguments *d_deviceArgs, ExpsArguments *d_expsArgs, DestParamsGPU *d_destParams, bool constraints);
__global__  void computeExpression_(StepsParams *h_params, DeviceArguments *d_deviceArgs, ExpsArguments *d_expsArgs, DestParamsGPU *d_destParams);
__global__  void computeExpression_predecoded_(StepsParams *d_params, DeviceArguments *d_deviceArgs, ExpsArguments *d_expsArgs, DestParamsGPU *d_destParams, PreDecodedOpGPU *d_predecOps, uint32_t nPredecOps);

class ExpressionsGPU : public ExpressionsCtx
{
public:
    uint32_t nRowsPack;
    uint32_t nBlocks;
    uint64_t bufferCommitSize;

    DeviceArguments *d_deviceArgs;
    DeviceArguments h_deviceArgs;

    // Pre-decoded ops per expression (expId -> GPU pointer)
    std::map<uint64_t, PreDecodedOpGPU*> d_predecOps;
    std::map<uint64_t, uint32_t> predecNOps;

    ExpressionsGPU(SetupCtx &setupCtx, uint32_t nRowsPack = 128, uint32_t nBlocks = 4096);
    ~ExpressionsGPU();

    void preDecodeExpression(uint64_t expId);

    void calculateExpressions_gpu(StepsParams *d_params, Dest dest, uint64_t domainSize, bool domainExtended, ExpsArguments *d_expsArgs, DestParamsGPU *d_destParams, Goldilocks::Element *pinned_exps_params, Goldilocks::Element *pinned_exps_args, uint64_t& countId, TimerGPU &timer, cudaStream_t stream, bool constraints = false);
    void calculateExpressionsQ_gpu(StepsParams *d_params, Dest dest, uint64_t domainSize, bool domainExtended, ExpsArguments *d_expsArgs, DestParamsGPU *d_destParams, Goldilocks::Element *pinned_exps_params, Goldilocks::Element *pinned_exps_args, uint64_t& countId, TimerGPU &timer, cudaStream_t stream);
};
#endif

