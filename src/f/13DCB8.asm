; ---------------------------------------------------------------------------
; sub_13DCB8	[jt 1876]
; ---------------------------------------------------------------------------
sub_13DCB8:
	link.w	a6,#$FFF6
	movem.l	d3-d7/a3-a4,-(a7)
	move.w	$E(a6),d7
	movea.l	$8(a6),a4
	move.l	$8(a4),d5
	move.l	$C(a4),d6
	clr.w	d4
	move.b	$42(a4),-$5(a6)
	move.b	$43(a4),-$4(a6)
	moveq	#$4,d0
	and.b	$2E(a4),d0
	move.b	d0,-$3(a6)
	moveq	#$8,d0
	and.w	$6(a4),d0
	beq.s	loc_13DCF4
	moveq	#$1,d0
	bra.s	loc_13DCF6
loc_13DCF4:
	moveq	#$0,d0
loc_13DCF6:
	move.b	d0,-$2(a6)
	moveq	#$8,d0
	and.b	$2E(a4),d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_13DD0A
	moveq	#$1,d0
	bra.s	loc_13DD0C
loc_13DD0A:
	moveq	#$0,d0
loc_13DD0C:
	move.b	d0,-$1(a6)
	move.w	#$FF,d0
	and.w	d7,d0
	subq.w	#$1,d0
	beq.s	loc_13DD36
	subq.w	#$1,d0
	beq.s	loc_13DD2C
	subq.w	#$1,d0
	bne.s	loc_13DD36
	lea.l	$3B3A(a5),a0
	movea.l	$2(a0),a3
	bra.s	loc_13DD3E
loc_13DD2C:
	lea.l	$3B2A(a5),a0
	movea.l	$2(a0),a3
	bra.s	loc_13DD3E
loc_13DD36:
	lea.l	$3B32(a5),a0
	movea.l	$2(a0),a3
loc_13DD3E:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	moveq	#$0,d0
	move.b	-$2(a6),d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.b	-$3(a6),d0
	move.l	d0,-(a7)
	move.b	-$4(a6),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.b	-$5(a6),d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	sub_13D954(pc)
	move.l	a4,d0
	moveq	#$E,d1
	add.l	d1,d0
	move.l	d0,-$A(a6)
	lea.l	$18(a7),a7
loc_13DD7E:
	cmpi.w	#$3E8,(a3)
	bge.w	loc_13DE2C
	cmpi.w	#$A,d4
	bge.w	loc_13DE2C
	tst.b	-$1(a6)
	beq.s	loc_13DDB8
	move.w	$2(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	add.l	d6,d0
	move.l	d0,-(a7)
	move.w	(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	add.l	d5,d0
	move.l	d0,-(a7)
	move.l	-$A(a6),-(a7)
	jsr	sub_13DA50(pc)
	lea.l	$C(a7),a7
	bra.s	loc_13DDDC
loc_13DDB8:
	move.w	$2(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d6,d1
	sub.l	d0,d1
	move.l	d1,-(a7)
	move.w	(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	add.l	d5,d0
	move.l	d0,-(a7)
	move.l	-$A(a6),-(a7)
	jsr	sub_13DA50(pc)
	lea.l	$C(a7),a7
loc_13DDDC:
	cmpi.w	#$FF,d7
	ble.s	loc_13DE08
	move.w	#$100,d0
	and.w	d7,d0
	beq.s	loc_13DDF6
	movea.l	-$A(a6),a0
	move.b	#$2,$11(a0)
	bra.s	loc_13DE08
loc_13DDF6:
	move.w	#$200,d0
	and.w	d7,d0
	beq.s	loc_13DE08
	movea.l	-$A(a6),a0
	move.b	#$3,$11(a0)
loc_13DE08:
	move.l	d6,-(a7)
	move.l	d5,-(a7)
	move.l	-$A(a6),-(a7)
	jsr	sub_13DA0C(pc)
	move.w	d4,d0
	addq.w	#$1,d4
	move.l	-$A(a6),d0
	moveq	#$12,d1
	add.l	d1,-$A(a6)
	addq.w	#$8,a3
	lea.l	$C(a7),a7
	bra.w	loc_13DD7E
loc_13DE2C:
	movem.l	-$26(a6),d3-d7/a3-a4
	unlk	a6
	rts
