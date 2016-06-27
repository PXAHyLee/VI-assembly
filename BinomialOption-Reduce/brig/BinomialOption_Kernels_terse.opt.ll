; ModuleID = 'BinomialOption_Kernels_terse.opt.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n32"
target triple = "hsail64-pc-unknown-amdopencl"

define spir_kernel void @__OpenCL_binomial_options_kernel(i64 %__global_offset_0, i64 %__global_offset_1, i64 %__global_offset_2, i8 addrspace(1)* nocapture %__printf_buffer, i64 %__vqueue_pointer, i64 %__aqlwrap_pointer, i32 %numSteps, <4 x float> addrspace(1)* nocapture %randArray, <4 x float> addrspace(1)* nocapture %output, <4 x float> addrspace(3)* nocapture %callA, <4 x float> addrspace(3)* nocapture %callB) nounwind {
  %1 = tail call spir_func i32 @__hsail_get_local_id(i32 0) nounwind readnone
  %2 = zext i32 %1 to i64
  %3 = tail call spir_func i32 @__hsail_get_group_id(i32 0) nounwind readnone
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds <4 x float> addrspace(1)* %randArray, i64 %4
  %6 = load <4 x float> addrspace(1)* %5, align 16
  %7 = extractelement <4 x float> %6, i32 0
  %8 = fsub float 1.000000e+00, %7
  %9 = fmul float %7, 3.000000e+01
  %10 = tail call float @llvm.fmuladd.f32(float %8, float 5.000000e+00, float %9)
  %11 = fmul float %7, 1.000000e+02
  %12 = tail call float @llvm.fmuladd.f32(float %8, float 1.000000e+00, float %11)
  %13 = fmul float %7, 1.000000e+01
  %14 = tail call float @llvm.fmuladd.f32(float %8, float 2.500000e-01, float %13)
  %15 = sitofp i32 %numSteps to float
  %16 = fdiv float 1.000000e+00, %15, !fpmath !7
  %17 = fmul float %14, %16
  %18 = tail call spir_func float @__hsail_nsqrt_f32(float %17) nounwind readnone
  %19 = fmul float %18, 0x3FD3333340000000
  %20 = uitofp i32 %1 to float
  %21 = fsub float -0.000000e+00, %15
  %22 = tail call float @llvm.fmuladd.f32(float 2.000000e+00, float %20, float %21)
  %23 = fmul float %19, %22
  %24 = fcmp olt float %23, 0.000000e+00
  %25 = select i1 %24, float -5.000000e-01, float 5.000000e-01
  %26 = tail call spir_func float @__hsail_nfma_f32(float %23, float 0x3FF7154760000000, float %25) nounwind readnone
  %27 = fptosi float %26 to i32
  %28 = sitofp i32 %27 to float
  %29 = tail call spir_func float @__hsail_nfma_f32(float %28, float 0xBFE62E3000000000, float %23) nounwind readnone
  %30 = fmul float %28, 0xBEE2FEFA20000000
  %31 = fadd float %29, %30
  %32 = fmul float %31, %31
  %33 = tail call spir_func float @__hsail_nfma_f32(float %32, float 0x3E66376980000000, float 0xBEBBBD41C0000000) nounwind readnone
  %34 = tail call spir_func float @__hsail_nfma_f32(float %32, float %33, float 0x3F11566AA0000000) nounwind readnone
  %35 = tail call spir_func float @__hsail_nfma_f32(float %32, float %34, float 0xBF66C16C20000000) nounwind readnone
  %36 = tail call spir_func float @__hsail_nfma_f32(float %32, float %35, float 0x3FC5555560000000) nounwind readnone
  %37 = fsub float -0.000000e+00, %36
  %38 = tail call spir_func float @__hsail_nfma_f32(float %32, float %37, float %31) nounwind readnone
  %39 = fsub float -0.000000e+00, %30
  %40 = fmul float %31, %38
  %41 = fsub float 2.000000e+00, %38
  %42 = fdiv float %40, %41, !fpmath !7
  %43 = fsub float %39, %42
  %44 = fsub float %43, %29
  %45 = fsub float 1.000000e+00, %44
  %46 = bitcast float %45 to i32
  %47 = shl i32 %27, 23
  %48 = add nsw i32 %46, %47
  %49 = bitcast i32 %48 to float
  %50 = fcmp olt float %23, 0xC055D589E0000000
  %51 = select i1 %50, float 0.000000e+00, float %49
  %52 = fcmp olt float %23, 0x40562E4300000000
  %53 = select i1 %52, float %51, float 0x7FF0000000000000
  %54 = fcmp uno float %23, 0.000000e+00
  %55 = select i1 %54, float %23, float %53
  %56 = fsub float -0.000000e+00, %12
  %57 = tail call float @llvm.fmuladd.f32(float %10, float %55, float %56)
  %58 = fcmp ogt float %57, 0.000000e+00
  %59 = select i1 %58, float %57, float 0.000000e+00
  %60 = getelementptr inbounds <4 x float> addrspace(3)* %callA, i64 %2
  %61 = load <4 x float> addrspace(3)* %60, align 16
  %62 = insertelement <4 x float> %61, float %59, i32 0
  store <4 x float> %62, <4 x float> addrspace(3)* %60, align 16
  %63 = fcmp olt float %7, 0.000000e+00
  %64 = select i1 %63, float -5.000000e-01, float 5.000000e-01
  %65 = tail call spir_func float @__hsail_nfma_f32(float %7, float 0x3FF7154760000000, float %64) nounwind readnone
  %66 = fptosi float %65 to i32
  %67 = sitofp i32 %66 to float
  %68 = tail call spir_func float @__hsail_nfma_f32(float %67, float 0xBFE62E3000000000, float %7) nounwind readnone
  %69 = fmul float %67, 0xBEE2FEFA20000000
  %70 = fadd float %68, %69
  %71 = fmul float %70, %70
  %72 = tail call spir_func float @__hsail_nfma_f32(float %71, float 0x3E66376980000000, float 0xBEBBBD41C0000000) nounwind readnone
  %73 = tail call spir_func float @__hsail_nfma_f32(float %71, float %72, float 0x3F11566AA0000000) nounwind readnone
  %74 = tail call spir_func float @__hsail_nfma_f32(float %71, float %73, float 0xBF66C16C20000000) nounwind readnone
  %75 = tail call spir_func float @__hsail_nfma_f32(float %71, float %74, float 0x3FC5555560000000) nounwind readnone
  %76 = fsub float -0.000000e+00, %75
  %77 = tail call spir_func float @__hsail_nfma_f32(float %71, float %76, float %70) nounwind readnone
  %78 = fsub float -0.000000e+00, %69
  %79 = fmul float %70, %77
  %80 = fsub float 2.000000e+00, %77
  %81 = fdiv float %79, %80, !fpmath !7
  %82 = fsub float %78, %81
  %83 = fsub float %82, %68
  %84 = fsub float 1.000000e+00, %83
  %85 = bitcast float %84 to i32
  %86 = shl i32 %66, 23
  %87 = add nsw i32 %85, %86
  %88 = bitcast i32 %87 to float
  %89 = fcmp olt float %7, 0xC055D589E0000000
  %90 = select i1 %89, float 0.000000e+00, float %88
  %91 = fcmp olt float %7, 0x40562E4300000000
  %92 = select i1 %91, float %90, float 0x7FF0000000000000
  %93 = fcmp uno float %7, 0.000000e+00
  %94 = select i1 %93, float %7, float %92
  %95 = getelementptr inbounds <4 x float> addrspace(1)* %output, i64 %4
  %96 = load <4 x float> addrspace(1)* %95, align 16
  %97 = insertelement <4 x float> %96, float %94, i32 0
  store <4 x float> %97, <4 x float> addrspace(1)* %95, align 16
  ret void
}

