; ModuleID = 'BinomialOption_Kernels.cl'
source_filename = "BinomialOption_Kernels.cl"
target datalayout = "e-p:32:32-p1:64:64-p2:64:64-p3:32:32-p4:64:64-p5:32:32-p24:64:64-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64"
target triple = "amdgcn--amdhsa"

; Function Attrs: nounwind
define void @binomial_options(i32, <4 x float> addrspace(1)* nocapture readonly, <4 x float> addrspace(1)* nocapture, <4 x float> addrspace(3)* nocapture, <4 x float> addrspace(3)* nocapture) #0 {
  ; %6 = tid
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x() #3, !range !7
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x() #3
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds <4 x float>, <4 x float> addrspace(1)* %1, i64 %8

  ; %10 = inRand
  %10 = load <4 x float>, <4 x float> addrspace(1)* %9, align 16, !tbaa !8

  ; %11 = 1.0f - inRand
  %11 = fsub <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, %10

  ; %12 = inRand * 30.f
  %12 = fmul <4 x float> %10, <float 3.000000e+01, float 3.000000e+01, float 3.000000e+01, float 3.000000e+01>

  ; %13 = float4 s
  %13 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %11, <4 x float> <float 5.000000e+00, float 5.000000e+00, float 5.000000e+00, float 5.000000e+00>, <4 x float> %12)

  ; %14 = inRand * 100.f
  %14 = fmul <4 x float> %10, <float 1.000000e+02, float 1.000000e+02, float 1.000000e+02, float 1.000000e+02>

  ; %15 = float4 x
  %15 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %11, <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float> %14)
  %16 = fmul <4 x float> %10, <float 1.000000e+01, float 1.000000e+01, float 1.000000e+01, float 1.000000e+01>

  ; %17 = optionYears
  %17 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %11, <4 x float> <float 2.500000e-01, float 2.500000e-01, float 2.500000e-01, float 2.500000e-01>, <4 x float> %16)
  %18 = sitofp i32 %0 to float

  ; %19 = (1.f / (float)numSteps)
  %19 = fdiv float 1.000000e+00, %18, !fpmath !11
  %20 = insertelement <4 x float> undef, float %19, i32 0
  %21 = shufflevector <4 x float> %20, <4 x float> undef, <4 x i32> zeroinitializer
  
  ; %22 = dt = optionYears * (1.f / (float)numSteps)
  %22 = fmul <4 x float> %21, %17
  %23 = extractelement <4 x float> %22, i32 0
  %24 = fcmp olt float %23, 0.000000e+00
  %25 = tail call float @llvm.sqrt.f32(float %23) #4

  ; %26 = if dt < 0, then nan else sqrt(dt)
  %26 = select i1 %24, float 0x7FF8000000000000, float %25

  ; %27 = set %26 as the first element of this vector.
  %27 = insertelement <4 x float> undef, float %26, i32 0
  %28 = extractelement <4 x float> %22, i32 1
  %29 = fcmp olt float %28, 0.000000e+00
  %30 = tail call float @llvm.sqrt.f32(float %28) #4
  %31 = select i1 %29, float 0x7FF8000000000000, float %30

  ; %32 = two elements.
  %32 = insertelement <4 x float> %27, float %31, i32 1
  %33 = extractelement <4 x float> %22, i32 2
  %34 = fcmp olt float %33, 0.000000e+00
  %35 = tail call float @llvm.sqrt.f32(float %33) #4
  %36 = select i1 %34, float 0x7FF8000000000000, float %35

  ; third element is put in the first element of %37
  %37 = insertelement <4 x float> undef, float %36, i32 0
  %38 = extractelement <4 x float> %22, i32 3
  %39 = fcmp olt float %38, 0.000000e+00
  %40 = tail call float @llvm.sqrt.f32(float %38) #4
  %41 = select i1 %39, float 0x7FF8000000000000, float %40

  ; %42: <4 x float> with two elements
  %42 = insertelement <4 x float> %37, float %41, i32 1

  ; %43: four element
  %43 = shufflevector <4 x float> %32, <4 x float> %42, <4 x i32> <i32 0, i32 1, i32 4, i32 5>

  ; %44 = vsdt
  %44 = fmul <4 x float> %43, <float 0x3FD3333340000000, float 0x3FD3333340000000, float 0x3FD3333340000000, float 0x3FD3333340000000>
  ; %45 = rdt
  %45 = fmul <4 x float> %22, <float 0x3F947AE140000000, float 0x3F947AE140000000, float 0x3F947AE140000000, float 0x3F947AE140000000>
  %46 = extractelement <4 x float> %45, i32 0
  %47 = fcmp olt float %46, 0.000000e+00
  %48 = select i1 %47, float -5.000000e-01, float 5.000000e-01
  %49 = tail call float @llvm.fmuladd.f32(float %46, float 0x3FF7154760000000, float %48) #3
  %50 = fptosi float %49 to i32
  %51 = sitofp i32 %50 to float
  %52 = tail call float @llvm.fmuladd.f32(float %51, float 0xBFE62E3000000000, float %46) #3
  %53 = fmul float %51, 0xBEE2FEFA20000000
  %54 = fadd float %52, %53
  %55 = fmul float %54, %54
  %56 = tail call float @llvm.fmuladd.f32(float %55, float 0x3E66376980000000, float 0xBEBBBD41C0000000) #3
  %57 = tail call float @llvm.fmuladd.f32(float %55, float %56, float 0x3F11566AA0000000) #3
  %58 = tail call float @llvm.fmuladd.f32(float %55, float %57, float 0xBF66C16C20000000) #3
  %59 = tail call float @llvm.fmuladd.f32(float %55, float %58, float 0x3FC5555560000000) #3
  %60 = fsub float -0.000000e+00, %59
  %61 = tail call float @llvm.fmuladd.f32(float %55, float %60, float %54) #3
  %62 = fsub float -0.000000e+00, %53
  %63 = fmul float %54, %61
  %64 = fsub float 2.000000e+00, %61
  %65 = fdiv float %63, %64, !fpmath !11
  %66 = fsub float %62, %65
  %67 = fsub float %66, %52
  %68 = fsub float 1.000000e+00, %67
  %69 = bitcast float %68 to i32
  %70 = shl i32 %50, 23
  %71 = add nsw i32 %69, %70
  %72 = bitcast i32 %71 to float
  %73 = fcmp olt float %46, 0xC055D589E0000000
  %74 = select i1 %73, float 0.000000e+00, float %72
  %75 = fcmp olt float %46, 0x40562E4300000000
  %76 = select i1 %75, float %74, float 0x7FF0000000000000
  %77 = fcmp uno float %46, 0.000000e+00
  %78 = select i1 %77, float %46, float %76

  ; %79 = first element of r
  %79 = insertelement <4 x float> undef, float %78, i32 0
  %80 = extractelement <4 x float> %45, i32 1
  %81 = fcmp olt float %80, 0.000000e+00
  %82 = select i1 %81, float -5.000000e-01, float 5.000000e-01
  %83 = tail call float @llvm.fmuladd.f32(float %80, float 0x3FF7154760000000, float %82) #3
  %84 = fptosi float %83 to i32
  %85 = sitofp i32 %84 to float
  %86 = tail call float @llvm.fmuladd.f32(float %85, float 0xBFE62E3000000000, float %80) #3
  %87 = fmul float %85, 0xBEE2FEFA20000000
  %88 = fadd float %86, %87
  %89 = fmul float %88, %88
  %90 = tail call float @llvm.fmuladd.f32(float %89, float 0x3E66376980000000, float 0xBEBBBD41C0000000) #3
  %91 = tail call float @llvm.fmuladd.f32(float %89, float %90, float 0x3F11566AA0000000) #3
  %92 = tail call float @llvm.fmuladd.f32(float %89, float %91, float 0xBF66C16C20000000) #3
  %93 = tail call float @llvm.fmuladd.f32(float %89, float %92, float 0x3FC5555560000000) #3
  %94 = fsub float -0.000000e+00, %93
  %95 = tail call float @llvm.fmuladd.f32(float %89, float %94, float %88) #3
  %96 = fsub float -0.000000e+00, %87
  %97 = fmul float %88, %95
  %98 = fsub float 2.000000e+00, %95
  %99 = fdiv float %97, %98, !fpmath !11
  %100 = fsub float %96, %99
  %101 = fsub float %100, %86
  %102 = fsub float 1.000000e+00, %101
  %103 = bitcast float %102 to i32
  %104 = shl i32 %84, 23
  %105 = add nsw i32 %103, %104
  %106 = bitcast i32 %105 to float
  %107 = fcmp olt float %80, 0xC055D589E0000000
  %108 = select i1 %107, float 0.000000e+00, float %106
  %109 = fcmp olt float %80, 0x40562E4300000000
  %110 = select i1 %109, float %108, float 0x7FF0000000000000
  %111 = fcmp uno float %80, 0.000000e+00
  %112 = select i1 %111, float %80, float %110

  ; %113 = two elements of r
  %113 = insertelement <4 x float> %79, float %112, i32 1
  %114 = extractelement <4 x float> %45, i32 2
  %115 = fcmp olt float %114, 0.000000e+00
  %116 = select i1 %115, float -5.000000e-01, float 5.000000e-01
  %117 = tail call float @llvm.fmuladd.f32(float %114, float 0x3FF7154760000000, float %116) #3
  %118 = fptosi float %117 to i32
  %119 = sitofp i32 %118 to float
  %120 = tail call float @llvm.fmuladd.f32(float %119, float 0xBFE62E3000000000, float %114) #3
  %121 = fmul float %119, 0xBEE2FEFA20000000
  %122 = fadd float %120, %121
  %123 = fmul float %122, %122
  %124 = tail call float @llvm.fmuladd.f32(float %123, float 0x3E66376980000000, float 0xBEBBBD41C0000000) #3
  %125 = tail call float @llvm.fmuladd.f32(float %123, float %124, float 0x3F11566AA0000000) #3
  %126 = tail call float @llvm.fmuladd.f32(float %123, float %125, float 0xBF66C16C20000000) #3
  %127 = tail call float @llvm.fmuladd.f32(float %123, float %126, float 0x3FC5555560000000) #3
  %128 = fsub float -0.000000e+00, %127
  %129 = tail call float @llvm.fmuladd.f32(float %123, float %128, float %122) #3
  %130 = fsub float -0.000000e+00, %121
  %131 = fmul float %122, %129
  %132 = fsub float 2.000000e+00, %129
  %133 = fdiv float %131, %132, !fpmath !11
  %134 = fsub float %130, %133
  %135 = fsub float %134, %120
  %136 = fsub float 1.000000e+00, %135
  %137 = bitcast float %136 to i32
  %138 = shl i32 %118, 23
  %139 = add nsw i32 %137, %138
  %140 = bitcast i32 %139 to float
  %141 = fcmp olt float %114, 0xC055D589E0000000
  %142 = select i1 %141, float 0.000000e+00, float %140
  %143 = fcmp olt float %114, 0x40562E4300000000
  %144 = select i1 %143, float %142, float 0x7FF0000000000000
  %145 = fcmp uno float %114, 0.000000e+00
  %146 = select i1 %145, float %114, float %144

  ; %147 = third element of r
  %147 = insertelement <4 x float> undef, float %146, i32 0
  %148 = extractelement <4 x float> %45, i32 3
  %149 = fcmp olt float %148, 0.000000e+00
  %150 = select i1 %149, float -5.000000e-01, float 5.000000e-01
  %151 = tail call float @llvm.fmuladd.f32(float %148, float 0x3FF7154760000000, float %150) #3
  %152 = fptosi float %151 to i32
  %153 = sitofp i32 %152 to float
  %154 = tail call float @llvm.fmuladd.f32(float %153, float 0xBFE62E3000000000, float %148) #3
  %155 = fmul float %153, 0xBEE2FEFA20000000
  %156 = fadd float %154, %155
  %157 = fmul float %156, %156
  %158 = tail call float @llvm.fmuladd.f32(float %157, float 0x3E66376980000000, float 0xBEBBBD41C0000000) #3
  %159 = tail call float @llvm.fmuladd.f32(float %157, float %158, float 0x3F11566AA0000000) #3
  %160 = tail call float @llvm.fmuladd.f32(float %157, float %159, float 0xBF66C16C20000000) #3
  %161 = tail call float @llvm.fmuladd.f32(float %157, float %160, float 0x3FC5555560000000) #3
  %162 = fsub float -0.000000e+00, %161
  %163 = tail call float @llvm.fmuladd.f32(float %157, float %162, float %156) #3
  %164 = fsub float -0.000000e+00, %155
  %165 = fmul float %156, %163
  %166 = fsub float 2.000000e+00, %163
  %167 = fdiv float %165, %166, !fpmath !11
  %168 = fsub float %164, %167
  %169 = fsub float %168, %154
  %170 = fsub float 1.000000e+00, %169
  %171 = bitcast float %170 to i32
  %172 = shl i32 %152, 23
  %173 = add nsw i32 %171, %172
  %174 = bitcast i32 %173 to float
  %175 = fcmp olt float %148, 0xC055D589E0000000
  %176 = select i1 %175, float 0.000000e+00, float %174
  %177 = fcmp olt float %148, 0x40562E4300000000
  %178 = select i1 %177, float %176, float 0x7FF0000000000000
  %179 = fcmp uno float %148, 0.000000e+00
  %180 = select i1 %179, float %148, float %178

  ; %181 = third, fourth element of r
  %181 = insertelement <4 x float> %147, float %180, i32 1

  ; %182 = r
  %182 = shufflevector <4 x float> %113, <4 x float> %181, <4 x i32> <i32 0, i32 1, i32 4, i32 5>
  
  ; %183 = rInv
  %183 = fdiv <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, %182, !fpmath !11
  %184 = extractelement <4 x float> %44, i32 0
  %185 = fcmp olt float %184, 0.000000e+00
  %186 = select i1 %185, float -5.000000e-01, float 5.000000e-01
  %187 = tail call float @llvm.fmuladd.f32(float %184, float 0x3FF7154760000000, float %186) #3
  %188 = fptosi float %187 to i32
  %189 = sitofp i32 %188 to float
  %190 = tail call float @llvm.fmuladd.f32(float %189, float 0xBFE62E3000000000, float %184) #3
  %191 = fmul float %189, 0xBEE2FEFA20000000
  %192 = fadd float %190, %191
  %193 = fmul float %192, %192
  %194 = tail call float @llvm.fmuladd.f32(float %193, float 0x3E66376980000000, float 0xBEBBBD41C0000000) #3
  %195 = tail call float @llvm.fmuladd.f32(float %193, float %194, float 0x3F11566AA0000000) #3
  %196 = tail call float @llvm.fmuladd.f32(float %193, float %195, float 0xBF66C16C20000000) #3
  %197 = tail call float @llvm.fmuladd.f32(float %193, float %196, float 0x3FC5555560000000) #3
  %198 = fsub float -0.000000e+00, %197
  %199 = tail call float @llvm.fmuladd.f32(float %193, float %198, float %192) #3
  %200 = fsub float -0.000000e+00, %191
  %201 = fmul float %192, %199
  %202 = fsub float 2.000000e+00, %199
  %203 = fdiv float %201, %202, !fpmath !11
  %204 = fsub float %200, %203
  %205 = fsub float %204, %190
  %206 = fsub float 1.000000e+00, %205
  %207 = bitcast float %206 to i32
  %208 = shl i32 %188, 23
  %209 = add nsw i32 %207, %208
  %210 = bitcast i32 %209 to float
  %211 = fcmp olt float %184, 0xC055D589E0000000
  %212 = select i1 %211, float 0.000000e+00, float %210
  %213 = fcmp olt float %184, 0x40562E4300000000
  %214 = select i1 %213, float %212, float 0x7FF0000000000000
  %215 = fcmp uno float %184, 0.000000e+00
  %216 = select i1 %215, float %184, float %214
  %217 = insertelement <4 x float> undef, float %216, i32 0
  %218 = extractelement <4 x float> %44, i32 1
  %219 = fcmp olt float %218, 0.000000e+00
  %220 = select i1 %219, float -5.000000e-01, float 5.000000e-01
  %221 = tail call float @llvm.fmuladd.f32(float %218, float 0x3FF7154760000000, float %220) #3
  %222 = fptosi float %221 to i32
  %223 = sitofp i32 %222 to float
  %224 = tail call float @llvm.fmuladd.f32(float %223, float 0xBFE62E3000000000, float %218) #3
  %225 = fmul float %223, 0xBEE2FEFA20000000
  %226 = fadd float %224, %225
  %227 = fmul float %226, %226
  %228 = tail call float @llvm.fmuladd.f32(float %227, float 0x3E66376980000000, float 0xBEBBBD41C0000000) #3
  %229 = tail call float @llvm.fmuladd.f32(float %227, float %228, float 0x3F11566AA0000000) #3
  %230 = tail call float @llvm.fmuladd.f32(float %227, float %229, float 0xBF66C16C20000000) #3
  %231 = tail call float @llvm.fmuladd.f32(float %227, float %230, float 0x3FC5555560000000) #3
  %232 = fsub float -0.000000e+00, %231
  %233 = tail call float @llvm.fmuladd.f32(float %227, float %232, float %226) #3
  %234 = fsub float -0.000000e+00, %225
  %235 = fmul float %226, %233
  %236 = fsub float 2.000000e+00, %233
  %237 = fdiv float %235, %236, !fpmath !11
  %238 = fsub float %234, %237
  %239 = fsub float %238, %224
  %240 = fsub float 1.000000e+00, %239
  %241 = bitcast float %240 to i32
  %242 = shl i32 %222, 23
  %243 = add nsw i32 %241, %242
  %244 = bitcast i32 %243 to float
  %245 = fcmp olt float %218, 0xC055D589E0000000
  %246 = select i1 %245, float 0.000000e+00, float %244
  %247 = fcmp olt float %218, 0x40562E4300000000
  %248 = select i1 %247, float %246, float 0x7FF0000000000000
  %249 = fcmp uno float %218, 0.000000e+00
  %250 = select i1 %249, float %218, float %248
  %251 = insertelement <4 x float> %217, float %250, i32 1
  %252 = extractelement <4 x float> %44, i32 2
  %253 = fcmp olt float %252, 0.000000e+00
  %254 = select i1 %253, float -5.000000e-01, float 5.000000e-01
  %255 = tail call float @llvm.fmuladd.f32(float %252, float 0x3FF7154760000000, float %254) #3
  %256 = fptosi float %255 to i32
  %257 = sitofp i32 %256 to float
  %258 = tail call float @llvm.fmuladd.f32(float %257, float 0xBFE62E3000000000, float %252) #3
  %259 = fmul float %257, 0xBEE2FEFA20000000
  %260 = fadd float %258, %259
  %261 = fmul float %260, %260
  %262 = tail call float @llvm.fmuladd.f32(float %261, float 0x3E66376980000000, float 0xBEBBBD41C0000000) #3
  %263 = tail call float @llvm.fmuladd.f32(float %261, float %262, float 0x3F11566AA0000000) #3
  %264 = tail call float @llvm.fmuladd.f32(float %261, float %263, float 0xBF66C16C20000000) #3
  %265 = tail call float @llvm.fmuladd.f32(float %261, float %264, float 0x3FC5555560000000) #3
  %266 = fsub float -0.000000e+00, %265
  %267 = tail call float @llvm.fmuladd.f32(float %261, float %266, float %260) #3
  %268 = fsub float -0.000000e+00, %259
  %269 = fmul float %260, %267
  %270 = fsub float 2.000000e+00, %267
  %271 = fdiv float %269, %270, !fpmath !11
  %272 = fsub float %268, %271
  %273 = fsub float %272, %258
  %274 = fsub float 1.000000e+00, %273
  %275 = bitcast float %274 to i32
  %276 = shl i32 %256, 23
  %277 = add nsw i32 %275, %276
  %278 = bitcast i32 %277 to float
  %279 = fcmp olt float %252, 0xC055D589E0000000
  %280 = select i1 %279, float 0.000000e+00, float %278
  %281 = fcmp olt float %252, 0x40562E4300000000
  %282 = select i1 %281, float %280, float 0x7FF0000000000000
  %283 = fcmp uno float %252, 0.000000e+00
  %284 = select i1 %283, float %252, float %282
  %285 = insertelement <4 x float> undef, float %284, i32 0
  %286 = extractelement <4 x float> %44, i32 3
  %287 = fcmp olt float %286, 0.000000e+00
  %288 = select i1 %287, float -5.000000e-01, float 5.000000e-01
  %289 = tail call float @llvm.fmuladd.f32(float %286, float 0x3FF7154760000000, float %288) #3
  %290 = fptosi float %289 to i32
  %291 = sitofp i32 %290 to float
  %292 = tail call float @llvm.fmuladd.f32(float %291, float 0xBFE62E3000000000, float %286) #3
  %293 = fmul float %291, 0xBEE2FEFA20000000
  %294 = fadd float %292, %293
  %295 = fmul float %294, %294
  %296 = tail call float @llvm.fmuladd.f32(float %295, float 0x3E66376980000000, float 0xBEBBBD41C0000000) #3
  %297 = tail call float @llvm.fmuladd.f32(float %295, float %296, float 0x3F11566AA0000000) #3
  %298 = tail call float @llvm.fmuladd.f32(float %295, float %297, float 0xBF66C16C20000000) #3
  %299 = tail call float @llvm.fmuladd.f32(float %295, float %298, float 0x3FC5555560000000) #3
  %300 = fsub float -0.000000e+00, %299
  %301 = tail call float @llvm.fmuladd.f32(float %295, float %300, float %294) #3
  %302 = fsub float -0.000000e+00, %293
  %303 = fmul float %294, %301
  %304 = fsub float 2.000000e+00, %301
  %305 = fdiv float %303, %304, !fpmath !11
  %306 = fsub float %302, %305
  %307 = fsub float %306, %292
  %308 = fsub float 1.000000e+00, %307
  %309 = bitcast float %308 to i32
  %310 = shl i32 %290, 23
  %311 = add nsw i32 %309, %310
  %312 = bitcast i32 %311 to float
  %313 = fcmp olt float %286, 0xC055D589E0000000
  %314 = select i1 %313, float 0.000000e+00, float %312
  %315 = fcmp olt float %286, 0x40562E4300000000
  %316 = select i1 %315, float %314, float 0x7FF0000000000000
  %317 = fcmp uno float %286, 0.000000e+00
  %318 = select i1 %317, float %286, float %316
  %319 = insertelement <4 x float> %285, float %318, i32 1

  ; %320 = u
  %320 = shufflevector <4 x float> %251, <4 x float> %319, <4 x i32> <i32 0, i32 1, i32 4, i32 5>

  ; %321 = d
  %321 = fdiv <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, %320, !fpmath !11
  %322 = fsub <4 x float> %182, %321
  %323 = fsub <4 x float> %320, %321

  ; %324 = pu
  %324 = fdiv <4 x float> %322, %323, !fpmath !11

  ; %325 = pd
  %325 = fsub <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, %324

  ; %326 = puByr
  %326 = fmul <4 x float> %183, %324

  ; %327 = pdByr
  %327 = fmul <4 x float> %183, %325

  %328 = uitofp i32 %6 to float
  %329 = fsub float -0.000000e+00, %18
  %330 = tail call float @llvm.fmuladd.f32(float 2.000000e+00, float %328, float %329)
  %331 = insertelement <4 x float> undef, float %330, i32 0
  %332 = shufflevector <4 x float> %331, <4 x float> undef, <4 x i32> zeroinitializer
  %333 = fmul <4 x float> %332, %44
  %334 = extractelement <4 x float> %333, i32 0
  %335 = fcmp olt float %334, 0.000000e+00
  %336 = select i1 %335, float -5.000000e-01, float 5.000000e-01
  %337 = tail call float @llvm.fmuladd.f32(float %334, float 0x3FF7154760000000, float %336) #3
  %338 = fptosi float %337 to i32
  %339 = sitofp i32 %338 to float
  %340 = tail call float @llvm.fmuladd.f32(float %339, float 0xBFE62E3000000000, float %334) #3
  %341 = fmul float %339, 0xBEE2FEFA20000000
  %342 = fadd float %340, %341
  %343 = fmul float %342, %342
  %344 = tail call float @llvm.fmuladd.f32(float %343, float 0x3E66376980000000, float 0xBEBBBD41C0000000) #3
  %345 = tail call float @llvm.fmuladd.f32(float %343, float %344, float 0x3F11566AA0000000) #3
  %346 = tail call float @llvm.fmuladd.f32(float %343, float %345, float 0xBF66C16C20000000) #3
  %347 = tail call float @llvm.fmuladd.f32(float %343, float %346, float 0x3FC5555560000000) #3
  %348 = fsub float -0.000000e+00, %347
  %349 = tail call float @llvm.fmuladd.f32(float %343, float %348, float %342) #3
  %350 = fsub float -0.000000e+00, %341
  %351 = fmul float %342, %349
  %352 = fsub float 2.000000e+00, %349
  %353 = fdiv float %351, %352, !fpmath !11
  %354 = fsub float %350, %353
  %355 = fsub float %354, %340
  %356 = fsub float 1.000000e+00, %355
  %357 = bitcast float %356 to i32
  %358 = shl i32 %338, 23
  %359 = add nsw i32 %357, %358
  %360 = bitcast i32 %359 to float
  %361 = fcmp olt float %334, 0xC055D589E0000000
  %362 = select i1 %361, float 0.000000e+00, float %360
  %363 = fcmp olt float %334, 0x40562E4300000000
  %364 = select i1 %363, float %362, float 0x7FF0000000000000
  %365 = fcmp uno float %334, 0.000000e+00
  %366 = select i1 %365, float %334, float %364
  %367 = insertelement <4 x float> undef, float %366, i32 0
  %368 = extractelement <4 x float> %333, i32 1
  %369 = fcmp olt float %368, 0.000000e+00
  %370 = select i1 %369, float -5.000000e-01, float 5.000000e-01
  %371 = tail call float @llvm.fmuladd.f32(float %368, float 0x3FF7154760000000, float %370) #3
  %372 = fptosi float %371 to i32
  %373 = sitofp i32 %372 to float
  %374 = tail call float @llvm.fmuladd.f32(float %373, float 0xBFE62E3000000000, float %368) #3
  %375 = fmul float %373, 0xBEE2FEFA20000000
  %376 = fadd float %374, %375
  %377 = fmul float %376, %376
  %378 = tail call float @llvm.fmuladd.f32(float %377, float 0x3E66376980000000, float 0xBEBBBD41C0000000) #3
  %379 = tail call float @llvm.fmuladd.f32(float %377, float %378, float 0x3F11566AA0000000) #3
  %380 = tail call float @llvm.fmuladd.f32(float %377, float %379, float 0xBF66C16C20000000) #3
  %381 = tail call float @llvm.fmuladd.f32(float %377, float %380, float 0x3FC5555560000000) #3
  %382 = fsub float -0.000000e+00, %381
  %383 = tail call float @llvm.fmuladd.f32(float %377, float %382, float %376) #3
  %384 = fsub float -0.000000e+00, %375
  %385 = fmul float %376, %383
  %386 = fsub float 2.000000e+00, %383
  %387 = fdiv float %385, %386, !fpmath !11
  %388 = fsub float %384, %387
  %389 = fsub float %388, %374
  %390 = fsub float 1.000000e+00, %389
  %391 = bitcast float %390 to i32
  %392 = shl i32 %372, 23
  %393 = add nsw i32 %391, %392
  %394 = bitcast i32 %393 to float
  %395 = fcmp olt float %368, 0xC055D589E0000000
  %396 = select i1 %395, float 0.000000e+00, float %394
  %397 = fcmp olt float %368, 0x40562E4300000000
  %398 = select i1 %397, float %396, float 0x7FF0000000000000
  %399 = fcmp uno float %368, 0.000000e+00
  %400 = select i1 %399, float %368, float %398
  %401 = insertelement <4 x float> %367, float %400, i32 1
  %402 = extractelement <4 x float> %333, i32 2
  %403 = fcmp olt float %402, 0.000000e+00
  %404 = select i1 %403, float -5.000000e-01, float 5.000000e-01
  %405 = tail call float @llvm.fmuladd.f32(float %402, float 0x3FF7154760000000, float %404) #3
  %406 = fptosi float %405 to i32
  %407 = sitofp i32 %406 to float
  %408 = tail call float @llvm.fmuladd.f32(float %407, float 0xBFE62E3000000000, float %402) #3
  %409 = fmul float %407, 0xBEE2FEFA20000000
  %410 = fadd float %408, %409
  %411 = fmul float %410, %410
  %412 = tail call float @llvm.fmuladd.f32(float %411, float 0x3E66376980000000, float 0xBEBBBD41C0000000) #3
  %413 = tail call float @llvm.fmuladd.f32(float %411, float %412, float 0x3F11566AA0000000) #3
  %414 = tail call float @llvm.fmuladd.f32(float %411, float %413, float 0xBF66C16C20000000) #3
  %415 = tail call float @llvm.fmuladd.f32(float %411, float %414, float 0x3FC5555560000000) #3
  %416 = fsub float -0.000000e+00, %415
  %417 = tail call float @llvm.fmuladd.f32(float %411, float %416, float %410) #3
  %418 = fsub float -0.000000e+00, %409
  %419 = fmul float %410, %417
  %420 = fsub float 2.000000e+00, %417
  %421 = fdiv float %419, %420, !fpmath !11
  %422 = fsub float %418, %421
  %423 = fsub float %422, %408
  %424 = fsub float 1.000000e+00, %423
  %425 = bitcast float %424 to i32
  %426 = shl i32 %406, 23
  %427 = add nsw i32 %425, %426
  %428 = bitcast i32 %427 to float
  %429 = fcmp olt float %402, 0xC055D589E0000000
  %430 = select i1 %429, float 0.000000e+00, float %428
  %431 = fcmp olt float %402, 0x40562E4300000000
  %432 = select i1 %431, float %430, float 0x7FF0000000000000
  %433 = fcmp uno float %402, 0.000000e+00
  %434 = select i1 %433, float %402, float %432
  %435 = insertelement <4 x float> undef, float %434, i32 0
  %436 = extractelement <4 x float> %333, i32 3
  %437 = fcmp olt float %436, 0.000000e+00
  %438 = select i1 %437, float -5.000000e-01, float 5.000000e-01
  %439 = tail call float @llvm.fmuladd.f32(float %436, float 0x3FF7154760000000, float %438) #3
  %440 = fptosi float %439 to i32
  %441 = sitofp i32 %440 to float
  %442 = tail call float @llvm.fmuladd.f32(float %441, float 0xBFE62E3000000000, float %436) #3
  %443 = fmul float %441, 0xBEE2FEFA20000000
  %444 = fadd float %442, %443
  %445 = fmul float %444, %444
  %446 = tail call float @llvm.fmuladd.f32(float %445, float 0x3E66376980000000, float 0xBEBBBD41C0000000) #3
  %447 = tail call float @llvm.fmuladd.f32(float %445, float %446, float 0x3F11566AA0000000) #3
  %448 = tail call float @llvm.fmuladd.f32(float %445, float %447, float 0xBF66C16C20000000) #3
  %449 = tail call float @llvm.fmuladd.f32(float %445, float %448, float 0x3FC5555560000000) #3
  %450 = fsub float -0.000000e+00, %449
  %451 = tail call float @llvm.fmuladd.f32(float %445, float %450, float %444) #3
  %452 = fsub float -0.000000e+00, %443
  %453 = fmul float %444, %451
  %454 = fsub float 2.000000e+00, %451
  %455 = fdiv float %453, %454, !fpmath !11
  %456 = fsub float %452, %455
  %457 = fsub float %456, %442
  %458 = fsub float 1.000000e+00, %457
  %459 = bitcast float %458 to i32
  %460 = shl i32 %440, 23
  %461 = add nsw i32 %459, %460
  %462 = bitcast i32 %461 to float
  %463 = fcmp olt float %436, 0xC055D589E0000000
  %464 = select i1 %463, float 0.000000e+00, float %462
  %465 = fcmp olt float %436, 0x40562E4300000000
  %466 = select i1 %465, float %464, float 0x7FF0000000000000
  %467 = fcmp uno float %436, 0.000000e+00
  %468 = select i1 %467, float %436, float %466
  %469 = insertelement <4 x float> %435, float %468, i32 1

  ; %470 = profit
  %470 = shufflevector <4 x float> %401, <4 x float> %469, <4 x i32> <i32 0, i32 1, i32 4, i32 5>
  %471 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %15
  %472 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %13, <4 x float> %470, <4 x float> %471)
  %473 = extractelement <4 x float> %472, i32 0
  %474 = fcmp ogt float %473, 0.000000e+00
  %475 = select i1 %474, float %473, float 0.000000e+00

  ; %476 = &callA[tid]
  %476 = getelementptr inbounds <4 x float>, <4 x float> addrspace(3)* %3, i32 %6
  %477 = insertelement <4 x float> undef, float %475, i32 0
  %478 = extractelement <4 x float> %472, i32 1
  %479 = fcmp ogt float %478, 0.000000e+00
  %480 = select i1 %479, float %478, float 0.000000e+00
  %481 = insertelement <4 x float> %477, float %480, i32 1
  %482 = extractelement <4 x float> %472, i32 2
  %483 = fcmp ogt float %482, 0.000000e+00
  %484 = select i1 %483, float %482, float 0.000000e+00
  %485 = insertelement <4 x float> %481, float %484, i32 2
  %486 = extractelement <4 x float> %472, i32 3
  %487 = fcmp ogt float %486, 0.000000e+00
  %488 = select i1 %487, float %486, float 0.000000e+00
  %489 = insertelement <4 x float> %485, float %488, i32 3
  store <4 x float> %489, <4 x float> addrspace(3)* %476, align 16
  tail call void @llvm.amdgcn.s.barrier() #3
  %490 = icmp sgt i32 %0, 0
  br i1 %490, label %491, label %497

