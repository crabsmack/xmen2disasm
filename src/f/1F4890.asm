; ---------------------------------------------------------------------------
; unk_Sys_1F4890 - return a pointer to Tbl_A5WorldInfo (20-byte A5-world parameter block)
; In:  none
; Out: a0 = Tbl_A5WorldInfo
; Evidence: lea Tbl_A5WorldInfo(pc),a0; rts; only caller Sys_InitHardware ignores the result (dead code path stores hooks)
; ---------------------------------------------------------------------------
unk_Sys_1F4890:
	lea.l	Tbl_A5WorldInfo(pc),a0
	rts
