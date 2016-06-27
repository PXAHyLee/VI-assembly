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
		compute_pgm_rsrc1_vgprs = 10
		compute_pgm_rsrc1_sgprs = 1
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
		wavefront_sgpr_count = 16
		workitem_vgpr_count = 42
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
	s_load_dword s3, s[4:5], 0x0
	s_nop 0
	s_load_dwordx2 s[0:1], s[4:5], 0x8
	s_nop 0
	s_load_dword s2, s[4:5], 0x18
	s_ashr_i32 s7, s6, 31
	s_lshl_b64 s[8:9], s[6:7], 4
	s_waitcnt lgkmcnt(0)
	v_cvt_f32_i32_e32 v1, s3
	s_add_u32 s0, s0, s8
	s_addc_u32 s1, s1, s9
	v_mov_b32_e32 v3, s1
	v_mov_b32_e32 v2, s0
	flat_load_dwordx4 v[5:8], v[2:3]
	v_rcp_f32_e32 v15, v1
	v_mov_b32_e32 v9, 0x41200000
	v_mov_b32_e32 v10, 0x3e800000
	v_cvt_f32_u32_e32 v2, v0
	v_mov_b32_e32 v21, 0x3e99999a
	v_mov_b32_e32 v4, 0x3fb8aa3b
	v_mov_b32_e32 v3, 0xbf317180
	v_mad_f32 v24, 2.0, v2, -v1
	v_mov_b32_e32 v1, 0xb717f7d1
	v_mov_b32_e32 v2, 0xb5ddea0e
	v_mov_b32_e32 v11, 0x41f00000
	v_mov_b32_e32 v12, 0x42c80000
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_sub_f32_e32 v13, 1.0, v8
	v_sub_f32_e32 v14, 1.0, v7
	v_mul_f32_e32 v16, v9, v8
	v_mul_f32_e32 v20, v11, v8
	v_mul_f32_e32 v22, v11, v7
	v_mul_f32_e32 v25, v11, v6
	v_mul_f32_e32 v26, v11, v5
	v_mul_f32_e32 v11, v9, v7
	v_mul_f32_e32 v23, v9, v6
	v_mul_f32_e32 v27, v9, v5
	v_sub_f32_e32 v9, 1.0, v6
	v_sub_f32_e32 v17, 1.0, v5
	v_mad_f32 v28, v12, v5, v17
	v_mad_f32 v6, v12, v6, v9
	v_mad_f32 v29, v12, v7, v14
	v_mad_f32 v30, v12, v8, v13
	v_mov_b32_e32 v5, 0x40a00000
	v_mac_f32_e32 v26, v5, v17
	v_mac_f32_e32 v25, v5, v9
	v_mac_f32_e32 v22, v5, v14
	v_mac_f32_e32 v20, v5, v13
	v_mac_f32_e32 v27, v10, v17
	v_mac_f32_e32 v23, v10, v9
	v_mac_f32_e32 v11, v10, v14
	v_mac_f32_e32 v16, v10, v13
	v_mul_f32_e32 v9, v16, v15
	v_mul_f32_e32 v10, v11, v15
	v_sqrt_f32_e32 v7, v10
	v_sqrt_f32_e32 v5, v9
	v_mul_f32_e32 v5, v21, v5
	v_mul_f32_e32 v31, v5, v24
	v_cmp_gt_f32_e32 vcc, 0, v31
	v_cndmask_b32_e64 v8, 0.5, -0.5, vcc
	v_mac_f32_e32 v8, v4, v31
	v_cvt_i32_f32_e32 v13, v8
	v_mul_f32_e32 v16, v21, v7
	v_mul_f32_e32 v32, v16, v24
	v_cmp_gt_f32_e32 vcc, 0, v32
	v_cvt_f32_i32_e32 v17, v13
	v_cndmask_b32_e64 v7, 0.5, -0.5, vcc
	v_mac_f32_e32 v7, v4, v32
	v_cvt_i32_f32_e32 v33, v7
	v_mad_f32 v19, v3, v17, v31
	v_mac_f32_e32 v19, v1, v17
	v_mov_b32_e32 v18, 0x3331bb4c
	v_mov_b32_e32 v11, 0x388ab355
	v_mul_f32_e32 v7, v19, v19
	v_mad_f32 v8, v18, v7, v2
	v_mad_f32 v8, v8, v7, v11
	v_mov_b32_e32 v12, 0xbb360b61
	v_mad_f32 v8, v8, v7, v12
	v_cvt_f32_i32_e32 v34, v33
	v_mov_b32_e32 v14, 0x3e2aaaab
	v_mad_f32 v8, v8, v7, v14
	v_mad_f32 v35, -v7, v8, v19
	v_mad_f32 v36, v3, v34, v32
	v_mac_f32_e32 v36, v1, v34
	v_mul_f32_e32 v37, v36, v36
	v_mad_f32 v7, v18, v37, v2
	v_mad_f32 v7, v7, v37, v11
	v_mad_f32 v38, v7, v37, v12
	v_mov_b32_e32 v7, 0x6f800000
	v_sub_f32_e32 v39, 2.0, v35
	v_cmp_gt_f32_e64 vcc, |v39|, v7
	v_mov_b32_e32 v8, 0x2f800000
	v_cndmask_b32_e32 v40, 1.0, v8
	v_mul_f32_e32 v39, v40, v39
	v_rcp_f32_e32 v39, v39
	v_mad_f32 v38, v38, v37, v14
	v_mad_f32 v37, -v37, v38, v36
	v_mul_f32_e32 v19, v35, v19
	v_mul_f32_e32 v19, v39, v19
	v_mul_f32_e32 v19, v19, v40
	v_mad_f32 v19, -v17, v1, -v19
	v_mad_f32 v19, -v24, v5, v19
	v_mad_f32 v17, -v17, v3, v19
	v_lshlrev_b32_e32 v13, 23, v13
	v_sub_f32_e32 v17, 1.0, v17
	v_add_i32_e32 v19, vcc, v17, v13
	v_mov_b32_e32 v17, 0xc2aeac4f
	v_cmp_lt_f32_e32 vcc, v31, v17
	v_mov_b32_e32 v13, 0x42b17218
	v_cmp_lt_f32_e64 s[0:1], v31, v13
	v_cndmask_b32_e64 v35, v19, 0, vcc
	v_cmp_u_f32_e32 vcc, v31, v31
	v_mov_b32_e32 v19, 0x7f800000
	v_cndmask_b32_e64 v35, v19, v35, s[0:1]
	v_sub_f32_e32 v38, 2.0, v37
	v_cmp_gt_f32_e64 s[0:1], |v38|, v7
	v_cndmask_b32_e64 v39, 1.0, v8, s[0:1]
	v_mul_f32_e32 v38, v39, v38
	v_rcp_f32_e32 v38, v38
	v_cndmask_b32_e32 v31, v35, v31
	v_mad_f32 v30, v20, v31, -v30
	v_mul_f32_e32 v20, v37, v36
	v_mul_f32_e32 v20, v38, v20
	v_mul_f32_e32 v20, v20, v39
	v_mad_f32 v20, -v34, v1, -v20
	v_mad_f32 v20, -v24, v16, v20
	v_mad_f32 v20, -v34, v3, v20
	v_lshlrev_b32_e32 v31, 23, v33
	v_sub_f32_e32 v20, 1.0, v20
	v_add_i32_e32 v20, vcc, v20, v31
	v_cmp_lt_f32_e32 vcc, v32, v17
	v_cmp_lt_f32_e64 s[0:1], v32, v13
	v_cndmask_b32_e64 v20, v20, 0, vcc
	v_cmp_u_f32_e32 vcc, v32, v32
	v_cndmask_b32_e64 v20, v19, v20, s[0:1]
	v_cndmask_b32_e32 v20, v20, v32
	v_mad_f32 v29, v22, v20, -v29
	v_mul_f32_e32 v22, v23, v15
	v_mul_f32_e32 v23, v27, v15
	v_sqrt_f32_e32 v15, v22
	v_mul_f32_e32 v20, v21, v15
	v_mul_f32_e32 v15, v20, v24
	v_cmp_gt_f32_e32 vcc, 0, v15
	v_cndmask_b32_e64 v27, 0.5, -0.5, vcc
	v_mac_f32_e32 v27, v4, v15
	v_cvt_i32_f32_e32 v27, v27
	v_sqrt_f32_e32 v31, v23
	v_mul_f32_e32 v21, v21, v31
	v_mul_f32_e32 v31, v21, v24
	v_cmp_gt_f32_e32 vcc, 0, v31
	v_cvt_f32_i32_e32 v32, v27
	v_cndmask_b32_e64 v33, 0.5, -0.5, vcc
	v_mac_f32_e32 v33, v4, v31
	v_cvt_i32_f32_e32 v33, v33
	v_mad_f32 v34, v3, v32, v15
	v_mac_f32_e32 v34, v1, v32
	v_mul_f32_e32 v35, v34, v34
	v_mad_f32 v36, v18, v35, v2
	v_mad_f32 v36, v36, v35, v11
	v_cvt_f32_i32_e32 v37, v33
	v_mad_f32 v36, v36, v35, v12
	v_mad_f32 v36, v36, v35, v14
	v_mad_f32 v35, -v35, v36, v34
	v_mad_f32 v36, v3, v37, v31
	v_mac_f32_e32 v36, v1, v37
	v_mul_f32_e32 v38, v36, v36
	v_mad_f32 v39, v18, v38, v2
	v_mad_f32 v39, v39, v38, v11
	v_mad_f32 v39, v39, v38, v12
	v_sub_f32_e32 v40, 2.0, v35
	v_cmp_gt_f32_e64 vcc, |v40|, v7
	v_cndmask_b32_e32 v41, 1.0, v8
	v_mul_f32_e32 v40, v41, v40
	v_rcp_f32_e32 v40, v40
	v_mad_f32 v39, v39, v38, v14
	v_mad_f32 v38, -v38, v39, v36
	v_mul_f32_e32 v34, v35, v34
	v_mul_f32_e32 v34, v40, v34
	v_mul_f32_e32 v34, v34, v41
	v_mad_f32 v34, -v32, v1, -v34
	v_mad_f32 v34, -v24, v20, v34
	v_mad_f32 v32, -v32, v3, v34
	v_sub_f32_e32 v32, 1.0, v32
	v_lshlrev_b32_e32 v27, 23, v27
	v_add_i32_e32 v27, vcc, v32, v27
	v_sub_f32_e32 v32, 2.0, v38
	v_cmp_gt_f32_e64 vcc, |v32|, v7
	v_cndmask_b32_e32 v34, 1.0, v8
	v_mul_f32_e32 v32, v34, v32
	v_rcp_f32_e32 v32, v32
	v_cmp_lt_f32_e32 vcc, v15, v17
	v_cndmask_b32_e64 v27, v27, 0, vcc
	v_cmp_lt_f32_e32 vcc, v15, v13
	v_cndmask_b32_e32 v27, v19, v27
	v_cmp_u_f32_e32 vcc, v15, v15
	v_cndmask_b32_e32 v15, v27, v15
	v_mad_f32 v25, v25, v15, -v6
	v_mul_f32_e32 v6, v38, v36
	v_mul_f32_e32 v6, v32, v6
	v_mul_f32_e32 v6, v6, v34
	v_mad_f32 v6, -v37, v1, -v6
	v_mad_f32 v6, -v24, v21, v6
	v_mad_f32 v6, -v37, v3, v6
	v_sub_f32_e32 v6, 1.0, v6
	v_lshlrev_b32_e32 v15, 23, v33
	v_add_i32_e32 v6, vcc, v6, v15
	v_cmp_lt_f32_e32 vcc, v31, v17
	v_cndmask_b32_e64 v6, v6, 0, vcc
	v_cmp_lt_f32_e32 vcc, v31, v13
	v_cndmask_b32_e32 v6, v19, v6
	v_cmp_u_f32_e32 vcc, v31, v31
	v_cndmask_b32_e32 v6, v6, v31
	v_mad_f32 v24, v26, v6, -v28
	s_mov_b32 m0, -1
	v_lshlrev_b32_e32 v15, 4, v0
	v_add_i32_e32 v6, vcc, s2, v15
	v_max_f32_e32 v26, 0, v29
	v_max_f32_e32 v27, 0, v30
	ds_write_b64 v6, v[26:27] offset:8
	s_waitcnt lgkmcnt(0)
	v_max_f32_e32 v26, 0, v24
	v_max_f32_e32 v27, 0, v25
	ds_write_b64 v6, v[26:27]
	s_waitcnt lgkmcnt(0)
	s_barrier
	s_cmp_lt_i32 s3, 1
	s_cbranch_scc1 BB0_4
