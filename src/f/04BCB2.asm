; ---------------------------------------------------------------------------
; Apocalypse_ActPickScript_part2 - part 2 of Apocalypse_ActPickScript: switch case(s) split off by the code-flow tools (not a separate function)
; In:  registers/frame of Apocalypse_ActPickScript
; Out: continues in Apocalypse_ActPickScript
; Evidence: only reached by branches from Apocalypse_ActPickScript
; ---------------------------------------------------------------------------
Apocalypse_ActPickScript_part2:
	lea.l	$A22(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$A2(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	addq.w	#$8,a7
	bra.s	Apocalypse_ActPickScript_part3
loc_04BCC6:
	lea.l	$A2A(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$A2(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	addq.w	#$8,a7
	bra.s	Apocalypse_ActPickScript_part3
loc_04BCDA:
	lea.l	$A32(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$A2(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	addq.w	#$8,a7
