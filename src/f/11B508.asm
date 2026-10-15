; ---------------------------------------------------------------------------
; BabySentinelB_Script2 - BABYSENTINELB AI script (table $11B506, 13 entries), entries 1-7
; In:  jmp thunks
; Out: -
; Evidence: jt $2FEA in BabySentinelB_Init (else branch)
; ---------------------------------------------------------------------------
BabySentinelB_Script2:
	jmp	$3192(a5)	; -> BabyBio_ActWaitPlayerNear192
loc_11B50C:
	jmp	$314A(a5)	; -> BabyBio_ActFacePlayer
loc_11B510:
	jmp	$3152(a5)	; -> BabyBio_ActPlayAnimA
loc_11B514:
	jmp	$318A(a5)	; -> BabyBio_ActPlayAnimD
loc_11B518:
	jmp	$316A(a5)	; -> BabyBio_ActStopWait60
loc_11B51C:
	jmp	$31D2(a5)	; -> BabyBio_ActAttachFlame
loc_11B520:
	jmp	$3162(a5)	; -> BabyBio_ActStopWaitParam
