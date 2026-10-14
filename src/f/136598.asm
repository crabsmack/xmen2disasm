; ---------------------------------------------------------------------------
; sub_136598	[link-after-rts]
; ---------------------------------------------------------------------------
sub_136598:
	link.w	a6,#$FFFE
	movem.l	d3-d7/a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$98(a4),a0
	move.w	(a0),d0
	ext.l	d0
	move.l	d0,d6
	lsl.l	#$8,d6
	move.w	$2(a0),d0
	ext.l	d0
	move.l	d0,d7
	lsl.l	#$8,d7
	move.w	$9C(a4),-$2(a6)
	tst.l	d6
	sge.b	d3
	neg.b	d3
	beq.s	loc_1365CC
	move.l	d6,d0
	bra.s	loc_1365D0
loc_1365CC:
	move.l	d6,d0
	neg.l	d0
loc_1365D0:
	move.l	d0,d4
	tst.l	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_1365DE
	move.l	d7,d0
	bra.s	loc_1365E2
loc_1365DE:
	move.l	d7,d0
	neg.l	d0
loc_1365E2:
	move.l	d0,d5
	move.w	-$2(a6),d0
	ext.l	d0
	lsr.l	d0,d4
	move.w	-$2(a6),d0
	ext.l	d0
	lsr.l	d0,d5
	tst.l	d6
	slt.b	d3
	neg.b	d3
	beq.s	loc_136602
	move.l	d4,d0
	neg.l	d0
	bra.s	loc_136604
loc_136602:
	move.l	d4,d0
loc_136604:
	move.l	d0,d6
	tst.l	d7
	slt.b	d3
	neg.b	d3
	beq.s	loc_136614
	move.l	d5,d0
	neg.l	d0
	bra.s	loc_136616
loc_136614:
	move.l	d5,d0
loc_136616:
	move.l	d0,d7
	add.l	d6,$8(a4)
	add.l	d7,$C(a4)
	addq.l	#$4,$98(a4)
	movea.l	$98(a4),a0
	moveq	#$7F,d0
	cmp.w	(a0),d0
	bne.s	loc_136638
	lea.l	$37E2(a5),a0
	move.l	$2(a0),$98(a4)
loc_136638:
	movem.l	-$1A(a6),d3-d7/a4
	unlk	a6
	rts
