; ---------------------------------------------------------------------------
; BabySentinelA_Script - BABYSENTINELA AI script thunks (table $11B4E4, 8 entries; partly undisassembled)
; In:  jmp thunks
; Out: -
; Evidence: AiScript_Set(+$96, jt $2FE2) in BabySentinelA_Init
; ---------------------------------------------------------------------------
BabySentinelA_Script:
	jmp	$31E2(a5)	; -> BabyBio_ActCrawl
	jmp	$314A(a5)	; -> BabyBio_ActFacePlayer
	jmp	$3152(a5)	; -> BabyBio_ActPlayAnimA
	jmp	$3182(a5)	; -> BabyBio_ActPlayAnimC
	jmp	$3172(a5)	; -> BabyBio_ActStopWait30
	jmp	$31CA(a5)	; -> BabyBio_ActStartFiring
	jmp	$3172(a5)	; -> BabyBio_ActStopWait30
	jmp	$3152(a5)	; -> BabyBio_ActPlayAnimA
