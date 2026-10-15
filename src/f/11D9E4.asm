; ---------------------------------------------------------------------------
; BabyMoleMan_Init_Case2 - BabyMoleMan_Init cases 2-3: AI scripts at $11B60C / $11B61E
; In:  inside BabyMoleMan_Init
; Out: -
; Evidence: Sw_11D946 targets BabyMoleMan_Init_Case2/loc_11D9F8
; ---------------------------------------------------------------------------
BabyMoleMan_Init_Case2:
	lea.l	$3022(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	addq.w	#$8,a7
	bra.s	$11DA1E
loc_11D9F8:
	lea.l	$302A(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	addq.w	#$8,a7
	bra.s	$11DA1E