; <label>:491:                                    ; preds = %5
  %492 = add nuw nsw i32 %6, 1
  ; %493 = &callA[tid + 1]
  %493 = getelementptr inbounds <4 x float>, <4 x float> addrspace(3)* %3, i32 %492
  ; %494 = &callB[tid]
  %494 = getelementptr inbounds <4 x float>, <4 x float> addrspace(3)* %4, i32 %6
  ; %495 = &callA[tid + 1]
  %495 = getelementptr inbounds <4 x float>, <4 x float> addrspace(3)* %4, i32 %492
  br label %499

; <label>:496:                                    ; preds = %515
  br label %497

; outside the for loop
; <label>:497:                                    ; preds = %496, %5
  %498 = icmp eq i32 %6, 0
  br i1 %498, label %518, label %521

; <label>:499:                                    ; preds = %491, %515
  ; %500 = loop index j
  %500 = phi i32 [ %0, %491 ], [ %516, %515 ]
  %501 = icmp ult i32 %6, %500
  br i1 %501, label %502, label %507

; <label>:502:                                    ; preds = %499
  ; %503 = callA[tid]
  %503 = load <4 x float>, <4 x float> addrspace(3)* %476, align 16, !tbaa !8
  %504 = load <4 x float>, <4 x float> addrspace(3)* %493, align 16, !tbaa !8
  %505 = fmul <4 x float> %327, %504
  %506 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %326, <4 x float> %503, <4 x float> %505)
  store <4 x float> %506, <4 x float> addrspace(3)* %494, align 16, !tbaa !8
  br label %507

