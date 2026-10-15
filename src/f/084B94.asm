; ---------------------------------------------------------------------------
; SmallBrood_StateChase - SMALLBROOD state: walk (turning at the x limits) until within 4 px of the nearest player's x, then the next step
; In:  8(a6) = this
; Out: d0
; Evidence: same shape as SmallBrood_StateApproach with |dx| < 4
; Found: link-after-rts
; ---------------------------------------------------------------------------
SmallBrood_StateChase:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> Player_Nearest
	movea.l	d0,a3
	move.l	$8(a4),d6
	asr.l	#$8,d6
	move.l	$8(a4),d0
	sub.l	$8(a3),d0
	move.l	d0,d7
	asr.l	#$8,d7
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_084BC8
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_084BCE
loc_084BC8:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_084BCE:
	move.w	d0,d7
	cmp.w	$A2(a4),d6
	addq.w	#$4,a7
	bne.s	loc_084BE6
	andi.b	#$EF,$2E(a4)
	move.w	$A6(a4),$16(a4)
	bra.s	loc_084C46
loc_084BE6:
	cmp.w	$A4(a4),d6
	bne.s	loc_084C00
	ori.b	#$10,$2E(a4)
	move.w	$A6(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$16(a4)
	bra.s	loc_084C46
loc_084C00:
	cmpi.w	#$4,d7
	bge.s	loc_084C46
	tst.l	$98(a4)
	bne.s	loc_084C18
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_084C58
loc_084C18:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_084C2C
	clr.w	$96(a4)
loc_084C2C:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_084C58
loc_084C46:
	clr.w	$6C(a4)
	lea.l	SmallBrood_StateChase(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_084C58:
	movem.l	-$14(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
