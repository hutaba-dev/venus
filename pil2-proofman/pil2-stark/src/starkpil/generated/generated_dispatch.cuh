// Auto-generated dispatch header for expression evaluators
// Include all generated evaluator files

#include "gen_eval_1020.cuh"
#include "gen_eval_1052.cuh"
#include "gen_eval_136.cuh"
#include "gen_eval_1638.cuh"
#include "gen_eval_186.cuh"
#include "gen_eval_212.cuh"
#include "gen_eval_239.cuh"
#include "gen_eval_265.cuh"
#include "gen_eval_2755.cuh"
#include "gen_eval_302.cuh"
#include "gen_eval_319.cuh"
#include "gen_eval_347.cuh"
#include "gen_eval_437.cuh"
#include "gen_eval_479.cuh"
#include "gen_eval_482.cuh"
#include "gen_eval_51.cuh"
#include "gen_eval_518.cuh"
#include "gen_eval_632.cuh"
#include "gen_eval_712.cuh"
#include "gen_eval_717.cuh"
#include "gen_eval_856.cuh"
#include "gen_eval_981.cuh"

// Dispatch function: tries generated evaluator, returns false if no match
template<bool IsCyclic>
__device__ __forceinline__ bool dispatch_generated_eval(
    const StepsParams* __restrict__ dParams,
    const DeviceArguments* __restrict__ dArgs,
    const ExpsArguments* __restrict__ dExpsArgs,
    Goldilocks::Element **expressions_params,
    uint32_t bufferCommitsSize, uint64_t row,
    uint32_t nOps, uint32_t nTemp1, uint32_t nTemp3)
{
    if (nOps == 799 && nTemp1 == 5 && nTemp3 == 5) {
        eval_expr_805e348b<IsCyclic>(dParams, dArgs, dExpsArgs, expressions_params, bufferCommitsSize, row);
        return true;
    }
    if (nOps == 771 && nTemp1 == 4 && nTemp3 == 5) {
        eval_expr_9a44e4f6<IsCyclic>(dParams, dArgs, dExpsArgs, expressions_params, bufferCommitsSize, row);
        return true;
    }
    if (nOps == 96 && nTemp1 == 3 && nTemp3 == 5) {
        eval_expr_b2412d29<IsCyclic>(dParams, dArgs, dExpsArgs, expressions_params, bufferCommitsSize, row);
        return true;
    }
    if (nOps == 1026 && nTemp1 == 7 && nTemp3 == 5) {
        eval_expr_831d811b<IsCyclic>(dParams, dArgs, dExpsArgs, expressions_params, bufferCommitsSize, row);
        return true;
    }
    if (nOps == 146 && nTemp1 == 4 && nTemp3 == 5) {
        eval_expr_3f3558d8<IsCyclic>(dParams, dArgs, dExpsArgs, expressions_params, bufferCommitsSize, row);
        return true;
    }
    if (nOps == 171 && nTemp1 == 3 && nTemp3 == 3) {
        eval_expr_13b25f36<IsCyclic>(dParams, dArgs, dExpsArgs, expressions_params, bufferCommitsSize, row);
        return true;
    }
    if (nOps == 142 && nTemp1 == 1 && nTemp3 == 5) {
        eval_expr_22e7bf00<IsCyclic>(dParams, dArgs, dExpsArgs, expressions_params, bufferCommitsSize, row);
        return true;
    }
    if (nOps == 206 && nTemp1 == 5 && nTemp3 == 5) {
        eval_expr_b2f2c7b9<IsCyclic>(dParams, dArgs, dExpsArgs, expressions_params, bufferCommitsSize, row);
        return true;
    }
    if (nOps == 2017 && nTemp1 == 5 && nTemp3 == 5) {
        eval_expr_e45c5827<IsCyclic>(dParams, dArgs, dExpsArgs, expressions_params, bufferCommitsSize, row);
        return true;
    }
    if (nOps == 184 && nTemp1 == 1 && nTemp3 == 5) {
        eval_expr_0703bbda<IsCyclic>(dParams, dArgs, dExpsArgs, expressions_params, bufferCommitsSize, row);
        return true;
    }
    if (nOps == 245 && nTemp1 == 5 && nTemp3 == 5) {
        eval_expr_67674211<IsCyclic>(dParams, dArgs, dExpsArgs, expressions_params, bufferCommitsSize, row);
        return true;
    }
    if (nOps == 274 && nTemp1 == 5 && nTemp3 == 5) {
        eval_expr_9d2022fc<IsCyclic>(dParams, dArgs, dExpsArgs, expressions_params, bufferCommitsSize, row);
        return true;
    }
    if (nOps == 270 && nTemp1 == 3 && nTemp3 == 5) {
        eval_expr_8ac86306<IsCyclic>(dParams, dArgs, dExpsArgs, expressions_params, bufferCommitsSize, row);
        return true;
    }
    if (nOps == 307 && nTemp1 == 2 && nTemp3 == 5) {
        eval_expr_cf025804<IsCyclic>(dParams, dArgs, dExpsArgs, expressions_params, bufferCommitsSize, row);
        return true;
    }
    if (nOps == 251 && nTemp1 == 1 && nTemp3 == 5) {
        eval_expr_15241f19<IsCyclic>(dParams, dArgs, dExpsArgs, expressions_params, bufferCommitsSize, row);
        return true;
    }
    if (nOps == 36 && nTemp1 == 1 && nTemp3 == 2) {
        eval_expr_b8aa312d<IsCyclic>(dParams, dArgs, dExpsArgs, expressions_params, bufferCommitsSize, row);
        return true;
    }
    if (nOps == 427 && nTemp1 == 4 && nTemp3 == 5) {
        eval_expr_5c75a2d5<IsCyclic>(dParams, dArgs, dExpsArgs, expressions_params, bufferCommitsSize, row);
        return true;
    }
    if (nOps == 486 && nTemp1 == 7 && nTemp3 == 5) {
        eval_expr_4a7a1ff2<IsCyclic>(dParams, dArgs, dExpsArgs, expressions_params, bufferCommitsSize, row);
        return true;
    }
    if (nOps == 510 && nTemp1 == 5 && nTemp3 == 5) {
        eval_expr_54872b67<IsCyclic>(dParams, dArgs, dExpsArgs, expressions_params, bufferCommitsSize, row);
        return true;
    }
    if (nOps == 548 && nTemp1 == 5 && nTemp3 == 5) {
        eval_expr_ac8c88ed<IsCyclic>(dParams, dArgs, dExpsArgs, expressions_params, bufferCommitsSize, row);
        return true;
    }
    if (nOps == 673 && nTemp1 == 6 && nTemp3 == 5) {
        eval_expr_9575516e<IsCyclic>(dParams, dArgs, dExpsArgs, expressions_params, bufferCommitsSize, row);
        return true;
    }
    if (nOps == 728 && nTemp1 == 8 && nTemp3 == 5) {
        eval_expr_d3f5e199<IsCyclic>(dParams, dArgs, dExpsArgs, expressions_params, bufferCommitsSize, row);
        return true;
    }
    return false;
}