; <label>:507:                                    ; preds = %502, %499
  tail call void @llvm.amdgcn.s.barrier() #3
  %508 = add nsw i32 %500, -1
  %509 = icmp ult i32 %6, %508
  br i1 %509, label %510, label %515

; <label>:510:                                    ; preds = %507
  %511 = load <4 x float>, <4 x float> addrspace(3)* %494, align 16, !tbaa !8
  %512 = load <4 x float>, <4 x float> addrspace(3)* %495, align 16, !tbaa !8
  %513 = fmul <4 x float> %327, %512
  %514 = tail call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %326, <4 x float> %511, <4 x float> %513)
  store <4 x float> %514, <4 x float> addrspace(3)* %476, align 16, !tbaa !8
  br label %515

; <label>:515:                                    ; preds = %510, %507
  tail call void @llvm.amdgcn.s.barrier() #3
  %516 = add nsw i32 %500, -2
  %517 = icmp sgt i32 %500, 2
  br i1 %517, label %499, label %496

; <label>:518:                                    ; preds = %497
  %519 = getelementptr inbounds <4 x float>, <4 x float> addrspace(1)* %2, i64 %8
  %520 = load <4 x float>, <4 x float> addrspace(3)* %3, align 16, !tbaa !8
  store <4 x float> %520, <4 x float> addrspace(1)* %519, align 16, !tbaa !8
  br label %521

; <label>:521:                                    ; preds = %518, %497
  ret void
}

; Function Attrs: nounwind readnone
declare <4 x float> @llvm.fmuladd.v4f32(<4 x float>, <4 x float>, <4 x float>) #1

; Function Attrs: nounwind readnone
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: nounwind readnone
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nounwind readnone
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: convergent nounwind
declare void @llvm.amdgcn.s.barrier() #2

; Function Attrs: nounwind readnone
declare float @llvm.sqrt.f32(float) #1

attributes #0 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="carrizo" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { convergent nounwind }
attributes #3 = { nounwind }
attributes #4 = { nobuiltin nounwind }

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
!8 = !{!9, !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{float 2.500000e+00}
