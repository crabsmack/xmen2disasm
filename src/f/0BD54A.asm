; ---------------------------------------------------------------------------
; sub_0BD54A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0BD54A:
	link.w	a6,#$FFFC
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$C(a6),a3
	move.w	$2(a3),d5
	move.w	$4(a3),d6
	clr.b	d4
	moveq	#$0,d7
	moveq	#$C,d3
loc_0BD564:
	movea.l	$8(a6),a0
	lea.l	$AE(a0),a0
	move.b	#$FF,(a0,d7.l)
	move.l	d7,d0
	addq.l	#$1,d7
	cmp.l	d7,d3
	bgt.s	loc_0BD564
	movea.l	$8(a6),a0
	moveq	#$0,d0
	move.l	d0,$A6(a0)
	lea.l	-$33D2(a5),a3
	moveq	#$0,d7
	bra.s	loc_0BD5C4
loc_0BD58C:
	move.b	(a3),d0
	ext.w	d0
	move.w	#$80,d1
	and.b	d0,d1
	beq.s	loc_0BD5BC
	moveq	#$1A,d0
	cmp.b	$1(a3),d0
	bne.s	loc_0BD5BC
	cmp.w	$8(a3),d5
	blt.s	loc_0BD5BC
	cmp.w	$C(a3),d5
	bgt.s	loc_0BD5BC
	cmp.w	$A(a3),d6
	blt.s	loc_0BD5BC
	cmp.w	$E(a3),d6
	bgt.s	loc_0BD5BC
	moveq	#$1,d4
	bra.s	loc_0BD5CE
loc_0BD5BC:
	move.l	d7,d0
	addq.l	#$1,d7
	lea.l	$14(a3),a3
loc_0BD5C4:
	move.w	-$3474(a5),d0
	ext.l	d0
	cmp.l	d7,d0
	bge.s	loc_0BD58C
loc_0BD5CE:
	tst.b	d4
	beq.w	loc_0BD6D8
	move.w	$8(a3),-$4(a6)
	move.w	$A(a3),-$2(a6)
	move.w	$C(a3),d5
	move.w	$E(a3),d4
	moveq	#$0,d6
	movea.l	$8(a6),a0
	move.l	a3,$A6(a0)
	lea.l	-$33D2(a5),a4
	moveq	#$0,d7
	bra.w	loc_0BD6CC
loc_0BD5FC:
	move.b	(a4),d0
	ext.w	d0
	move.w	#$80,d1
	and.b	d0,d1
	beq.w	loc_0BD6C4
	moveq	#$13,d0
	cmp.b	$1(a4),d0
	bgt.s	loc_0BD61A
	moveq	#$1C,d0
	cmp.b	$1(a4),d0
	bge.s	loc_0BD688
loc_0BD61A:
	move.w	$8(a4),d0
	ext.l	d0
	move.w	$C(a4),d1
	ext.l	d1
	sub.l	d1,d0
	sge.b	d3
	neg.b	d3
	beq.s	loc_0BD63E
	move.w	$8(a4),d0
	ext.l	d0
	move.w	$C(a4),d1
	ext.l	d1
	sub.l	d1,d0
	bra.s	loc_0BD64E
loc_0BD63E:
	move.w	$8(a4),d0
	ext.l	d0
	move.w	$C(a4),d1
	ext.l	d1
	sub.l	d1,d0
	neg.l	d0
loc_0BD64E:
	move.w	$A(a4),d1
	ext.l	d1
	move.w	$E(a4),d2
	ext.l	d2
	sub.l	d2,d1
	sge.b	d3
	neg.b	d3
	beq.s	loc_0BD672
	move.w	$A(a4),d1
	ext.l	d1
	move.w	$E(a4),d2
	ext.l	d2
	sub.l	d2,d1
	bra.s	loc_0BD682
loc_0BD672:
	move.w	$A(a4),d1
	ext.l	d1
	move.w	$E(a4),d2
	ext.l	d2
	sub.l	d2,d1
	neg.l	d1
loc_0BD682:
	lsl.l	#$2,d1
	cmp.l	d0,d1
	bge.s	loc_0BD6C4
loc_0BD688:
	moveq	#$1A,d0
	cmp.b	$1(a4),d0
	beq.s	loc_0BD6C4
	move.w	-$4(a6),d0
	cmp.w	$C(a4),d0
	bgt.s	loc_0BD6C4
	cmp.w	$8(a4),d5
	blt.s	loc_0BD6C4
	move.w	-$2(a6),d0
	cmp.w	$E(a4),d0
	bgt.s	loc_0BD6C4
	cmp.w	$A(a4),d4
	blt.s	loc_0BD6C4
	movea.l	$8(a6),a0
	lea.l	$AE(a0),a0
	move.b	d7,(a0,d6.l)
	addq.l	#$1,d6
	moveq	#$C,d0
	cmp.l	d6,d0
	ble.s	loc_0BD6D8
loc_0BD6C4:
	move.l	d7,d0
	addq.l	#$1,d7
	lea.l	$14(a4),a4
loc_0BD6CC:
	move.w	-$3474(a5),d0
	ext.l	d0
	cmp.l	d7,d0
	bge.w	loc_0BD5FC
loc_0BD6D8:
	movem.l	-$20(a6),d3-d7/a3-a4
	unlk	a6
	rts
