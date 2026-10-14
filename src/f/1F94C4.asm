; ---------------------------------------------------------------------------
; sub_1F94C4	[jt 2547]
; ---------------------------------------------------------------------------
sub_1F94C4:
	link.w	a6,#$FFEE
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$C(a6),a3
	movea.l	$10(a6),a4
	clr.w	-$A(a6)
	movea.l	$8(a6),a0
	moveq	#$0,d0
	move.b	$2F(a0),d0
	cmpi.w	#$FF,d0
	bne.s	loc_1F94EE
	moveq	#$0,d0
	bra.w	loc_1F979A
loc_1F94EE:
	move.l	$30(a3),d0
	moveq	#$24,d1
	add.l	d1,d0
	moveq	#$0,d2
	move.b	$2F(a3),d2
	lsl.l	#$4,d2
	add.l	d0,d2
	moveq	#$0,d0
	move.b	$2F(a3),d0
	lsl.l	#$2,d0
	add.l	d2,d0
	move.l	d0,-$4(a6)
	movea.l	$20(a6),a0
	move.w	#$FFFF,(a0)
	movea.l	$1C(a6),a0
	move.w	#$FFFF,(a0)
	moveq	#$10,d0
	and.b	$2E(a3),d0
	beq.s	loc_1F9558
	move.b	#$1,-$A(a6)
	move.w	$16(a6),d0
	ext.l	d0
	move.l	d0,d7
	movea.l	$8(a6),a0
	move.w	$5A(a0),d0
	ext.l	d0
	sub.l	d7,d0
	neg.l	d0
	move.w	d0,-$8(a6)
	movea.l	$8(a6),a0
	move.w	$56(a0),d0
	ext.l	d0
	sub.l	d7,d0
	neg.l	d0
	move.w	d0,d4
	bra.s	loc_1F9574
loc_1F9558:
	move.w	$16(a6),d7
	movea.l	$8(a6),a0
	move.w	$56(a0),d0
	sub.w	d7,d0
	move.w	d0,-$8(a6)
	movea.l	$8(a6),a0
	move.w	$5A(a0),d4
	sub.w	d7,d4
loc_1F9574:
	moveq	#$8,d0
	and.b	$2E(a3),d0
	beq.s	loc_1F95AE
	move.b	#$1,-$9(a6)
	move.w	$1A(a6),d0
	ext.l	d0
	move.l	d0,d7
	movea.l	$8(a6),a0
	move.w	$58(a0),d0
	ext.l	d0
	sub.l	d7,d0
	neg.l	d0
	move.w	d0,-$6(a6)
	movea.l	$8(a6),a0
	move.w	$54(a0),d0
	ext.l	d0
	sub.l	d7,d0
	neg.l	d0
	move.w	d0,d5
	bra.s	loc_1F95CA
loc_1F95AE:
	move.w	$1A(a6),d7
	movea.l	$8(a6),a0
	move.w	$54(a0),d0
	sub.w	d7,d0
	move.w	d0,-$6(a6)
	movea.l	$8(a6),a0
	move.w	$58(a0),d5
	sub.w	d7,d5
loc_1F95CA:
	movea.l	-$4(a6),a0
	moveq	#$1,d0
	and.w	$E(a0),d0
	beq.s	loc_1F95DA
	moveq	#$1,d0
	bra.s	loc_1F95DC
loc_1F95DA:
	moveq	#$0,d0
loc_1F95DC:
	beq.w	loc_1F96F0
	move.b	(a4)+,d0
	ext.w	d0
	move.w	d0,-$10(a6)
	move.b	(a4)+,d0
	ext.w	d0
	move.w	d0,-$E(a6)
	move.b	(a4)+,d0
	ext.w	d0
	move.w	d0,d7
	move.b	(a4)+,d0
	ext.w	d0
	move.w	d0,d6
	cmp.w	-$10(a6),d7
	bge.s	loc_1F9610
	move.w	d7,-$C(a6)
	move.w	-$10(a6),d7
	move.w	-$C(a6),-$10(a6)
loc_1F9610:
	cmp.w	-$E(a6),d6
	bge.s	loc_1F9624
	move.w	d6,-$C(a6)
	move.w	-$E(a6),d6
	move.w	-$C(a6),-$E(a6)
loc_1F9624:
	cmp.w	-$10(a6),d4
	blt.w	loc_1F9798
	cmp.w	-$8(a6),d7
	blt.w	loc_1F9798
	cmp.w	-$E(a6),d5
	blt.w	loc_1F9798
	cmp.w	-$6(a6),d6
	blt.w	loc_1F9798
	move.w	-$10(a6),d0
	cmp.w	-$8(a6),d0
	sgt.b	d3
	neg.b	d3
	beq.s	loc_1F9658
	move.w	-$10(a6),d0
	bra.s	loc_1F965C
