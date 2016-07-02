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
		workitem_vgpr_count = 43
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
	s_load_dwordx2 s[0:1], s[4:5], 0x8
	s_ashr_i32 s7, s6, 31
	s_lshl_b64 s[8:9], s[6:7], 4
	s_load_dword s3, s[4:5], 0x0
	s_load_dword s2, s[4:5], 0x18
	s_waitcnt lgkmcnt(0)
	s_add_u32 s0, s0, s8
	s_addc_u32 s1, s1, s9
	v_mov_b32_e32 v3, s1
	v_mov_b32_e32 v2, s0
	flat_load_dwordx4 v[12:15], v[2:3]
	v_cvt_f32_i32_e32 v1, s3
	v_cvt_f32_u32_e32 v2, v0
	v_mov_b32_e32 v9, 0xb5ddea0e
	v_mov_b32_e32 v4, 0x6f800000
	v_rcp_f32_e32 v16, v1
	v_mad_f32 v19, 2.0, v2, -v1
	v_lshlrev_b32_e32 v2, 4, v0
	v_add_i32_e32 v1, vcc, s2, v2
	v_mov_b32_e32 v3, 0x2f800000
	v_mov_b32_e32 v8, 0xb717f7d1
	v_mov_b32_e32 v11, 0xbf317180
	v_mov_b32_e32 v7, 0xc2aeac4f
	v_mov_b32_e32 v6, 0x42b17218
	v_mov_b32_e32 v5, 0x7f800000
	s_mov_b32 m0, -1
	s_cmp_lt_i32 s3, 1
	s_waitcnt vmcnt(0) lgkmcnt(0)
	v_sub_f32_e32 v10, 1.0, v15
	v_mul_f32_e32 v21, 0x41200000, v15
	v_mul_f32_e32 v25, 0x41f00000, v15
	v_sub_f32_e32 v17, 1.0, v14
	v_sub_f32_e32 v20, 1.0, v12
	v_mul_f32_e32 v22, 0x41200000, v14
	v_madmk_f32_e32 v21, v10, 0x3e800000, v21
	v_mul_f32_e32 v24, 0x41200000, v12
	v_mul_f32_e32 v28, 0x41f00000, v12
	v_madmk_f32_e32 v29, v12, 0x42c80000, v20
	v_madmk_f32_e32 v15, v15, 0x42c80000, v10
	v_madmk_f32_e32 v25, v10, 0x40a00000, v25
	v_madmk_f32_e32 v10, v17, 0x3e800000, v22
	v_mul_f32_e32 v12, v21, v16
	v_mul_f32_e32 v26, 0x41f00000, v14
	v_madmk_f32_e32 v31, v14, 0x42c80000, v17
	v_mul_f32_e32 v14, v10, v16
	v_sqrt_f32_e32 v10, v12
	v_mul_f32_e32 v10, 0x3e99999a, v10
	v_mul_f32_e32 v21, v10, v19
	v_sub_f32_e32 v18, 1.0, v13
	v_cmp_gt_f32_e32 vcc, 0, v21
	v_mul_f32_e32 v23, 0x41200000, v13
	v_mul_f32_e32 v27, 0x41f00000, v13
	v_madmk_f32_e32 v30, v13, 0x42c80000, v18
	v_cndmask_b32_e64 v13, 0.5, -0.5, vcc
	v_madmk_f32_e32 v13, v21, 0x3fb8aa3b, v13
	v_cvt_i32_f32_e32 v22, v13
	v_sqrt_f32_e32 v13, v14
	v_mul_f32_e32 v13, 0x3e99999a, v13
	v_mul_f32_e32 v32, v13, v19
	v_cvt_f32_i32_e32 v33, v22
	v_cmp_gt_f32_e32 vcc, 0, v32
	v_cndmask_b32_e64 v34, 0.5, -0.5, vcc
	v_madmk_f32_e32 v34, v32, 0x3fb8aa3b, v34
	v_madmk_f32_e32 v35, v33, 0xbf317180, v21
	v_madmk_f32_e32 v35, v33, 0xb717f7d1, v35
	v_mul_f32_e32 v36, v35, v35
	v_madmk_f32_e32 v37, v36, 0x3331bb4c, v9
	v_madak_f32_e32 v37, v36, v37, 0x388ab355
	v_madak_f32_e32 v37, v36, v37, 0xbb360b61
	v_madak_f32_e32 v37, v36, v37, 0x3e2aaaab
	v_mad_f32 v36, -v36, v37, v35
	v_sub_f32_e32 v41, 2.0, v36
	v_cmp_gt_f32_e64 vcc, |v41|, v4
	v_cvt_i32_f32_e32 v34, v34
	v_cndmask_b32_e32 v42, 1.0, v3
	v_mul_f32_e32 v41, v42, v41
	v_rcp_f32_e32 v41, v41
	v_cvt_f32_i32_e32 v38, v34
	v_mul_f32_e32 v35, v36, v35
	v_lshlrev_b32_e32 v22, 23, v22
	v_mul_f32_e32 v35, v41, v35
	v_mul_f32_e32 v35, v35, v42
	v_madmk_f32_e32 v37, v38, 0xbf317180, v32
	v_mad_f32 v35, -v33, v8, -v35
	v_madmk_f32_e32 v37, v38, 0xb717f7d1, v37
	v_mad_f32 v35, -v19, v10, v35
	v_mad_f32 v33, -v33, v11, v35
	v_mul_f32_e32 v39, v37, v37
	v_madmk_f32_e32 v40, v39, 0x3331bb4c, v9
	v_sub_f32_e32 v33, 1.0, v33
	v_madak_f32_e32 v40, v39, v40, 0x388ab355
	v_add_i32_e32 v22, vcc, v33, v22
	v_madak_f32_e32 v40, v39, v40, 0xbb360b61
	v_cmp_lt_f32_e32 vcc, v21, v7
	v_madak_f32_e32 v40, v39, v40, 0x3e2aaaab
	v_cndmask_b32_e64 v22, v22, 0, vcc
	v_cmp_lt_f32_e64 s[0:1], v21, v6
	v_cndmask_b32_e64 v22, v5, v22, s[0:1]
	v_cmp_u_f32_e32 vcc, v21, v21
	v_mad_f32 v39, -v39, v40, v37
	v_cndmask_b32_e32 v21, v22, v21
	v_sub_f32_e32 v22, 2.0, v39
	v_cmp_gt_f32_e64 vcc, |v22|, v4
	v_cndmask_b32_e32 v33, 1.0, v3
	v_mul_f32_e32 v22, v33, v22
	v_rcp_f32_e32 v22, v22
	v_mad_f32 v21, v25, v21, -v15
	v_madmk_f32_e32 v15, v17, 0x40a00000, v26
	v_mul_f32_e32 v17, v39, v37
	v_mul_f32_e32 v17, v22, v17
	v_mul_f32_e32 v17, v17, v33
	v_mad_f32 v17, -v38, v8, -v17
	v_mad_f32 v17, -v19, v13, v17
	v_mad_f32 v17, -v38, v11, v17
	v_lshlrev_b32_e32 v22, 23, v34
	v_sub_f32_e32 v17, 1.0, v17
	v_add_i32_e32 v17, vcc, v17, v22
	v_cmp_lt_f32_e32 vcc, v32, v7
	v_cndmask_b32_e64 v17, v17, 0, vcc
	v_cmp_lt_f32_e64 s[0:1], v32, v6
	v_cmp_u_f32_e32 vcc, v32, v32
	v_cndmask_b32_e64 v17, v5, v17, s[0:1]
	v_cndmask_b32_e32 v17, v17, v32
	v_mad_f32 v22, v15, v17, -v31
	v_madmk_f32_e32 v15, v18, 0x3e800000, v23
	v_mul_f32_e32 v17, v15, v16
	v_sqrt_f32_e32 v15, v17
	v_mul_f32_e32 v15, 0x3e99999a, v15
	v_mul_f32_e32 v23, v15, v19
	v_madmk_f32_e32 v25, v18, 0x40a00000, v27
	v_madmk_f32_e32 v18, v20, 0x3e800000, v24
	v_cmp_gt_f32_e32 vcc, 0, v23
	v_mul_f32_e32 v18, v18, v16
	v_cndmask_b32_e64 v16, 0.5, -0.5, vcc
	v_madmk_f32_e32 v16, v23, 0x3fb8aa3b, v16
	v_cvt_i32_f32_e32 v24, v16
	v_sqrt_f32_e32 v16, v18
	v_mul_f32_e32 v16, 0x3e99999a, v16
	v_mul_f32_e32 v26, v16, v19
	v_cvt_f32_i32_e32 v27, v24
	v_cmp_gt_f32_e32 vcc, 0, v26
	v_cndmask_b32_e64 v31, 0.5, -0.5, vcc
	v_madmk_f32_e32 v31, v26, 0x3fb8aa3b, v31
	v_madmk_f32_e32 v32, v27, 0xbf317180, v23
	v_madmk_f32_e32 v32, v27, 0xb717f7d1, v32
	v_mul_f32_e32 v33, v32, v32
	v_madmk_f32_e32 v34, v33, 0x3331bb4c, v9
	v_madak_f32_e32 v34, v33, v34, 0x388ab355
	v_madak_f32_e32 v34, v33, v34, 0xbb360b61
	v_madak_f32_e32 v34, v33, v34, 0x3e2aaaab
	v_mad_f32 v33, -v33, v34, v32
	v_sub_f32_e32 v38, 2.0, v33
	v_cmp_gt_f32_e64 vcc, |v38|, v4
	v_cvt_i32_f32_e32 v31, v31
	v_cndmask_b32_e32 v39, 1.0, v3
	v_mul_f32_e32 v38, v39, v38
	v_rcp_f32_e32 v38, v38
	v_cvt_f32_i32_e32 v35, v31
	v_mul_f32_e32 v32, v33, v32
	v_lshlrev_b32_e32 v24, 23, v24
	v_mul_f32_e32 v32, v38, v32
	v_mul_f32_e32 v32, v32, v39
	v_madmk_f32_e32 v34, v35, 0xbf317180, v26
	v_mad_f32 v32, -v27, v8, -v32
	v_madmk_f32_e32 v34, v35, 0xb717f7d1, v34
	v_mad_f32 v32, -v19, v15, v32
	v_mad_f32 v27, -v27, v11, v32
	v_mul_f32_e32 v36, v34, v34
	v_madmk_f32_e32 v37, v36, 0x3331bb4c, v9
	v_sub_f32_e32 v27, 1.0, v27
	v_madak_f32_e32 v37, v36, v37, 0x388ab355
	v_add_i32_e32 v24, vcc, v27, v24
	v_madak_f32_e32 v37, v36, v37, 0xbb360b61
	v_cmp_lt_f32_e32 vcc, v23, v7
	v_madak_f32_e32 v37, v36, v37, 0x3e2aaaab
	v_cndmask_b32_e64 v24, v24, 0, vcc
	v_cmp_lt_f32_e32 vcc, v23, v6
	v_cndmask_b32_e32 v24, v5, v24
	v_cmp_u_f32_e32 vcc, v23, v23
	v_mad_f32 v36, -v36, v37, v34
	v_cndmask_b32_e32 v23, v24, v23
	v_sub_f32_e32 v24, 2.0, v36
	v_cmp_gt_f32_e64 vcc, |v24|, v4
	v_cndmask_b32_e32 v27, 1.0, v3
	v_mul_f32_e32 v24, v27, v24
	v_rcp_f32_e32 v24, v24
	v_mad_f32 v23, v25, v23, -v30
	v_mul_f32_e32 v25, v36, v34
	v_madmk_f32_e32 v20, v20, 0x40a00000, v28
	v_mul_f32_e32 v24, v24, v25
	v_mul_f32_e32 v24, v24, v27
	v_mad_f32 v24, -v35, v8, -v24
	v_mad_f32 v19, -v19, v16, v24
	v_mad_f32 v19, -v35, v11, v19
	v_sub_f32_e32 v19, 1.0, v19
	v_lshlrev_b32_e32 v24, 23, v31
	v_add_i32_e32 v19, vcc, v19, v24
	v_cmp_lt_f32_e32 vcc, v26, v7
	v_cndmask_b32_e64 v19, v19, 0, vcc
	v_cmp_lt_f32_e32 vcc, v26, v6
	v_cndmask_b32_e32 v19, v5, v19
	v_cmp_u_f32_e32 vcc, v26, v26
	v_cndmask_b32_e32 v19, v19, v26
	v_mad_f32 v19, v20, v19, -v29
	v_max_f32_e32 v24, 0, v22
	v_max_f32_e32 v25, 0, v21
	v_max_f32_e32 v19, 0, v19
	v_max_f32_e32 v20, 0, v23
	ds_write_b64 v1, v[24:25] offset:8
	ds_write_b64 v1, v[19:20]
	s_waitcnt lgkmcnt(0)
	s_barrier
	s_cbranch_scc1 BB0_4
