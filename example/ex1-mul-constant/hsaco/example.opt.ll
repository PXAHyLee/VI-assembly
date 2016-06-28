; ModuleID = '/tmp/cloc-tmp-21967/example.opt.bc'
source_filename = "llvm-link"
target datalayout = "e-p:32:32-p1:64:64-p2:64:64-p3:32:32-p4:64:64-p5:32:32-p24:64:64-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64"
target triple = "amdgcn--amdhsa"

; Function Attrs: nounwind
define void @example(<4 x float> addrspace(1)* nocapture readonly, <4 x float> addrspace(1)* nocapture) #0 {
  %x.i.i.i = tail call i32 @llvm.amdgcn.workgroup.id.x() #2
  %dispatch_ptr.i7.i = tail call noalias nonnull dereferenceable(64) i8 addrspace(2)* @llvm.amdgcn.dispatch.ptr() #2
  %size_xy_ptr.i8.i = getelementptr inbounds i8, i8 addrspace(2)* %dispatch_ptr.i7.i, i64 4
  %3 = bitcast i8 addrspace(2)* %size_xy_ptr.i8.i to i32 addrspace(2)*
  %size_xy.i9.i = load i32, i32 addrspace(2)* %3, align 4, !invariant.load !7
  %4 = and i32 %size_xy.i9.i, 65535
  %5 = mul i32 %4, %x.i.i.i
  %x.i.i1.i = tail call i32 @llvm.amdgcn.workitem.id.x() #2, !range !8
  %6 = add i32 %5, %x.i.i1.i
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds <4 x float>, <4 x float> addrspace(1)* %0, i64 %7
  %9 = load <4 x float>, <4 x float> addrspace(1)* %8, align 16, !tbaa !9
  %10 = fsub <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, %9
  %11 = fmul <4 x float> %9, <float 3.000000e+01, float 3.000000e+01, float 3.000000e+01, float 3.000000e+01>
  %12 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %10, <4 x float> <float 5.000000e+00, float 5.000000e+00, float 5.000000e+00, float 5.000000e+00>, <4 x float> %11)
  %13 = fmul <4 x float> %9, <float 1.000000e+02, float 1.000000e+02, float 1.000000e+02, float 1.000000e+02>
  %14 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %10, <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float> %13)
  %15 = fadd <4 x float> %12, %14
  %16 = getelementptr inbounds <4 x float>, <4 x float> addrspace(1)* %1, i64 %7
  store <4 x float> %15, <4 x float> addrspace(1)* %16, align 16, !tbaa !9
  ret void
}

; Function Attrs: nounwind readnone
declare <4 x float> @llvm.fmuladd.v4f32(<4 x float>, <4 x float>, <4 x float>) #1

; Function Attrs: nounwind readnone
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nounwind readnone
declare i8 addrspace(2)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: nounwind readnone
declare i32 @llvm.amdgcn.workitem.id.x() #1

attributes #0 = { nounwind "amdgpu-dispatch-ptr" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="carrizo" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }

!opencl.kernels = !{!0}
!llvm.ident = !{!6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6, !6}

!0 = !{void (<4 x float> addrspace(1)*, <4 x float> addrspace(1)*)* @example, !1, !2, !3, !4, !5}
!1 = !{!"kernel_arg_addr_space", i32 1, i32 1}
!2 = !{!"kernel_arg_access_qual", !"none", !"none"}
!3 = !{!"kernel_arg_type", !"float4*", !"float4*"}
!4 = !{!"kernel_arg_base_type", !"float __attribute__((ext_vector_type(4)))*", !"float __attribute__((ext_vector_type(4)))*"}
!5 = !{!"kernel_arg_type_qual", !"const", !""}
!6 = !{!"clang version 3.9.0 "}
!7 = !{}
!8 = !{i32 0, i32 2048}
!9 = !{!10, !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
