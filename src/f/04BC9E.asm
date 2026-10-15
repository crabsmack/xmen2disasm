; ---------------------------------------------------------------------------
; Apocalypse_ActPickScript_part1 - part 1 of Apocalypse_ActPickScript: code block split off by the code-flow tools (not a separate function)
; In:  registers/frame of Apocalypse_ActPickScript
; Out: continues in Apocalypse_ActPickScript
; Evidence: only reached by branches from Apocalypse_ActPickScript
; ---------------------------------------------------------------------------
Apocalypse_ActPickScript_part1:
	lea.l	$A1A(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$A2(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	addq.w	#$8,a7
	bra.s	Apocalypse_ActPickScript_part3
