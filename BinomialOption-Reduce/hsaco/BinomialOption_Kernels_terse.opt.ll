; ModuleID = '/tmp/cloc-tmp-11661/BinomialOption_Kernels_terse.opt.bc'
source_filename = "llvm-link"
target datalayout = "e-p:32:32-p1:64:64-p2:64:64-p3:32:32-p4:64:64-p5:32:32-p24:64:64-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64"
target triple = "amdgcn--amdhsa"

; Function Attrs: nounwind
define void @binomial_options(i32, <4 x float> addrspace(1)* nocapture readonly, <4 x float> addrspace(1)* nocapture, <4 x float> addrspace(3)* nocapture, <4 x float> addrspace(3)* nocapture readnone) #0 {
  %x.i.i = tail call i32 @llvm.amdgcn.workitem.id.x() #2, !range !7
  %x.i.i1 = tail call i32 @llvm.amdgcn.workgroup.id.x() #2
  %6 = sext i32 %x.i.i1 to i64
  %7 = getelementptr inbounds <4 x float>, <4 x float> addrspace(1)* %1, i64 %6
  %8 = load <4 x float>, <4 x float> addrspace(1)* %7, align 16
  %9 = extractelement <4 x float> %8, i32 0
  %10 = fsub float 1.000000e+00, %9
  %11 = fmul float %9, 3.000000e+01
  %12 = tail call float @llvm.fmuladd.f32(float %10, float 5.000000e+00, float %11)
  %13 = fmul float %9, 1.000000e+02
  %14 = tail call float @llvm.fmuladd.f32(float %10, float 1.000000e+00, float %13)
  %15 = fmul float %9, 1.000000e+01
  %16 = tail call float @llvm.fmuladd.f32(float %10, float 2.500000e-01, float %15)
  %17 = sitofp i32 %0 to float
  %18 = fdiv float 1.000000e+00, %17, !fpmath !8
  %19 = fmul float %18, %16
  %20 = fcmp olt float %19, 0.000000e+00
  %21 = tail call float @llvm.sqrt.f32(float %19) #3
  %.op = fmul float %21, 0x3FD3333340000000
  %22 = select i1 %20, float 0x7FF8000000000000, float %.op
  %23 = uitofp i32 %x.i.i to float
  %24 = fsub float -0.000000e+00, %17
  %25 = tail call float @llvm.fmuladd.f32(float 2.000000e+00, float %23, float %24)
  %26 = fmul float %25, %22
  %27 = fcmp olt float %26, 0.000000e+00
  %28 = select i1 %27, float -5.000000e-01, float 5.000000e-01
  %29 = tail call float @llvm.fmuladd.f32(float %26, float 0x3FF7154760000000, float %28) #2
  %30 = fptosi float %29 to i32
  %31 = sitofp i32 %30 to float
  %32 = tail call float @llvm.fmuladd.f32(float %31, float 0xBFE62E3000000000, float %26) #2
  %33 = fmul float %31, 0xBEE2FEFA20000000
  %34 = fadd float %32, %33
  %35 = fmul float %34, %34
  %36 = tail call float @llvm.fmuladd.f32(float %35, float 0x3E66376980000000, float 0xBEBBBD41C0000000) #2
  %37 = tail call float @llvm.fmuladd.f32(float %35, float %36, float 0x3F11566AA0000000) #2
  %38 = tail call float @llvm.fmuladd.f32(float %35, float %37, float 0xBF66C16C20000000) #2
  %39 = tail call float @llvm.fmuladd.f32(float %35, float %38, float 0x3FC5555560000000) #2
  %40 = fsub float -0.000000e+00, %39
  %41 = tail call float @llvm.fmuladd.f32(float %35, float %40, float %34) #2
  %42 = fsub float -0.000000e+00, %33
  %43 = fmul float %34, %41
  %44 = fsub float 2.000000e+00, %41
  %45 = fdiv float %43, %44, !fpmath !8
  %46 = fsub float %42, %45
  %47 = fsub float %46, %32
  %48 = fsub float 1.000000e+00, %47
  %49 = bitcast float %48 to i32
  %50 = shl i32 %30, 23
  %51 = add nsw i32 %49, %50
  %52 = bitcast i32 %51 to float
  %53 = fcmp olt float %26, 0xC055D589E0000000
  %54 = select i1 %53, float 0.000000e+00, float %52
  %55 = fcmp olt float %26, 0x40562E4300000000
  %56 = select i1 %55, float %54, float 0x7FF0000000000000
  %57 = fcmp uno float %26, 0.000000e+00
  %58 = select i1 %57, float %26, float %56
  %59 = fsub float -0.000000e+00, %14
  %60 = tail call float @llvm.fmuladd.f32(float %12, float %58, float %59)
  %61 = fcmp ogt float %60, 0.000000e+00
  %62 = select i1 %61, float %60, float 0.000000e+00
  %63 = getelementptr inbounds <4 x float>, <4 x float> addrspace(3)* %3, i32 %x.i.i
  %64 = load <4 x float>, <4 x float> addrspace(3)* %63, align 16
  %65 = insertelement <4 x float> %64, float %62, i32 0
  store <4 x float> %65, <4 x float> addrspace(3)* %63, align 16
  %66 = fcmp olt float %9, 0.000000e+00
  %67 = select i1 %66, float -5.000000e-01, float 5.000000e-01
  %68 = tail call float @llvm.fmuladd.f32(float %9, float 0x3FF7154760000000, float %67) #2
  %69 = fptosi float %68 to i32
  %70 = sitofp i32 %69 to float
  %71 = tail call float @llvm.fmuladd.f32(float %70, float 0xBFE62E3000000000, float %9) #2
  %72 = fmul float %70, 0xBEE2FEFA20000000
  %73 = fadd float %71, %72
  %74 = fmul float %73, %73
  %75 = tail call float @llvm.fmuladd.f32(float %74, float 0x3E66376980000000, float 0xBEBBBD41C0000000) #2
  %76 = tail call float @llvm.fmuladd.f32(float %74, float %75, float 0x3F11566AA0000000) #2
  %77 = tail call float @llvm.fmuladd.f32(float %74, float %76, float 0xBF66C16C20000000) #2
  %78 = tail call float @llvm.fmuladd.f32(float %74, float %77, float 0x3FC5555560000000) #2
  %79 = fsub float -0.000000e+00, %78
  %80 = tail call float @llvm.fmuladd.f32(float %74, float %79, float %73) #2
  %81 = fsub float -0.000000e+00, %72
  %82 = fmul float %73, %80
  %83 = fsub float 2.000000e+00, %80
  %84 = fdiv float %82, %83, !fpmath !8
  %85 = fsub float %81, %84
  %86 = fsub float %85, %71
  %87 = fsub float 1.000000e+00, %86
  %88 = bitcast float %87 to i32
  %89 = shl i32 %69, 23
  %90 = add nsw i32 %88, %89
  %91 = bitcast i32 %90 to float
  %92 = fcmp olt float %9, 0xC055D589E0000000
  %93 = select i1 %92, float 0.000000e+00, float %91
  %94 = fcmp olt float %9, 0x40562E4300000000
  %95 = select i1 %94, float %93, float 0x7FF0000000000000
  %96 = fcmp uno float %9, 0.000000e+00
  %97 = select i1 %96, float %9, float %95
  %98 = getelementptr inbounds <4 x float>, <4 x float> addrspace(1)* %2, i64 %6
  %99 = load <4 x float>, <4 x float> addrspace(1)* %98, align 16
  %100 = insertelement <4 x float> %99, float %97, i32 0
  store <4 x float> %100, <4 x float> addrspace(1)* %98, align 16
  ret void
}

