	.hsatext
	.hsa_code_object_version 1,0
	.hsa_code_object_isa 8,0,1,"AMD","AMDGPU"
	.section	.AMDGPU.config
	.hsatext
	.globl	binomial_options
	.p2align	8
	.type	binomial_options,@function
	.amdgpu_hsa_kernel binomial_options
binomial_options:                       ; @binomial_options
	.amd_kernel_code_t
		kernel_code_version_major = 1
		kernel_code_version_minor = 0
		machine_kind = 1
		machine_version_major = 8
		machine_version_minor = 0
		machine_version_stepping = 1
		kernel_code_entry_byte_offset = 256
		kernel_code_prefetch_byte_size = 0
		max_scratch_backing_memory_byte_size = 0
		compute_pgm_rsrc1_vgprs = 5
		compute_pgm_rsrc1_sgprs = 2
		compute_pgm_rsrc1_priority = 0
		compute_pgm_rsrc1_float_mode = 192
		compute_pgm_rsrc1_priv = 0
		compute_pgm_rsrc1_dx10_clamp = 1
		compute_pgm_rsrc1_debug_mode = 0
		compute_pgm_rsrc1_ieee_mode = 0
		compute_pgm_rsrc2_scratch_en = 0
		compute_pgm_rsrc2_user_sgpr = 6
		compute_pgm_rsrc2_tgid_x_en = 1
		compute_pgm_rsrc2_tgid_y_en = 0
		compute_pgm_rsrc2_tgid_z_en = 0
		compute_pgm_rsrc2_tg_size_en = 0
		compute_pgm_rsrc2_tidig_comp_cnt = 0
		compute_pgm_rsrc2_excp_en_msb = 0
		compute_pgm_rsrc2_lds_size = 0
		compute_pgm_rsrc2_excp_en = 0
		enable_sgpr_private_segment_buffer = 1
		enable_sgpr_dispatch_ptr = 0
		enable_sgpr_queue_ptr = 0
		enable_sgpr_kernarg_segment_ptr = 1
		enable_sgpr_dispatch_id = 0
		enable_sgpr_flat_scratch_init = 0
		enable_sgpr_private_segment_size = 0
		enable_sgpr_grid_workgroup_count_x = 0
		enable_sgpr_grid_workgroup_count_y = 0
		enable_sgpr_grid_workgroup_count_z = 0
		enable_ordered_append_gds = 0
		private_element_size = 3
		is_ptr64 = 1
		is_dynamic_callstack = 0
		is_debug_enabled = 0
		is_xnack_enabled = 0
		workitem_private_segment_byte_size = 0
		workgroup_group_segment_byte_size = 0
		gds_segment_byte_size = 0
		kernarg_segment_byte_size = 32
		workgroup_fbarrier_count = 0
		wavefront_sgpr_count = 18
		workitem_vgpr_count = 24
		reserved_vgpr_first = 0
		reserved_vgpr_count = 0
		reserved_sgpr_first = 0
		reserved_sgpr_count = 0
		debug_wavefront_private_segment_offset_sgpr = 0
		debug_private_segment_buffer_sgpr = 0
		kernarg_segment_alignment = 4
		group_segment_alignment = 4
		private_segment_alignment = 4
		wavefront_size = 6
		call_convention = 0
		runtime_loader_kernel_symbol = 0
	.end_amd_kernel_code_t
