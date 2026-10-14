; ---------------------------------------------------------------------------
; sub_05DBE6	[link-after-rts]
; ---------------------------------------------------------------------------
sub_05DBE6:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$10(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	$8(a4),d7
	sub.l	d0,d7
	tst.l	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_05DC0C
	move.l	d7,d0
	bra.s	loc_05DC10
loc_05DC0C:
	move.l	d7,d0
	neg.l	d0
loc_05DC10:
	tst.w	$16(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_05DC22
	move.w	$16(a4),d1
	ext.l	d1
	bra.s	loc_05DC2A
loc_05DC22:
	move.w	$16(a4),d1
	ext.l	d1
	neg.l	d1
loc_05DC2A:
	cmp.l	d0,d1
	ble.s	loc_05DC40
	clr.w	$6C(a4)
	lea.l	sub_05DC4A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_05DC40:
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
