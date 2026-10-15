; ---------------------------------------------------------------------------
; BabyMoleMan_Script1 - BABYMOLEMAN AI script for spawn case 1 (table $11B5FA, 4 entries)
; In:  jmp thunks
; Out: -
; Evidence: jt $301A in BabyMoleMan_Init_Case1
; ---------------------------------------------------------------------------
BabyMoleMan_Script1:
	jmp	$3182(a5)	; -> BabyBio_ActPlayAnimC
loc_11B600:
	jmp	$31B2(a5)	; -> BabyBio_ActStartWalk
loc_11B604:
	jmp	$31CA(a5)	; -> BabyBio_ActStartFiring
loc_11B608:
	jmp	$3172(a5)	; -> BabyBio_ActStopWait30
