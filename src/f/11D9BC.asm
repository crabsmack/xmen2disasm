; ---------------------------------------------------------------------------
; BabyMoleMan_Init_Case0 - BabyMoleMan_Init case 0: AI script at $11B5D0
; In:  inside BabyMoleMan_Init (a4 = this)
; Out: -
; Evidence: Sw_11D946 target; AiScript_Set(+$96, jt $3012)
; ---------------------------------------------------------------------------
BabyMoleMan_Init_Case0:
	lea.l	$3012(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	addq.w	#$8,a7
	bra.s	$11DA1E