; BB#1:
	v_mov_b32_e32 v24, 0x3ca3d70a
	v_mul_f32_e32 v25, v24, v23
	v_cmp_gt_f32_e32 vcc, 0, v25
	v_cndmask_b32_e64 v26, 0.5, -0.5, vcc
	v_mac_f32_e32 v26, v4, v25
	v_cvt_i32_f32_e32 v26, v26
	v_cvt_f32_i32_e32 v27, v26
	v_mad_f32 v28, v3, v27, v25
	v_mac_f32_e32 v28, v1, v27
	v_mul_f32_e32 v29, v28, v28
	v_mad_f32 v30, v18, v29, v2
	v_mad_f32 v30, v30, v29, v11
	v_mad_f32 v30, v30, v29, v12
	v_mad_f32 v30, v30, v29, v14
	v_mad_f32 v29, -v29, v30, v28
	v_mul_f32_e32 v30, v24, v22
	v_cmp_gt_f32_e32 vcc, 0, v30
	v_cndmask_b32_e64 v31, 0.5, -0.5, vcc
	v_mac_f32_e32 v31, v4, v30
	v_cvt_i32_f32_e32 v31, v31
	v_sub_f32_e32 v32, 2.0, v29
	v_cmp_gt_f32_e64 vcc, |v32|, v7
	v_cndmask_b32_e32 v33, 1.0, v8
	v_mul_f32_e32 v32, v33, v32
	v_rcp_f32_e32 v32, v32
	v_cvt_f32_i32_e32 v34, v31
	v_mul_f32_e32 v28, v29, v28
	v_mul_f32_e32 v28, v32, v28
	v_mul_f32_e32 v28, v28, v33
	v_mad_f32 v29, v3, v34, v30
	v_mac_f32_e32 v29, v1, v34
	v_mul_f32_e32 v32, v29, v29
	v_mad_f32 v33, v18, v32, v2
	v_mad_f32 v33, v33, v32, v11
	v_mad_f32 v33, v33, v32, v12
	v_mad_f32 v33, v33, v32, v14
	v_mad_f32 v32, -v32, v33, v29
	v_mad_f32 v28, -v27, v1, -v28
	v_sub_f32_e32 v33, 2.0, v32
	v_cmp_gt_f32_e64 vcc, |v33|, v7
	v_mul_f32_e32 v35, v24, v10
	v_cmp_gt_f32_e64 s[0:1], 0, v35
	v_cndmask_b32_e64 v36, 0.5, -0.5, s[0:1]
	v_mac_f32_e32 v36, v4, v35
	v_cvt_i32_f32_e32 v36, v36
	v_cndmask_b32_e32 v37, 1.0, v8
	v_mul_f32_e32 v33, v37, v33
	v_rcp_f32_e32 v33, v33
	v_mad_f32 v23, -v23, v24, v28
	v_cvt_f32_i32_e32 v28, v36
	v_mul_f32_e32 v29, v32, v29
	v_mul_f32_e32 v29, v33, v29
	v_mul_f32_e32 v29, v29, v37
	v_mad_f32 v32, v3, v28, v35
	v_mac_f32_e32 v32, v1, v28
	v_mul_f32_e32 v33, v32, v32
	v_mad_f32 v37, v18, v33, v2
	v_mad_f32 v37, v37, v33, v11
	v_mad_f32 v37, v37, v33, v12
	v_mad_f32 v37, v37, v33, v14
	v_mad_f32 v33, -v33, v37, v32
	v_mad_f32 v29, -v34, v1, -v29
	v_sub_f32_e32 v37, 2.0, v33
	v_cmp_gt_f32_e64 vcc, |v37|, v7
	v_mul_f32_e32 v38, v24, v9
	v_cmp_gt_f32_e64 s[0:1], 0, v38
	v_cndmask_b32_e64 v39, 0.5, -0.5, s[0:1]
	v_mac_f32_e32 v39, v4, v38
	v_cvt_i32_f32_e32 v39, v39
	v_cndmask_b32_e32 v40, 1.0, v8
	v_mul_f32_e32 v37, v40, v37
	v_rcp_f32_e32 v37, v37
	v_mad_f32 v22, -v22, v24, v29
	v_cvt_f32_i32_e32 v29, v39
	v_mul_f32_e32 v32, v33, v32
	v_mul_f32_e32 v32, v37, v32
	v_mul_f32_e32 v32, v32, v40
	v_mad_f32 v33, v3, v29, v38
	v_mac_f32_e32 v33, v1, v29
	v_mul_f32_e32 v37, v33, v33
	v_mad_f32 v40, v18, v37, v2
	v_mad_f32 v40, v40, v37, v11
	v_mad_f32 v40, v40, v37, v12
	v_mad_f32 v40, v40, v37, v14
	v_mad_f32 v37, -v37, v40, v33
	v_sub_f32_e32 v40, 2.0, v37
	v_cmp_gt_f32_e64 vcc, |v40|, v7
	v_cndmask_b32_e32 v41, 1.0, v8
	v_mul_f32_e32 v40, v41, v40
	v_rcp_f32_e32 v40, v40
	v_mad_f32 v32, -v28, v1, -v32
	v_mad_f32 v10, -v10, v24, v32
	v_mul_f32_e32 v32, v37, v33
	v_mul_f32_e32 v32, v40, v32
	v_mul_f32_e32 v32, v32, v41
	v_mad_f32 v32, -v29, v1, -v32
	v_mad_f32 v9, -v9, v24, v32
	v_mad_f32 v23, -v27, v3, v23
	v_sub_f32_e32 v23, 1.0, v23
	v_lshlrev_b32_e32 v24, 23, v26
	v_add_i32_e32 v23, vcc, v23, v24
	v_cmp_lt_f32_e32 vcc, v25, v17
	v_cndmask_b32_e64 v23, v23, 0, vcc
	v_cmp_lt_f32_e32 vcc, v25, v13
	v_cndmask_b32_e32 v23, v19, v23
	v_cmp_u_f32_e32 vcc, v25, v25
	v_cndmask_b32_e32 v23, v23, v25
	v_mad_f32 v22, -v34, v3, v22
	v_sub_f32_e32 v22, 1.0, v22
	v_lshlrev_b32_e32 v24, 23, v31
	v_add_i32_e32 v22, vcc, v22, v24
	v_cmp_lt_f32_e32 vcc, v30, v17
	v_cndmask_b32_e64 v22, v22, 0, vcc
	v_cmp_lt_f32_e32 vcc, v30, v13
	v_cndmask_b32_e32 v22, v19, v22
	v_cmp_u_f32_e32 vcc, v30, v30
	v_cndmask_b32_e32 v22, v22, v30
	v_mad_f32 v10, -v28, v3, v10
	v_sub_f32_e32 v10, 1.0, v10
	v_lshlrev_b32_e32 v24, 23, v36
	v_add_i32_e32 v10, vcc, v10, v24
	v_cmp_lt_f32_e32 vcc, v35, v17
	v_cndmask_b32_e64 v10, v10, 0, vcc
	v_cmp_lt_f32_e32 vcc, v35, v13
	v_cndmask_b32_e32 v10, v19, v10
	v_cmp_u_f32_e32 vcc, v35, v35
	v_cmp_gt_f32_e64 s[0:1], 0, v21
	v_cndmask_b32_e64 v24, 0.5, -0.5, s[0:1]
	v_mac_f32_e32 v24, v4, v21
	v_cvt_i32_f32_e32 v24, v24
	v_cndmask_b32_e32 v10, v10, v35
	v_mad_f32 v9, -v29, v3, v9
	v_sub_f32_e32 v9, 1.0, v9
	v_cvt_f32_i32_e32 v25, v24
	v_lshlrev_b32_e32 v26, 23, v39
	v_add_i32_e32 v9, vcc, v9, v26
	v_mad_f32 v26, v3, v25, v21
	v_mad_f32 v27, v1, v25, v26
	v_mul_f32_e32 v28, v27, v27
	v_mad_f32 v29, v18, v28, v2
	v_mad_f32 v29, v29, v28, v11
	v_mad_f32 v29, v29, v28, v12
	v_mad_f32 v29, v29, v28, v14
	v_mad_f32 v28, -v28, v29, v27
	v_cmp_lt_f32_e32 vcc, v38, v17
	v_cndmask_b32_e64 v9, v9, 0, vcc
	v_cmp_lt_f32_e32 vcc, v38, v13
	v_cndmask_b32_e32 v9, v19, v9
	v_sub_f32_e32 v29, 2.0, v28
	v_cmp_gt_f32_e64 vcc, |v29|, v7
	v_cndmask_b32_e32 v30, 1.0, v8
	v_mul_f32_e32 v29, v30, v29
	v_rcp_f32_e32 v29, v29
	v_cmp_u_f32_e32 vcc, v38, v38
	v_cndmask_b32_e32 v9, v9, v38
	v_mul_f32_e32 v27, v28, v27
	v_mul_f32_e32 v27, v29, v27
	v_mul_f32_e32 v27, v27, v30
	v_cmp_gt_f32_e32 vcc, 0, v20
	v_cndmask_b32_e64 v28, 0.5, -0.5, vcc
	v_mac_f32_e32 v28, v4, v20
	v_cvt_i32_f32_e32 v28, v28
	v_mad_f32 v25, -v25, v1, -v27
	v_subrev_f32_e32 v25, v26, v25
	v_sub_f32_e32 v25, 1.0, v25
	v_cvt_f32_i32_e32 v26, v28
	v_lshlrev_b32_e32 v24, 23, v24
	v_add_i32_e32 v24, vcc, v25, v24
	v_mad_f32 v25, v3, v26, v20
	v_mad_f32 v27, v1, v26, v25
	v_mul_f32_e32 v29, v27, v27
	v_mad_f32 v30, v18, v29, v2
	v_mad_f32 v30, v30, v29, v11
	v_mad_f32 v30, v30, v29, v12
	v_mad_f32 v30, v30, v29, v14
	v_mad_f32 v29, -v29, v30, v27
	v_cmp_lt_f32_e32 vcc, v21, v17
	v_cndmask_b32_e64 v24, v24, 0, vcc
	v_cmp_lt_f32_e32 vcc, v21, v13
	v_cndmask_b32_e32 v24, v19, v24
	v_sub_f32_e32 v30, 2.0, v29
	v_cmp_gt_f32_e64 vcc, |v30|, v7
	v_cndmask_b32_e32 v31, 1.0, v8
	v_mul_f32_e32 v30, v31, v30
	v_rcp_f32_e32 v30, v30
	v_cmp_u_f32_e32 vcc, v21, v21
	v_cndmask_b32_e32 v21, v24, v21
	v_mul_f32_e32 v24, v29, v27
	v_mul_f32_e32 v24, v30, v24
	v_mul_f32_e32 v24, v24, v31
	v_cmp_gt_f32_e32 vcc, 0, v16
	v_cndmask_b32_e64 v27, 0.5, -0.5, vcc
	v_mac_f32_e32 v27, v4, v16
	v_cvt_i32_f32_e32 v27, v27
	v_mad_f32 v24, -v26, v1, -v24
	v_subrev_f32_e32 v24, v25, v24
	v_sub_f32_e32 v24, 1.0, v24
	v_cvt_f32_i32_e32 v25, v27
	v_lshlrev_b32_e32 v26, 23, v28
	v_add_i32_e32 v24, vcc, v24, v26
	v_mad_f32 v26, v3, v25, v16
	v_mad_f32 v28, v1, v25, v26
	v_mul_f32_e32 v29, v28, v28
	v_mad_f32 v30, v18, v29, v2
	v_mad_f32 v30, v30, v29, v11
	v_mad_f32 v30, v30, v29, v12
	v_mad_f32 v30, v30, v29, v14
	v_mad_f32 v29, -v29, v30, v28
	v_cmp_lt_f32_e32 vcc, v20, v17
	v_cndmask_b32_e64 v24, v24, 0, vcc
	v_cmp_lt_f32_e32 vcc, v20, v13
	v_cndmask_b32_e32 v24, v19, v24
	v_sub_f32_e32 v30, 2.0, v29
	v_cmp_gt_f32_e64 vcc, |v30|, v7
	v_cndmask_b32_e32 v31, 1.0, v8
	v_mul_f32_e32 v30, v31, v30
	v_rcp_f32_e32 v30, v30
	v_cmp_u_f32_e32 vcc, v20, v20
	v_cndmask_b32_e32 v20, v24, v20
	v_mul_f32_e32 v24, v29, v28
	v_mul_f32_e32 v24, v30, v24
	v_mul_f32_e32 v24, v24, v31
	v_mad_f32 v24, -v25, v1, -v24
	v_subrev_f32_e32 v24, v26, v24
	v_sub_f32_e32 v24, 1.0, v24
	v_lshlrev_b32_e32 v25, 23, v27
	v_add_i32_e32 v24, vcc, v24, v25
	v_cmp_gt_f32_e32 vcc, 0, v5
	v_cndmask_b32_e64 v25, 0.5, -0.5, vcc
	v_mac_f32_e32 v25, v4, v5
	v_cvt_i32_f32_e32 v4, v25
	v_cmp_lt_f32_e32 vcc, v16, v17
	v_cndmask_b32_e64 v24, v24, 0, vcc
	v_cmp_lt_f32_e32 vcc, v16, v13
	v_cvt_f32_i32_e32 v25, v4
	v_cndmask_b32_e32 v24, v19, v24
	v_cmp_u_f32_e32 vcc, v16, v16
	v_cndmask_b32_e32 v16, v24, v16
	v_mad_f32 v3, v3, v25, v5
	v_mad_f32 v24, v1, v25, v3
	v_mul_f32_e32 v26, v24, v24
	v_mac_f32_e32 v2, v18, v26
	s_load_dword s0, s[4:5], 0x1c
	v_mac_f32_e32 v11, v2, v26
	v_rcp_f32_e32 v27, v23
	v_mac_f32_e32 v12, v11, v26
	v_mac_f32_e32 v14, v12, v26
	v_mad_f32 v2, -v26, v14, v24
	v_sub_f32_e32 v11, 2.0, v2
	v_cmp_gt_f32_e64 vcc, |v11|, v7
	v_cndmask_b32_e32 v12, 1.0, v8
	v_mul_f32_e32 v11, v12, v11
	v_rcp_f32_e32 v11, v11
	v_rcp_f32_e32 v14, v22
	v_mul_f32_e32 v2, v2, v24
	v_rcp_f32_e32 v18, v10
	v_mul_f32_e32 v2, v11, v2
	v_rcp_f32_e32 v11, v9
	v_mul_f32_e32 v2, v2, v12
	v_mad_f32 v1, -v25, v1, -v2
	v_subrev_f32_e32 v1, v3, v1
	v_sub_f32_e32 v1, 1.0, v1
	v_lshlrev_b32_e32 v2, 23, v4
	v_add_i32_e32 v1, vcc, v1, v2
	v_cmp_lt_f32_e32 vcc, v5, v17
	v_cndmask_b32_e64 v1, v1, 0, vcc
	v_cmp_lt_f32_e32 vcc, v5, v13
	v_cndmask_b32_e32 v1, v19, v1
	v_cmp_u_f32_e32 vcc, v5, v5
	v_cndmask_b32_e32 v1, v1, v5
	v_rcp_f32_e32 v2, v1
	v_rcp_f32_e32 v3, v16
	v_rcp_f32_e32 v4, v20
	v_rcp_f32_e32 v5, v21
	v_subrev_f32_e32 v9, v2, v9
	v_subrev_f32_e32 v10, v3, v10
	v_subrev_f32_e32 v12, v4, v22
	v_subrev_f32_e32 v13, v5, v23
	v_subrev_f32_e32 v1, v2, v1
	v_subrev_f32_e32 v2, v4, v20
	v_subrev_f32_e32 v4, v5, v21
	v_cmp_gt_f32_e64 vcc, |v4|, v7
	v_cndmask_b32_e32 v5, 1.0, v8
	v_mul_f32_e32 v4, v5, v4
	v_rcp_f32_e32 v4, v4
	v_cmp_gt_f32_e64 vcc, |v2|, v7
	v_cndmask_b32_e32 v17, 1.0, v8
	v_mul_f32_e32 v2, v17, v2
	v_rcp_f32_e32 v2, v2
	v_subrev_f32_e32 v3, v3, v16
	v_mul_f32_e32 v4, v4, v13
	v_mul_f32_e32 v16, v4, v5
	v_mul_f32_e32 v2, v2, v12
	v_cmp_gt_f32_e64 vcc, |v3|, v7
	v_cndmask_b32_e32 v4, 1.0, v8
	v_mul_f32_e32 v3, v4, v3
	v_rcp_f32_e32 v3, v3
	v_cmp_gt_f32_e64 vcc, |v1|, v7
	v_cndmask_b32_e32 v5, 1.0, v8
	v_mul_f32_e32 v1, v5, v1
	v_rcp_f32_e32 v1, v1
	v_mul_f32_e32 v7, v2, v17
	v_mul_f32_e32 v2, v3, v10
	v_mul_f32_e32 v2, v2, v4
	v_mul_f32_e32 v1, v1, v9
	v_mul_f32_e32 v1, v1, v5
	v_mul_f32_e32 v4, v1, v11
	v_mul_f32_e32 v9, v2, v18
	v_mad_f32 v13, -v1, v11, v11
	v_mad_f32 v18, -v2, v18, v18
	v_add_i32_e32 v3, vcc, 16, v15
	v_add_i32_e32 v1, vcc, s2, v3
	s_waitcnt lgkmcnt(0)
	v_add_i32_e32 v2, vcc, s0, v15
	v_add_i32_e32 v3, vcc, s0, v3
	v_mov_b32_e32 v5, s3
	v_mul_f32_e32 v15, v7, v14
	v_mad_f32 v20, -v7, v14, v14
	v_mul_f32_e32 v21, v16, v27
	v_mad_f32 v22, -v16, v27, v27