; Function Attrs: nounwind readnone
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: nounwind readnone
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nounwind readnone
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: nounwind readnone
declare float @llvm.sqrt.f32(float) #1

attributes #0 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="carrizo" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }
attributes #3 = { nobuiltin nounwind }

!opencl.kernels = !{!0}
!llvm.ident = !{!6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6}

!0 = !{void (i32, <4 x float> addrspace(1)*, <4 x float> addrspace(1)*, <4 x float> addrspace(3)*, <4 x float> addrspace(3)*)* @binomial_options, !1, !2, !3, !4, !5}
!1 = !{!"kernel_arg_addr_space", i32 0, i32 1, i32 1, i32 3, i32 3}
!2 = !{!"kernel_arg_access_qual", !"none", !"none", !"none", !"none", !"none"}
!3 = !{!"kernel_arg_type", !"int", !"float4*", !"float4*", !"float4*", !"float4*"}
!4 = !{!"kernel_arg_base_type", !"int", !"float __attribute__((ext_vector_type(4)))*", !"float __attribute__((ext_vector_type(4)))*", !"float __attribute__((ext_vector_type(4)))*", !"float __attribute__((ext_vector_type(4)))*"}
!5 = !{!"kernel_arg_type_qual", !"", !"const", !"", !"", !""}
!6 = !{!"clang version 3.9.0 "}
!7 = !{i32 0, i32 2048}
!8 = !{float 2.500000e+00}
