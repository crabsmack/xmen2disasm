; ---------------------------------------------------------------------------
; Ninja_ActCheckLeave - NINJA script action: when its +$A2 timer has run out switch to the leave script, else continue
; In:  8(a6) = this
; Out: none
; Evidence: +$A2 (spawn word +$E, default -1 = never) == 0 -> AiScript_Set(+$96, Tbl_NinjaLeaveScript) and start it; else next step; +$A2 is decremented by Ninja_ActLeap
; ---------------------------------------------------------------------------
Ninja_ActCheckLeave:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$A2(a4)
	bne.s	loc_13D5C6
	lea.l	$3AB2(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	tst.l	$98(a4)
	addq.w	#$8,a7
	bne.s	loc_13D5A8
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_13D604
loc_13D5A8:
	clr.w	$96(a4)
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_13D604
loc_13D5C6:
	tst.l	$98(a4)
	bne.s	loc_13D5D8
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_13D604
loc_13D5D8:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_13D5EC
	clr.w	$96(a4)
loc_13D5EC:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_13D604:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
