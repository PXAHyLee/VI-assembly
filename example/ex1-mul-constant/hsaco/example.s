; /opt/amd/llvm/bin/llc -mtriple amdgcn--amdhsa -mcpu=carrizo -filetype=asm -show-mc-encoding -o example.s example.opt.ll
	.hsatext
	.hsa_code_object_version 1,0
	.hsa_code_object_isa 8,0,1,"AMD","AMDGPU"
	.section	.AMDGPU.config
	.hsatext
	.globl	example
	.p2align	8
	.type	example,@function
	.amdgpu_hsa_kernel example
example:                                ; @example
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
		compute_pgm_rsrc1_vgprs = 4
		compute_pgm_rsrc1_sgprs = 1
		compute_pgm_rsrc1_priority = 0
		compute_pgm_rsrc1_float_mode = 192
		compute_pgm_rsrc1_priv = 0
		compute_pgm_rsrc1_dx10_clamp = 1
		compute_pgm_rsrc1_debug_mode = 0
		compute_pgm_rsrc1_ieee_mode = 0
		compute_pgm_rsrc2_scratch_en = 0
		compute_pgm_rsrc2_user_sgpr = 8
		compute_pgm_rsrc2_tgid_x_en = 1
		compute_pgm_rsrc2_tgid_y_en = 0
		compute_pgm_rsrc2_tgid_z_en = 0
		compute_pgm_rsrc2_tg_size_en = 0
		compute_pgm_rsrc2_tidig_comp_cnt = 0
		compute_pgm_rsrc2_excp_en_msb = 0
		compute_pgm_rsrc2_lds_size = 0
		compute_pgm_rsrc2_excp_en = 0
		enable_sgpr_private_segment_buffer = 1
		enable_sgpr_dispatch_ptr = 1
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
		kernarg_segment_byte_size = 16
		workgroup_fbarrier_count = 0
		wavefront_sgpr_count = 15
		workitem_vgpr_count = 18
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
	s_load_dwordx2 s[0:1], s[6:7], 0x0 ; encoding: [0x03,0x00,0x06,0xc0,0x00,0x00,0x00,0x00]
	s_nop 0                         ; encoding: [0x00,0x00,0x80,0xbf]
	s_load_dwordx2 s[2:3], s[6:7], 0x8 ; encoding: [0x83,0x00,0x06,0xc0,0x08,0x00,0x00,0x00]
	s_nop 0                         ; encoding: [0x00,0x00,0x80,0xbf]
	s_load_dword s4, s[4:5], 0x4    ; encoding: [0x02,0x01,0x02,0xc0,0x04,0x00,0x00,0x00]
	v_mov_b32_e32 v1, 0x42c80000    ; encoding: [0xff,0x02,0x02,0x7e,0x00,0x00,0xc8,0x42]
	v_mov_b32_e32 v2, 0x41f00000    ; encoding: [0xff,0x02,0x04,0x7e,0x00,0x00,0xf0,0x41]
	v_mov_b32_e32 v3, 0x40a00000    ; encoding: [0xff,0x02,0x06,0x7e,0x00,0x00,0xa0,0x40]
	s_waitcnt lgkmcnt(0)            ; encoding: [0x7f,0x00,0x8c,0xbf]
	v_mov_b32_e32 v4, s1            ; encoding: [0x01,0x02,0x08,0x7e]
	v_mov_b32_e32 v5, s3            ; encoding: [0x03,0x02,0x0a,0x7e]
	s_and_b32 s1, s4, 0xffff        ; encoding: [0x04,0xff,0x01,0x86,0xff,0xff,0x00,0x00]
	s_mul_i32 s1, s1, s8            ; encoding: [0x01,0x08,0x01,0x92]
	v_add_i32_e32 v6, vcc, s1, v0   ; encoding: [0x01,0x00,0x0c,0x32]
	v_ashrrev_i32_e32 v7, 31, v6    ; encoding: [0x9f,0x0c,0x0e,0x22]
	v_lshlrev_b64 v[6:7], 4, v[6:7] ; encoding: [0x06,0x00,0x8f,0xd2,0x84,0x0c,0x02,0x00]
	v_add_i32_e32 v8, vcc, s0, v6   ; encoding: [0x00,0x0c,0x10,0x32]
	v_addc_u32_e32 v9, vcc, v7, v4, vcc ; encoding: [0x07,0x09,0x12,0x38]
	flat_load_dwordx4 v[8:11], v[8:9] ; encoding: [0x00,0x00,0x5c,0xdc,0x08,0x00,0x00,0x08]
	v_add_i32_e32 v12, vcc, s2, v6  ; encoding: [0x02,0x0c,0x18,0x32]
	v_addc_u32_e32 v13, vcc, v7, v5, vcc ; encoding: [0x07,0x0b,0x1a,0x38]
	s_waitcnt vmcnt(0) lgkmcnt(0)   ; encoding: [0x70,0x00,0x8c,0xbf]
	v_sub_f32_e32 v0, 1.0, v11      ; encoding: [0xf2,0x16,0x00,0x04]
	v_sub_f32_e32 v4, 1.0, v10      ; encoding: [0xf2,0x14,0x08,0x04]
	v_sub_f32_e32 v5, 1.0, v9       ; encoding: [0xf2,0x12,0x0a,0x04]
	v_sub_f32_e32 v6, 1.0, v8       ; encoding: [0xf2,0x10,0x0c,0x04]
	v_mad_f32 v14, v1, v8, v6       ; encoding: [0x0e,0x00,0xc1,0xd1,0x01,0x11,0x1a,0x04]
	v_mad_f32 v15, v1, v9, v5       ; encoding: [0x0f,0x00,0xc1,0xd1,0x01,0x13,0x16,0x04]
	v_mad_f32 v16, v1, v10, v4      ; encoding: [0x10,0x00,0xc1,0xd1,0x01,0x15,0x12,0x04]
	v_mad_f32 v17, v1, v11, v0      ; encoding: [0x11,0x00,0xc1,0xd1,0x01,0x17,0x02,0x04]
	v_mac_f32_e32 v17, v2, v11      ; encoding: [0x02,0x17,0x22,0x2c]
	v_mac_f32_e32 v16, v2, v10      ; encoding: [0x02,0x15,0x20,0x2c]
	v_mac_f32_e32 v15, v2, v9       ; encoding: [0x02,0x13,0x1e,0x2c]
	v_mac_f32_e32 v14, v2, v8       ; encoding: [0x02,0x11,0x1c,0x2c]
	v_mac_f32_e32 v17, v3, v0       ; encoding: [0x03,0x01,0x22,0x2c]
	v_mac_f32_e32 v16, v3, v4       ; encoding: [0x03,0x09,0x20,0x2c]
	v_mac_f32_e32 v15, v3, v5       ; encoding: [0x03,0x0b,0x1e,0x2c]
	v_mac_f32_e32 v14, v3, v6       ; encoding: [0x03,0x0d,0x1c,0x2c]
	flat_store_dwordx4 v[12:13], v[14:17] ; encoding: [0x00,0x00,0x7c,0xdc,0x0c,0x0e,0x00,0x00]
	s_endpgm                        ; encoding: [0x00,0x00,0x81,0xbf]
.Lfunc_end0:
	.size	example, .Lfunc_end0-example

	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 176
; NumSgprs: 15
; NumVgprs: 18
; FloatMode: 192
; IeeeMode: 0
; ScratchSize: 0
; LDSByteSize: 0 bytes/workgroup (compile time only)
; COMPUTE_PGM_RSRC2:USER_SGPR: 8
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