declare float @llvm.fmuladd.f32(float, float, float) nounwind readnone

declare spir_func float @__hsail_nsqrt_f32(float) nounwind readnone

declare spir_func float @__hsail_nfma_f32(float, float, float) nounwind readnone

declare spir_func i32 @__hsail_get_local_id(i32) nounwind readnone

declare spir_func i32 @__hsail_get_group_id(i32) nounwind readnone

!opencl.kernels = !{!0}
!opencl.enable.FP_CONTRACT = !{}
!opencl.ocl.version = !{!6}
!opencl.spir.version = !{!6}

!0 = metadata !{void (i64, i64, i64, i8 addrspace(1)*, i64, i64, i32, <4 x float> addrspace(1)*, <4 x float> addrspace(1)*, <4 x float> addrspace(3)*, <4 x float> addrspace(3)*)* @__OpenCL_binomial_options_kernel, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 1, i32 1, i32 3, i32 3}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"size_t", metadata !"size_t", metadata !"size_t", metadata !"size_t", metadata !"size_t", metadata !"size_t", metadata !"int", metadata !"float4*", metadata !"float4*", metadata !"float4*", metadata !"float4*"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"const", metadata !"", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_base_type", metadata !"int", metadata !"float4*", metadata !"float4*", metadata !"float4*", metadata !"float4*"}
!6 = metadata !{i32 2, i32 0}
!7 = metadata !{float 2.500000e+00}