BB0_5:                                  ; =>This Inner Loop Header: Depth=1
	v_cmp_lt_u32_e32 vcc, v0, v5
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
	s_cbranch_execz BB0_7
; BB#6:                                 ;   in Loop: Header=BB0_5 Depth=1
	s_mov_b32 m0, -1
	ds_read_b64 v[7:8], v6
	ds_read_b64 v[10:11], v6 offset:8
	ds_read_b64 v[16:17], v1
	ds_read_b64 v[23:24], v1 offset:8
	s_waitcnt lgkmcnt(0)
	v_mul_f32_e32 v25, v16, v22
	v_mul_f32_e32 v26, v17, v20
	v_mul_f32_e32 v16, v23, v18
	v_mul_f32_e32 v17, v24, v13
	v_mac_f32_e32 v17, v11, v4
	v_mac_f32_e32 v16, v10, v9
	v_mac_f32_e32 v26, v8, v15
	v_mac_f32_e32 v25, v7, v21
	ds_write_b64 v2, v[16:17] offset:8
	ds_write_b64 v2, v[25:26]
	s_waitcnt lgkmcnt(0)
BB0_7:                                  ;   in Loop: Header=BB0_5 Depth=1
	s_or_b64 exec, exec, s[0:1]
	s_barrier
	v_add_i32_e32 v5, vcc, -1, v5
	v_cmp_lt_u32_e32 vcc, v0, v5
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
	s_cbranch_execz BB0_9
