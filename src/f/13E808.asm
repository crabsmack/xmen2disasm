; ---------------------------------------------------------------------------
; sub_13E808	[jt 1880]
; ---------------------------------------------------------------------------
sub_13E808:
	link.w	a6,#$FFF8
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d5
	move.l	$C(a4),d6
	lea.l	$3B32(a5),a0
	movea.l	$2(a0),a3
	clr.w	d7
	move.b	$42(a4),-$4(a6)
	move.b	$43(a4),-$3(a6)
	moveq	#$4,d0
	and.b	$2E(a4),d0
	move.b	d0,-$2(a6)
	moveq	#$8,d0
	and.w	$6(a4),d0
	beq.s	loc_13E848
	moveq	#$1,d0
	bra.s	loc_13E84A
loc_13E848:
	moveq	#$0,d0
loc_13E84A:
	move.b	d0,-$1(a6)
	moveq	#$8,d0
	and.b	$2E(a4),d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_13E85E
	moveq	#$1,d0
	bra.s	loc_13E860
loc_13E85E:
	moveq	#$0,d0
loc_13E860:
	move.b	d0,d4
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	moveq	#$0,d0
	move.b	-$1(a6),d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.b	-$2(a6),d0
	move.l	d0,-(a7)
	move.b	-$3(a6),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.b	-$4(a6),d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	sub_13E36E(pc)
	move.l	a4,d0
	moveq	#$E,d1
	add.l	d1,d0
	move.l	d0,-$8(a6)
	lea.l	$18(a7),a7
loc_13E8A2:
	cmpi.w	#$3E8,(a3)
	bge.s	loc_13E91C
	cmpi.w	#$5,d7
	bge.s	loc_13E91C
	tst.b	d4
	beq.s	loc_13E8D6
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
	move.l	-$8(a6),-(a7)
	jsr	sub_13E490(pc)
	lea.l	$C(a7),a7
	bra.s	loc_13E8FA
loc_13E8D6:
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
	move.l	-$8(a6),-(a7)
	jsr	sub_13E490(pc)
	lea.l	$C(a7),a7
loc_13E8FA:
	move.l	d6,-(a7)
	move.l	d5,-(a7)
	move.l	-$8(a6),-(a7)
	jsr	sub_13E426(pc)
	move.w	d7,d0
	addq.w	#$1,d7
	move.l	-$8(a6),d0
	moveq	#$22,d1
	add.l	d1,-$8(a6)
	addq.w	#$8,a3
	lea.l	$C(a7),a7
	bra.s	loc_13E8A2
loc_13E91C:
	move.w	d7,d0
	movem.l	-$24(a6),d3-d7/a3-a4
	unlk	a6
	rts