loc_1F9658:
	move.w	-$8(a6),d0
loc_1F965C:
	ext.l	d0
	cmp.w	d7,d4
	sgt.b	d3
	neg.b	d3
	beq.s	loc_1F966A
	move.w	d7,d1
	bra.s	loc_1F966C
loc_1F966A:
	move.w	d4,d1
loc_1F966C:
	ext.l	d1
	add.l	d0,d1
	asr.l	#$1,d1
	move.w	d1,-$12(a6)
	move.w	-$E(a6),d0
	cmp.w	-$6(a6),d0
	sgt.b	d3
	neg.b	d3
	beq.s	loc_1F968A
	move.w	-$E(a6),d0
	bra.s	loc_1F968E
loc_1F968A:
	move.w	-$6(a6),d0
loc_1F968E:
	ext.l	d0
	cmp.w	d6,d5
	sgt.b	d3
	neg.b	d3
	beq.s	loc_1F969C
	move.w	d6,d1
	bra.s	loc_1F969E
loc_1F969C:
	move.w	d5,d1
loc_1F969E:
	ext.l	d1
	add.l	d0,d1
	move.l	d1,d7
	asr.l	#$1,d7
	move.l	$8(a3),d0
	asr.l	#$8,d0
	tst.b	-$A(a6)
	beq.s	loc_1F96BC
	move.w	-$12(a6),d1
	ext.l	d1
	neg.l	d1
	bra.s	loc_1F96C2
loc_1F96BC:
	move.w	-$12(a6),d1
	ext.l	d1
loc_1F96C2:
	add.w	d0,d1
	movea.l	$1C(a6),a0
	move.w	d1,(a0)
	move.l	$C(a3),d0
	asr.l	#$8,d0
	tst.b	-$9(a6)
	beq.s	loc_1F96DE
	ext.l	d7
	move.l	d7,d1
	neg.l	d1
	bra.s	loc_1F96E2
loc_1F96DE:
	ext.l	d7
	move.l	d7,d1
loc_1F96E2:
	add.w	d0,d1
	movea.l	$20(a6),a0
	move.w	d1,(a0)
	moveq	#$1,d0
	bra.w	loc_1F979A
loc_1F96F0:
	move.b	(a4)+,d0
	ext.w	d0
	move.w	d0,d7
	move.b	(a4)+,d0
	ext.w	d0
	move.w	d0,d6
	tst.w	d7
	bne.s	loc_1F9706
	tst.w	d6
	beq.w	loc_1F9798
loc_1F9706:
	cmpi.w	#$7F,d7
	bne.s	loc_1F9748
	cmpi.w	#$7F,d6
	bne.s	loc_1F9748
	move.b	(a4)+,d0
	ext.w	d0
	move.w	d0,d7
	move.b	(a4)+,d0
	ext.w	d0
	move.w	d0,d6
	lea.l	$3E(a3),a0
	move.w	d7,d0
	asr.w	#$6,d0
	moveq	#$3,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	add.l	a0,d0
	movea.l	d0,a0
	move.b	(a0),d0
	ext.w	d0
	cmp.w	d0,d6
	beq.s	loc_1F96F0
	moveq	#$3F,d0
	and.w	d7,d0
	moveq	#$0,d1
	move.w	d0,d1
	lsl.l	#$1,d1
	adda.l	d1,a4
	bra.s	loc_1F96F0
loc_1F9748:
	cmp.w	-$8(a6),d7
	blt.s	loc_1F96F0
	cmp.w	d7,d4
	blt.s	loc_1F96F0
	cmp.w	-$6(a6),d6
	blt.s	loc_1F96F0
	cmp.w	d6,d5
	blt.s	loc_1F96F0
	tst.b	-$A(a6)
	beq.s	loc_1F976A
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
	bra.s	loc_1F976E
loc_1F976A:
	ext.l	d7
	move.l	d7,d0
loc_1F976E:
	add.w	$16(a6),d0
	movea.l	$1C(a6),a0
	move.w	d0,(a0)
	tst.b	-$9(a6)
	beq.s	loc_1F9786
	ext.l	d6
	move.l	d6,d0
	neg.l	d0
	bra.s	loc_1F978A
loc_1F9786:
	ext.l	d6
	move.l	d6,d0
loc_1F978A:
	add.w	$1A(a6),d0
	movea.l	$20(a6),a0
	move.w	d0,(a0)
	moveq	#$1,d0
	bra.s	loc_1F979A
loc_1F9798:
	moveq	#$0,d0
loc_1F979A:
	movem.l	-$2E(a6),d3-d7/a3-a4
	unlk	a6
	rts