; BB#1:
	v_mul_f32_e32 v19, 0x3ca3d70a, v18
	v_cmp_gt_f32_e32 vcc, 0, v19
	v_cndmask_b32_e64 v20, 0.5, -0.5, vcc
	v_madmk_f32_e32 v20, v19, 0x3fb8aa3b, v20
	v_cvt_i32_f32_e32 v20, v20
	v_cvt_f32_i32_e32 v21, v20
	v_lshlrev_b32_e32 v20, 23, v20
	v_madmk_f32_e32 v22, v21, 0xbf317180, v19
	v_madmk_f32_e32 v22, v21, 0xb717f7d1, v22
	v_mul_f32_e32 v23, v22, v22
	v_madmk_f32_e32 v24, v23, 0x3331bb4c, v9
	v_madak_f32_e32 v24, v23, v24, 0x388ab355
	v_madak_f32_e32 v24, v23, v24, 0xbb360b61
	v_madak_f32_e32 v24, v23, v24, 0x3e2aaaab
	v_mad_f32 v23, -v23, v24, v22
	v_sub_f32_e32 v24, 2.0, v23
	v_cmp_gt_f32_e64 vcc, |v24|, v4
	v_cndmask_b32_e32 v25, 1.0, v3
	v_mul_f32_e32 v24, v25, v24
	v_rcp_f32_e32 v24, v24
	v_mul_f32_e32 v22, v23, v22
	v_mov_b32_e32 v23, 0x3ca3d70a
	v_mul_f32_e32 v22, v24, v22
	v_mul_f32_e32 v24, 0x3ca3d70a, v17
	v_cmp_gt_f32_e32 vcc, 0, v24
	v_mul_f32_e32 v22, v22, v25
	v_cndmask_b32_e64 v25, 0.5, -0.5, vcc
	v_madmk_f32_e32 v25, v24, 0x3fb8aa3b, v25
	v_cvt_i32_f32_e32 v25, v25
	v_mad_f32 v22, -v21, v8, -v22
	v_mad_f32 v18, -v18, v23, v22
	v_mad_f32 v18, -v21, v11, v18
	v_cvt_f32_i32_e32 v22, v25
	v_sub_f32_e32 v18, 1.0, v18
	v_add_i32_e32 v18, vcc, v18, v20
	v_cmp_lt_f32_e32 vcc, v19, v7
	v_madmk_f32_e32 v20, v22, 0xbf317180, v24
	v_madmk_f32_e32 v20, v22, 0xb717f7d1, v20
	v_mul_f32_e32 v21, v20, v20
	v_madmk_f32_e32 v26, v21, 0x3331bb4c, v9
	v_madak_f32_e32 v26, v21, v26, 0x388ab355
	v_madak_f32_e32 v26, v21, v26, 0xbb360b61
	v_madak_f32_e32 v26, v21, v26, 0x3e2aaaab
	v_mad_f32 v21, -v21, v26, v20
	v_cndmask_b32_e64 v18, v18, 0, vcc
	v_cmp_lt_f32_e32 vcc, v19, v6
	v_sub_f32_e32 v26, 2.0, v21
	v_cndmask_b32_e32 v18, v5, v18
	v_cmp_gt_f32_e64 vcc, |v26|, v4
	v_cndmask_b32_e32 v27, 1.0, v3
	v_cmp_u_f32_e32 vcc, v19, v19
	v_mul_f32_e32 v26, v27, v26
	v_cndmask_b32_e32 v18, v18, v19
	v_mul_f32_e32 v19, v21, v20
	v_mul_f32_e32 v20, 0x3ca3d70a, v14
	v_rcp_f32_e32 v26, v26
	v_cmp_gt_f32_e32 vcc, 0, v20
	v_cndmask_b32_e64 v21, 0.5, -0.5, vcc
	v_madmk_f32_e32 v21, v20, 0x3fb8aa3b, v21
	v_cvt_i32_f32_e32 v21, v21
	v_mul_f32_e32 v19, v26, v19
	v_mul_f32_e32 v19, v19, v27
	v_mad_f32 v19, -v22, v8, -v19
	v_mad_f32 v17, -v17, v23, v19
	v_cvt_f32_i32_e32 v19, v21
	v_mad_f32 v17, -v22, v11, v17
	v_sub_f32_e32 v17, 1.0, v17
	v_lshlrev_b32_e32 v22, 23, v25
	v_add_i32_e32 v17, vcc, v17, v22
	v_madmk_f32_e32 v22, v19, 0xbf317180, v20
	v_madmk_f32_e32 v22, v19, 0xb717f7d1, v22
	v_mul_f32_e32 v25, v22, v22
	v_madmk_f32_e32 v26, v25, 0x3331bb4c, v9
	v_madak_f32_e32 v26, v25, v26, 0x388ab355
	v_madak_f32_e32 v26, v25, v26, 0xbb360b61
	v_madak_f32_e32 v26, v25, v26, 0x3e2aaaab
	v_mad_f32 v25, -v25, v26, v22
	v_cmp_lt_f32_e32 vcc, v24, v7
	v_cndmask_b32_e64 v17, v17, 0, vcc
	v_cmp_lt_f32_e32 vcc, v24, v6
	v_sub_f32_e32 v26, 2.0, v25
	v_cndmask_b32_e32 v17, v5, v17
	v_cmp_gt_f32_e64 vcc, |v26|, v4
	v_cndmask_b32_e32 v27, 1.0, v3
	v_mul_f32_e32 v26, v27, v26
	v_cmp_u_f32_e32 vcc, v24, v24
	v_cndmask_b32_e32 v17, v17, v24
	v_mul_f32_e32 v24, 0x3ca3d70a, v12
	v_rcp_f32_e32 v26, v26
	v_cmp_gt_f32_e32 vcc, 0, v24
	v_mul_f32_e32 v22, v25, v22
	v_cndmask_b32_e64 v25, 0.5, -0.5, vcc
	v_madmk_f32_e32 v25, v24, 0x3fb8aa3b, v25
	v_mul_f32_e32 v22, v26, v22
	v_cvt_i32_f32_e32 v25, v25
	v_mul_f32_e32 v22, v22, v27
	v_mad_f32 v22, -v19, v8, -v22
	v_mad_f32 v14, -v14, v23, v22
	v_mad_f32 v14, -v19, v11, v14
	v_cvt_f32_i32_e32 v19, v25
	v_sub_f32_e32 v14, 1.0, v14
	v_lshlrev_b32_e32 v21, 23, v21
	v_add_i32_e32 v14, vcc, v14, v21
	v_madmk_f32_e32 v21, v19, 0xbf317180, v24
	v_madmk_f32_e32 v21, v19, 0xb717f7d1, v21
	v_mul_f32_e32 v22, v21, v21
	v_madmk_f32_e32 v26, v22, 0x3331bb4c, v9
	v_madak_f32_e32 v26, v22, v26, 0x388ab355
	v_madak_f32_e32 v26, v22, v26, 0xbb360b61
	v_madak_f32_e32 v26, v22, v26, 0x3e2aaaab
	v_mad_f32 v22, -v22, v26, v21
	v_sub_f32_e32 v26, 2.0, v22
	v_cmp_gt_f32_e64 s[0:1], |v26|, v4
	v_cndmask_b32_e64 v27, 1.0, v3, s[0:1]
	v_mul_f32_e32 v26, v27, v26
	v_cmp_lt_f32_e32 vcc, v20, v7
	v_rcp_f32_e32 v26, v26
	v_cndmask_b32_e64 v14, v14, 0, vcc
	v_cmp_lt_f32_e32 vcc, v20, v6
	v_cndmask_b32_e32 v14, v5, v14
	v_cmp_u_f32_e32 vcc, v20, v20
	v_cndmask_b32_e32 v14, v14, v20
	v_mul_f32_e32 v20, v22, v21
	v_mul_f32_e32 v20, v26, v20
	v_mul_f32_e32 v20, v20, v27
	v_mad_f32 v20, -v19, v8, -v20
	v_mad_f32 v12, -v12, v23, v20
	v_cmp_gt_f32_e32 vcc, 0, v16
	v_mad_f32 v11, -v19, v11, v12
	v_cndmask_b32_e64 v19, 0.5, -0.5, vcc
	v_madmk_f32_e32 v19, v16, 0x3fb8aa3b, v19
	v_cvt_i32_f32_e32 v19, v19
	v_sub_f32_e32 v11, 1.0, v11
	v_lshlrev_b32_e32 v12, 23, v25
	v_add_i32_e32 v11, vcc, v11, v12
	v_cvt_f32_i32_e32 v12, v19
	v_cmp_lt_f32_e32 vcc, v24, v7
	v_cndmask_b32_e64 v11, v11, 0, vcc
	v_cmp_lt_f32_e32 vcc, v24, v6
	v_madmk_f32_e32 v20, v12, 0xbf317180, v16
	v_madmk_f32_e32 v21, v12, 0xb717f7d1, v20
	v_mul_f32_e32 v22, v21, v21
	v_madmk_f32_e32 v23, v22, 0x3331bb4c, v9
	v_madak_f32_e32 v23, v22, v23, 0x388ab355
	v_madak_f32_e32 v23, v22, v23, 0xbb360b61
	v_madak_f32_e32 v23, v22, v23, 0x3e2aaaab
	v_mad_f32 v22, -v22, v23, v21
	v_sub_f32_e32 v23, 2.0, v22
	v_cndmask_b32_e32 v11, v5, v11
	v_cmp_gt_f32_e64 vcc, |v23|, v4
	v_cndmask_b32_e32 v25, 1.0, v3
	v_mul_f32_e32 v23, v25, v23
	v_rcp_f32_e32 v23, v23
	v_mul_f32_e32 v21, v22, v21
	v_cmp_u_f32_e32 vcc, v24, v24
	v_cndmask_b32_e32 v11, v11, v24
	v_mul_f32_e32 v21, v23, v21
	v_mul_f32_e32 v21, v21, v25
	v_mad_f32 v12, -v12, v8, -v21
	v_cmp_gt_f32_e32 vcc, 0, v15
	v_subrev_f32_e32 v12, v20, v12
	v_cndmask_b32_e64 v20, 0.5, -0.5, vcc
	v_madmk_f32_e32 v20, v15, 0x3fb8aa3b, v20
	v_cvt_i32_f32_e32 v20, v20
	v_sub_f32_e32 v12, 1.0, v12
	v_lshlrev_b32_e32 v19, 23, v19
	v_add_i32_e32 v12, vcc, v12, v19
	v_cvt_f32_i32_e32 v19, v20
	v_cmp_lt_f32_e32 vcc, v16, v7
	v_cndmask_b32_e64 v12, v12, 0, vcc
	v_cmp_lt_f32_e32 vcc, v16, v6
	v_madmk_f32_e32 v21, v19, 0xbf317180, v15
	v_madmk_f32_e32 v22, v19, 0xb717f7d1, v21
	v_mul_f32_e32 v23, v22, v22
	v_madmk_f32_e32 v24, v23, 0x3331bb4c, v9
	v_madak_f32_e32 v24, v23, v24, 0x388ab355
	v_madak_f32_e32 v24, v23, v24, 0xbb360b61
	v_madak_f32_e32 v24, v23, v24, 0x3e2aaaab
	v_mad_f32 v23, -v23, v24, v22
	v_sub_f32_e32 v24, 2.0, v23
	v_cndmask_b32_e32 v12, v5, v12
	v_cmp_gt_f32_e64 vcc, |v24|, v4
	v_cndmask_b32_e32 v25, 1.0, v3
	v_mul_f32_e32 v24, v25, v24
	v_rcp_f32_e32 v24, v24
	v_cmp_u_f32_e32 vcc, v16, v16
	v_cndmask_b32_e32 v12, v12, v16
	v_mul_f32_e32 v16, v23, v22
	v_mul_f32_e32 v16, v24, v16
	v_mul_f32_e32 v16, v16, v25
	v_cmp_gt_f32_e32 vcc, 0, v13
	v_mad_f32 v16, -v19, v8, -v16
	v_lshlrev_b32_e32 v19, 23, v20
	v_cndmask_b32_e64 v20, 0.5, -0.5, vcc
	v_madmk_f32_e32 v20, v13, 0x3fb8aa3b, v20
	v_cvt_i32_f32_e32 v20, v20
	v_subrev_f32_e32 v16, v21, v16
	v_sub_f32_e32 v16, 1.0, v16
	v_add_i32_e32 v16, vcc, v16, v19
	v_cvt_f32_i32_e32 v19, v20
	v_cmp_lt_f32_e32 vcc, v15, v7
	v_cndmask_b32_e64 v16, v16, 0, vcc
	v_cmp_lt_f32_e32 vcc, v15, v6
	v_madmk_f32_e32 v21, v19, 0xbf317180, v13
	v_madmk_f32_e32 v22, v19, 0xb717f7d1, v21
	v_mul_f32_e32 v23, v22, v22
	v_madmk_f32_e32 v24, v23, 0x3331bb4c, v9
	v_madak_f32_e32 v24, v23, v24, 0x388ab355
	v_madak_f32_e32 v24, v23, v24, 0xbb360b61
	v_madak_f32_e32 v24, v23, v24, 0x3e2aaaab
	v_mad_f32 v23, -v23, v24, v22
	v_sub_f32_e32 v24, 2.0, v23
	v_cndmask_b32_e32 v16, v5, v16
	v_cmp_gt_f32_e64 vcc, |v24|, v4
	v_cndmask_b32_e32 v25, 1.0, v3
	v_mul_f32_e32 v24, v25, v24
	v_rcp_f32_e32 v24, v24
	v_cmp_u_f32_e32 vcc, v15, v15
	v_cndmask_b32_e32 v15, v16, v15
	v_mul_f32_e32 v16, v23, v22
	v_mul_f32_e32 v16, v24, v16
	v_mul_f32_e32 v16, v16, v25
	v_mad_f32 v16, -v19, v8, -v16
	v_subrev_f32_e32 v16, v21, v16
	v_sub_f32_e32 v16, 1.0, v16
	v_lshlrev_b32_e32 v19, 23, v20
	v_add_i32_e32 v16, vcc, v16, v19
	v_cmp_gt_f32_e32 vcc, 0, v10
	v_cndmask_b32_e64 v19, 0.5, -0.5, vcc
	v_madmk_f32_e32 v19, v10, 0x3fb8aa3b, v19
	v_cvt_i32_f32_e32 v19, v19
	v_cmp_lt_f32_e32 vcc, v13, v7
	v_cndmask_b32_e64 v16, v16, 0, vcc
	v_cmp_lt_f32_e32 vcc, v13, v6
	v_cvt_f32_i32_e32 v20, v19
	v_cndmask_b32_e32 v16, v5, v16
	v_cmp_u_f32_e32 vcc, v13, v13
	v_cndmask_b32_e32 v13, v16, v13
	v_madmk_f32_e32 v16, v20, 0xbf317180, v10
	v_madmk_f32_e32 v21, v20, 0xb717f7d1, v16
	v_mul_f32_e32 v22, v21, v21
	v_madmk_f32_e32 v9, v22, 0x3331bb4c, v9
	v_madak_f32_e32 v9, v22, v9, 0x388ab355
	v_madak_f32_e32 v9, v22, v9, 0xbb360b61
	v_madak_f32_e32 v9, v22, v9, 0x3e2aaaab
	v_mad_f32 v9, -v22, v9, v21
	v_sub_f32_e32 v22, 2.0, v9
	v_cmp_gt_f32_e64 vcc, |v22|, v4
	v_cndmask_b32_e32 v23, 1.0, v3
	v_mul_f32_e32 v22, v23, v22
	v_rcp_f32_e32 v22, v22
	v_mul_f32_e32 v9, v9, v21
	v_rcp_f32_e32 v21, v14
	s_load_dword s0, s[4:5], 0x1c
	v_mul_f32_e32 v9, v22, v9
	v_mul_f32_e32 v9, v9, v23
	v_mad_f32 v8, -v20, v8, -v9
	v_subrev_f32_e32 v8, v16, v8
	v_sub_f32_e32 v8, 1.0, v8
	v_lshlrev_b32_e32 v9, 23, v19
	v_add_i32_e32 v8, vcc, v8, v9
	v_cmp_lt_f32_e32 vcc, v10, v7
	v_cndmask_b32_e64 v7, v8, 0, vcc
	v_cmp_lt_f32_e32 vcc, v10, v6
	v_cndmask_b32_e32 v5, v5, v7
	v_cmp_u_f32_e32 vcc, v10, v10
	v_cndmask_b32_e32 v5, v5, v10
	v_rcp_f32_e32 v6, v5
	v_rcp_f32_e32 v9, v12
	v_rcp_f32_e32 v7, v13
	v_rcp_f32_e32 v8, v15
	v_rcp_f32_e32 v22, v11
	v_subrev_f32_e32 v10, v6, v11
	v_subrev_f32_e32 v11, v7, v14
	v_subrev_f32_e32 v5, v6, v5
	v_subrev_f32_e32 v14, v8, v17
	v_subrev_f32_e32 v6, v8, v15
	v_subrev_f32_e32 v8, v9, v12
	v_cmp_gt_f32_e64 vcc, |v8|, v4
	v_subrev_f32_e32 v16, v9, v18
	v_cndmask_b32_e32 v9, 1.0, v3
	v_mul_f32_e32 v8, v9, v8
	v_rcp_f32_e32 v8, v8
	v_cmp_gt_f32_e64 vcc, |v6|, v4
	v_subrev_f32_e32 v7, v7, v13
	v_cndmask_b32_e32 v12, 1.0, v3
	v_mul_f32_e32 v8, v8, v16
	v_cmp_gt_f32_e64 vcc, |v7|, v4
	v_mul_f32_e32 v8, v8, v9
	v_cndmask_b32_e32 v9, 1.0, v3
	v_cmp_gt_f32_e64 vcc, |v5|, v4
	v_cndmask_b32_e32 v3, 1.0, v3
	v_mul_f32_e32 v6, v12, v6
	v_mul_f32_e32 v7, v9, v7
	v_mul_f32_e32 v4, v3, v5
	v_rcp_f32_e32 v6, v6
	v_rcp_f32_e32 v4, v4
	v_rcp_f32_e32 v7, v7
	v_rcp_f32_e32 v26, v18
	v_rcp_f32_e32 v24, v17
	v_mul_f32_e32 v6, v6, v14
	v_mul_f32_e32 v5, v7, v11
	v_mul_f32_e32 v4, v4, v10
	v_mul_f32_e32 v5, v5, v9
	v_mul_f32_e32 v12, v6, v12
	v_mul_f32_e32 v3, v4, v3
	v_add_i32_e32 v4, vcc, 16, v2
	v_mul_f32_e32 v6, v3, v22
	v_mad_f32 v13, -v3, v22, v22
	v_add_i32_e32 v3, vcc, s2, v4
	v_mul_f32_e32 v9, v5, v21
	v_mad_f32 v16, -v5, v21, v21
	s_waitcnt lgkmcnt(0)
	v_add_i32_e32 v2, vcc, s0, v2
	v_add_i32_e32 v4, vcc, s0, v4
	v_mov_b32_e32 v5, s3
	v_mul_f32_e32 v18, v12, v24
	v_mad_f32 v20, -v12, v24, v24
	v_mul_f32_e32 v21, v8, v26
	v_mad_f32 v22, -v8, v26, v26