; BB#8:                                 ;   in Loop: Header=BB0_5 Depth=1
	s_mov_b32 m0, -1
	ds_read_b64 v[7:8], v2
	ds_read_b64 v[10:11], v2 offset:8
	ds_read_b64 v[16:17], v3
	ds_read_b64 v[23:24], v3 offset:8
	s_waitcnt lgkmcnt(0)
	v_mul_f32_e32 v25, v16, v22
	v_mul_f32_e32 v26, v23, v18
	v_mul_f32_e32 v27, v24, v13
	v_mac_f32_e32 v27, v11, v4
	v_mac_f32_e32 v26, v10, v9
	ds_write_b64 v6, v[26:27] offset:8
	s_waitcnt lgkmcnt(0)
	v_mul_f32_e32 v26, v17, v20
	v_mac_f32_e32 v26, v8, v15
	v_mac_f32_e32 v25, v7, v21
	ds_write_b64 v6, v[25:26]
	s_waitcnt lgkmcnt(0)
BB0_9:                                  ;   in Loop: Header=BB0_5 Depth=1
	s_or_b64 exec, exec, s[0:1]
	s_barrier
	v_add_i32_e32 v7, vcc, 1, v5
	v_add_i32_e32 v5, vcc, -1, v5
	v_cmp_gt_i32_e32 vcc, 3, v7
	s_and_b64 vcc, exec, vcc
	s_cbranch_vccnz BB0_2
	s_branch BB0_5
BB0_2:                                  ; %Flow
BB0_4:                                  ; %Flow1
	s_load_dwordx2 s[4:5], s[4:5], 0x10
	s_waitcnt lgkmcnt(0)
; BB#3:
	v_cmp_eq_i32_e32 vcc, 0, v0
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
	s_cbranch_execz BB0_11
; BB#10:
	s_mov_b32 m0, -1
	v_mov_b32_e32 v0, s2
	ds_read_b64 v[1:2], v0
	ds_read_b64 v[3:4], v0 offset:8
	s_lshl_b64 s[2:3], s[6:7], 4
	s_add_u32 s2, s4, s2
	s_addc_u32 s3, s5, s3
	v_mov_b32_e32 v6, s3
	v_mov_b32_e32 v5, s2
	s_waitcnt lgkmcnt(0)
	flat_store_dwordx4 v[5:6], v[1:4]
	s_waitcnt vmcnt(0) lgkmcnt(0)
BB0_11:
	s_or_b64 exec, exec, s[0:1]
	s_endpgm
.Lfunc_end0:
	.size	binomial_options, .Lfunc_end0-binomial_options

	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 3024
; NumSgprs: 16
; NumVgprs: 42
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
