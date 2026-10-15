; ---------------------------------------------------------------------------
; FloatBio_Script3 - FLOATBIO AI script for spawn case 3 (table $11B65A, 4 entries)
; In:  jmp thunks
; Out: -
; Evidence: jt $303A
; ---------------------------------------------------------------------------
FloatBio_Script3:
	jmp	$314A(a5)	; -> BabyBio_ActFacePlayer
loc_11B660:
	jmp	$3182(a5)	; -> BabyBio_ActPlayAnimC
loc_11B664:
	jmp	$3252(a5)	; -> FloatBio_ActWaitParam
loc_11B668:
	jmp	$31CA(a5)	; -> BabyBio_ActStartFiring
