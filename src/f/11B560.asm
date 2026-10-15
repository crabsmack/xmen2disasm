; ---------------------------------------------------------------------------
; BabySentinelC_Script2 - BABYSENTINELC AI script (table $11B55E, 12 entries; rest undisassembled)
; In:  jmp thunks
; Out: -
; Evidence: jt $2FFA in BabySentinelC_Init (else branch)
; ---------------------------------------------------------------------------
BabySentinelC_Script2:
	jmp	$31E2(a5)	; -> BabyBio_ActCrawl
loc_11B564:
	jmp	$314A(a5)	; -> BabyBio_ActFacePlayer
loc_11B568:
	jmp	$3152(a5)	; -> BabyBio_ActPlayAnimA
loc_11B56C:
	jmp	$318A(a5)	; -> BabyBio_ActPlayAnimD
loc_11B570:
	jmp	$3172(a5)	; -> BabyBio_ActStopWait30
