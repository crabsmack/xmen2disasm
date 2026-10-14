; ---------------------------------------------------------------------------
; sub_02D456	[link-after-rts]
; ---------------------------------------------------------------------------
sub_02D456:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$96(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,d7
	sub.l	$C(a4),d7
	tst.l	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_02D47C
	move.l	d7,d0
	bra.s	loc_02D480
loc_02D47C:
	move.l	d7,d0
	neg.l	d0
loc_02D480:
	tst.w	$18(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_02D492
	move.w	$18(a4),d1
	ext.l	d1
	bra.s	loc_02D49A
loc_02D492:
	move.w	$18(a4),d1
	ext.l	d1
	neg.l	d1
loc_02D49A:
	cmp.l	d0,d1
	blt.s	loc_02D4B0
	clr.w	$6C(a4)
	lea.l	sub_02D4BA(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_02D4B0:
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
