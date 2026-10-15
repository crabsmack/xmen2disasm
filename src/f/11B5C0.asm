; ---------------------------------------------------------------------------
; BabyMoleMan_ScriptDefault - BABYMOLEMAN default AI script (table $11B5BE, 4 entries)
; In:  jmp thunks
; Out: -
; Evidence: jt $300A in BabyMoleMan_Init_Default
; ---------------------------------------------------------------------------
BabyMoleMan_ScriptDefault:
	jmp	$3182(a5)	; -> BabyBio_ActPlayAnimC
loc_11B5C4:
	jmp	$319A(a5)	; -> BabyBio_ActWaitPlayerNear128
loc_11B5C8:
	jmp	$31CA(a5)	; -> BabyBio_ActStartFiring
loc_11B5CC:
	jmp	$3172(a5)	; -> BabyBio_ActStopWait30
