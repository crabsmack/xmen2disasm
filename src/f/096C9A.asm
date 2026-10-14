; ---------------------------------------------------------------------------
; sub_096C9A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_096C9A:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$9C(a4),a3
	move.w	$10(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,d6
	sub.l	$8(a3),d6
	move.w	$12(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,d7
	sub.l	$C(a3),d7
	tst.l	d6
	sge.b	d3
	neg.b	d3
	beq.s	loc_096CD2
	move.l	d6,d0
	bra.s	loc_096CD6
loc_096CD2:
	move.l	d6,d0
	neg.l	d0
loc_096CD6:
	tst.l	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_096CE2
	move.l	d7,d1
	bra.s	loc_096CE6
loc_096CE2:
	move.l	d7,d1
	neg.l	d1
loc_096CE6:
	add.l	d0,d1
	cmpi.l	#$200,d1
	bge.s	loc_096D36
	tst.l	$98(a4)
	bne.s	loc_096D02
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_096D78
loc_096D02:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_096D16
	clr.w	$96(a4)
loc_096D16:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_096D78
