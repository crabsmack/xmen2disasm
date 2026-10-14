; ---------------------------------------------------------------------------
; sub_1418A4	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1418A4:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$E(a6),d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_1418C0
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_1418C6
loc_1418C0:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_1418C6:
	move.w	$10(a4),d1
	sub.w	d0,d1
	movea.l	$10(a6),a0
	move.w	d1,(a0)
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_1418E0
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_1418E6
loc_1418E0:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_1418E6:
	add.w	$12(a4),d0
	movea.l	$14(a6),a0
	move.w	d0,(a0)
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