BB0_5:                                  ; =>This Inner Loop Header: Depth=1
	v_cmp_lt_u32_e32 vcc, v0, v5
	s_and_saveexec_b64 s[0:1], vcc
	s_xor_b64 s[0:1], exec, s[0:1]
	s_cbranch_execz BB0_7
; BB#6:                                 ;   in Loop: Header=BB0_5 Depth=1
	s_mov_b32 m0, -1
	ds_read_b64 v[23:24], v3 offset:8
	ds_read_b64 v[10:11], v1 offset:8
	ds_read_b64 v[14:15], v3
	ds_read_b64 v[7:8], v1
	s_waitcnt lgkmcnt(0)
	v_mul_f32_e32 v26, v23, v16
	v_mul_f32_e32 v27, v24, v13
	v_mac_f32_e32 v27, v11, v6
	v_mac_f32_e32 v26, v10, v9
	v_mul_f32_e32 v25, v14, v22
	ds_write_b64 v2, v[26:27] offset:8
	s_waitcnt lgkmcnt(0)
	v_mul_f32_e32 v26, v15, v20
	v_mac_f32_e32 v25, v7, v21
	v_mac_f32_e32 v26, v8, v18
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
	ds_read_b64 v[23:24], v4 offset:8
	ds_read_b64 v[10:11], v2 offset:8
	ds_read_b64 v[14:15], v4
	ds_read_b64 v[7:8], v2
	s_waitcnt lgkmcnt(0)
	v_mul_f32_e32 v26, v23, v16
	v_mul_f32_e32 v27, v24, v13
	v_mac_f32_e32 v27, v11, v6
	v_mac_f32_e32 v26, v10, v9
	v_mul_f32_e32 v25, v14, v22
	ds_write_b64 v1, v[26:27] offset:8
	s_waitcnt lgkmcnt(0)
	v_mul_f32_e32 v26, v15, v20
	v_mac_f32_e32 v25, v7, v21
	v_mac_f32_e32 v26, v8, v18
	ds_write_b64 v1, v[25:26]
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
	v_mov_b32_e32 v0, s2
	s_mov_b32 m0, -1
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
; codeLenInByte = 2704
; NumSgprs: 16
; NumVgprs: 43
; FloatMode: 192
; IeeeMode: 0
; ScratchSize: 0
; LDSByteSize: 0 bytes/workgroup (compile time only)
; ReservedVGPRFirst: 0
; ReservedVGPRCount: 0
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
