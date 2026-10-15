; ---------------------------------------------------------------------------
; BabyMoleMan_Init_Default - BabyMoleMan_Init default: AI script BabyMoleMan_ScriptDefault ($11B5BE), start it
; In:  inside BabyMoleMan_Init
; Out: -
; Evidence: jt $300A; TAS 30933-54514
; ---------------------------------------------------------------------------
BabyMoleMan_Init_Default:
	lea.l	$300A(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	addq.w	#$8,a7
	tst.l	$98(a4)
	bne.s	loc_11DA30
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_11DA4C
loc_11DA30:
	clr.w	$96(a4)
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_11DA4C:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
