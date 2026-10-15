; ---------------------------------------------------------------------------
; BabyMoleMan_Init_Case1 - BabyMoleMan_Init case 1: AI script BabyMoleMan_Script1 ($11B5FA)
; In:  inside BabyMoleMan_Init
; Out: -
; Evidence: Sw_11D946 target; jt $301A
; ---------------------------------------------------------------------------
BabyMoleMan_Init_Case1:
	lea.l	$301A(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	addq.w	#$8,a7
	bra.s	$11DA1E
