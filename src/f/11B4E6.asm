; ---------------------------------------------------------------------------
; BabySentinelA_Script - BABYSENTINELA AI script thunks (table $11B4E4, 8 entries; partly undisassembled)
; In:  jmp thunks
; Out: -
; Evidence: AiScript_Set(+$96, jt $2FE2) in BabySentinelA_Init
; ---------------------------------------------------------------------------
BabySentinelA_Script:
	jmp	$31E2(a5)	; -> BabyBio_ActCrawl
