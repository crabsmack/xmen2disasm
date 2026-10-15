; ---------------------------------------------------------------------------
; BabySentinelB_Script1 - BABYSENTINELB AI script (table $11B53C, 8 entries), entries 1-5
; In:  jmp thunks
; Out: -
; Evidence: jt $2FF2 in BabySentinelB_Init; count word mislabelled Str_Empty_11B53C
; ---------------------------------------------------------------------------
BabySentinelB_Script1:
	jmp	$318A(a5)	; -> BabyBio_ActPlayAnimD
loc_11B542:
	jmp	$314A(a5)	; -> BabyBio_ActFacePlayer
loc_11B546:
	jmp	$316A(a5)	; -> BabyBio_ActStopWait60
loc_11B54A:
	jmp	$31D2(a5)	; -> BabyBio_ActAttachFlame
loc_11B54E:
	jmp	$3162(a5)	; -> BabyBio_ActStopWaitParam