; BB#0:
	s_load_dword s8, s[4:5], 0x0 ; s8: 1st argument (numSteps)
	s_nop 0
	s_load_dwordx2 s[10:11], s[4:5], 0x8 ; s[10:11]: 2nd argument (randArray)
	s_nop 0
	s_load_dwordx2 s[0:1], s[4:5], 0x10 ; s[0:1]: 3nd argument (output)
	s_ashr_i32 s7, s6, 31 ; s6 = 32bit workgroup_id => s[6:7] = bid = signext(s6)
	s_lshl_b64 s[2:3], s[6:7], 4 ; s[2:3] = 16 * wg_id
	s_waitcnt lgkmcnt(0)
	v_cvt_f32_i32_e32 v1, s8 ; v1 = (float)s8 [s8: 1st argument]
	s_add_u32 s6, s10, s2
	s_addc_u32 s7, s11, s3 ; s[6:7] = s[10:11] + s[2:3]
	v_mov_b32_e32 v3, s7
	v_mov_b32_e32 v2, s6
	flat_load_dwordx4 v[2:5], v[2:3] ; v[2:5] = randArray[bid], but only v2 is used!
                                     ; v2 = randArray[bid].x
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_rcp_f32_e32 v3, v1 ; v3 = 1 / v1 = 1 / numSteps
	v_cvt_f32_u32_e32 v4, v0 ; v4 = (float)tid [tid = get_local_id(0)]
    ; nan is unused in brig version
	v_mov_b32_e32 v5, 0x7fc00000 ; v5 = nan
	v_mov_b32_e32 v6, 0x3fb8aa3b ; v6 = 1 / ln(2) [1.4426950216293335]
	v_mov_b32_e32 v7, 0xbf317180 ; v7 = -ln2HI
    ; v1: unused expression in brig version
	v_mad_f32 v1, 2.0, v4, -v1 ; v1 = 2 * v4 - numSteps
	v_mov_b32_e32 v4, 0xb717f7d1 ; v4 = (-ln2LO)
	v_mov_b32_e32 v8, 0xb5ddea0e ; v8 = 1.6533901998627698e-06 (-0x1.bbd41cp-20f)
	v_mov_b32_e32 v9, 0x3331bb4c ; v9 = 4.138136944220605e-08 (0x1.637698p-25f)
	v_mov_b32_e32 v10, 0x388ab355 ; v10 = 6.61375597701408e-05 (0x1.1566aap-14))
	v_mov_b32_e32 v11, 0xbb360b61 ; v11 = -0.0027777778450399637 (-0x1.6c16c2p-9f)
	v_mov_b32_e32 v12, 0x3e2aaaab ; v12 = 0.1666666716337204 (0x1.555556p-3f)

    ; two magic numbers appeared in faster 2.5 ulp fdiv
	v_mov_b32_e32 v13, 0x6f800000 ; v13 = 7.922816251426434e+28
	v_mov_b32_e32 v14, 0x2f800000 ; v14 = 2.3283064365386963e-10
	s_load_dword s4, s[4:5], 0x18 ; s4: 4th argument
	v_lshlrev_b32_e32 v0, 4, v0 ; v0 = 16 * tid
	v_sub_f32_e32 v15, 1.0, v2 ; v15 = 1.0 - randArray.x
	v_mul_f32_e32 v16, 0x41200000, v2 ; v16 = 10.f * randArray[bid].x
	v_mac_f32_e32 v16, 0x3e800000, v15 ; v16 = optionYears = 0.25 * v15 + v16
	v_mul_f32_e32 v3, v16, v3 ; v3 = v16 / numSteps

    ; unused sqrt(dt)
	v_cmp_gt_f32_e32 vcc, 0, v3 ; vcc = 0 > v3
	v_sqrt_f32_e32 v3, v3 ; v3 = sqrt(v3)

    ; unused vsdt
	v_mul_f32_e32 v3, 0x3e99999a, v3 ; v3 = VOLATILITY * v3
	v_cndmask_b32_e32 v3, v3, v5 ; v3 = vsdt = (0 > v3) ? nan : v3

	v_mul_f32_e32 v5, v3, v1 ; v5 = vsdt * (2.f * tid - (float)numSteps)

    ; unused exp(...)
	v_cmp_gt_f32_e32 vcc, 0, v5 ; vcc = 0 > v5
	v_cndmask_b32_e64 v16, 0.5, -0.5, vcc ; v16 = (0 > v5) ? -0.5 : 0.5
    ; why v6 is v_mov_b32 at the starting of the program?
	v_mac_f32_e32 v16, v6, v5 ; v16 = (float)p
	v_cvt_i32_f32_e32 v16, v16 ; v16 = (int)v16
	v_cvt_f32_i32_e32 v17, v16 ; v17 = (int)p
    ; m0 haven't seen in brig version
	s_mov_b32 m0, -1
	s_waitcnt lgkmcnt(0)
	v_add_i32_e32 v0, vcc, s4, v0 ; v0: &callA[tid]
	v_mad_f32 v18, v7, v17, v5
	v_mac_f32_e32 v18, v4, v17
	v_mul_f32_e32 v19, v18, v18
	v_mad_f32 v20, v9, v19, v8
	v_mad_f32 v20, v20, v19, v10
	v_mad_f32 v20, v20, v19, v11
	v_mad_f32 v20, v20, v19, v12
	v_mad_f32 v19, -v19, v20, v18
	v_sub_f32_e32 v20, 2.0, v19
	v_cmp_gt_f32_e64 vcc, |v20|, v13
	ds_read_b64 v[21:22], v0 offset:8
	v_cndmask_b32_e32 v23, 1.0, v14
	v_mul_f32_e32 v20, v23, v20
	v_rcp_f32_e32 v20, v20
	s_waitcnt lgkmcnt(0)
	ds_write_b64 v0, v[21:22] offset:8

	v_mul_f32_e32 v18, v19, v18
	v_mul_f32_e32 v18, v20, v18
	v_mov_b32_e32 v19, 0x3717f7d1 ; v19 = 9.05800061445916e-06 (ln2LO)
	v_mul_f32_e32 v20, v19, v17
	v_mad_f32 v18, -v23, v18, v20
	v_mad_f32 v1, -v1, v3, v18
	s_waitcnt lgkmcnt(0)
	ds_read_b64 v[20:21], v0
	v_mov_b32_e32 v3, 0xc2aeac4 ; v3 = ln(smallest_normal) = -87.33654022216797
	v_mad_f32 v1, -v17, v7, v1
	v_mov_b32_e32 v17, 0x42b17218 ; v1 = ln(largest_normal = 88.72283935546875
	v_lshlrev_b32_e32 v16, 23, v16
	v_sub_f32_e32 v1, 1.0, v1
	v_add_i32_e32 v1, vcc, v1, v16

    ; appeared in the fdiv lowering source code
	v_mov_b32_e32 v16, 0x7f800000
	s_add_u32 s4, s0, s2 ; line 157, 172 => s[4:5] = s[0:1] + s[2:3]
	v_cmp_lt_f32_e32 vcc, v5, v3
	v_cndmask_b32_e64 v1, v1, 0, vcc
	v_cmp_lt_f32_e32 vcc, v5, v17
	v_cndmask_b32_e32 v1, v16, v1
	v_cmp_u_f32_e32 vcc, v5, v5
	v_cndmask_b32_e32 v1, v1, v5
	v_mul_f32_e32 v5, 0x41f00000, v2 ; v5 - 30.f * v2
	v_mac_f32_e32 v5, 0x40a00000, v15 ; v5 = 5.0f * 15 + v5
	v_mac_f32_e32 v15, 0x42c80000, v2
	v_mad_f32 v1, v5, v1, -v15
	s_waitcnt lgkmcnt(0)
	v_max_f32_e32 v20, 0, v1
	s_addc_u32 s5, s1, s3
	ds_write_b64 v0, v[20:21]
	v_mov_b32_e32 v0, s4
	v_mov_b32_e32 v1, s5
	s_waitcnt lgkmcnt(0)
	flat_load_dwordx4 v[20:23], v[0:1]
	v_cmp_gt_f32_e32 vcc, 0, v2
	v_cndmask_b32_e64 v5, 0.5, -0.5, vcc
	v_mac_f32_e32 v5, v6, v2
	v_cvt_i32_f32_e32 v5, v5
	v_cvt_f32_i32_e32 v6, v5
	v_mad_f32 v7, v7, v6, v2
	v_mad_f32 v4, v4, v6, v7
	v_mul_f32_e32 v15, v4, v4
	v_mac_f32_e32 v8, v9, v15
	v_mac_f32_e32 v10, v8, v15
	v_mac_f32_e32 v11, v10, v15
	v_mac_f32_e32 v12, v11, v15
	v_mad_f32 v8, -v15, v12, v4
	v_sub_f32_e32 v9, 2.0, v8
	v_cmp_gt_f32_e64 vcc, |v9|, v13
	v_cndmask_b32_e32 v10, 1.0, v14
	v_mul_f32_e32 v9, v10, v9
	v_rcp_f32_e32 v9, v9
	v_mul_f32_e32 v6, v19, v6
	v_mul_f32_e32 v4, v8, v4
	v_mul_f32_e32 v4, v9, v4
	v_mad_f32 v4, -v10, v4, v6
	v_subrev_f32_e32 v4, v7, v4
	v_sub_f32_e32 v4, 1.0, v4
	v_lshlrev_b32_e32 v5, 23, v5
	v_add_i32_e32 v4, vcc, v4, v5
	v_cmp_lt_f32_e32 vcc, v2, v3
	v_cmp_lt_f32_e64 s[0:1], v2, v17
	v_cndmask_b32_e64 v3, v4, 0, vcc
	v_cndmask_b32_e64 v3, v16, v3, s[0:1]
	v_cmp_u_f32_e32 vcc, v2, v2
	v_cndmask_b32_e32 v2, v3, v2
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_mov_b32_e32 v20, v2
	flat_store_dwordx4 v[0:1], v[20:23]
	s_endpgm
.Lfunc_end0:
	.size	binomial_options, .Lfunc_end0-binomial_options

	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 604
; NumSgprs: 18
; NumVgprs: 24
; FloatMode: 192
; IeeeMode: 0
; ScratchSize: 0
; LDSByteSize: 0 bytes/workgroup (compile time only)
; COMPUTE_PGM_RSRC2:USER_SGPR: 6
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 0

	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.ident	"clang version 3.9.0 "
	.section	".note.GNU-stack"
