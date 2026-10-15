; ---------------------------------------------------------------------------
; BigBio_Script - BIGBIO AI script thunks (table $120826)
; In:  jmp thunks
; Out: -
; Evidence: AiScript_Set(+$96, jt $34AA) in BigBio_StartScript; first entry BigBio_ActSpit3
; ---------------------------------------------------------------------------
BigBio_Script:
	jmp	$3522(a5)	; -> BigBio_ActSpit3
loc_12082C:
	jmp	$3522(a5)	; -> BigBio_ActSpit3
