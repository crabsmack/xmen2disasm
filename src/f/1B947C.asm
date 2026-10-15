; ---------------------------------------------------------------------------
; sub_1B947C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1B947C:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$A6(a4)
	bgt.s	loc_1B94CA
	movea.l	g_Camera(a5),a0
	moveq	#$8,d0
	and.w	$4A(a0),d0
	bne.s	loc_1B94CA
	moveq	#$0,d0
	move.b	$3A(a4),d0
	cmpi.w	#$FF,d0
	bne.s	loc_1B94CA
	move.l	#$200000,d0
	and.l	$90(a4),d0
	bne.s	loc_1B94CA
	ori.l	#$40000,$90(a4)
	movea.l	g_Camera(a5),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$2A(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_1B94CA:
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.s	loc_1B952E
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1B94E8
	move.w	-$3BA0(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1B94F0
loc_1B94E8:
	move.w	-$3BA0(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1B94F0:
	beq.s	loc_1B952E
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1B9506
	move.w	-$3BA6(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_1B950E
loc_1B9506:
	move.w	-$3BA6(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_1B950E:
	bne.s	loc_1B952E
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1B9524
	move.w	-$3BA8(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_1B952C
loc_1B9524:
	move.w	-$3BA8(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_1B952C:
	beq.s	loc_1B954C
loc_1B952E:
	andi.l	#$FFDFFFFF,$90(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_1B9762
loc_1B954C:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1B9560
	move.w	-$3BA4(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_1B9568
loc_1B9560:
	move.w	-$3BA4(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_1B9568:
	beq.w	loc_1B96AA
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1B9580
	move.w	-$3B9A(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1B9588
loc_1B9580:
	move.w	-$3B9A(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1B9588:
	beq.s	loc_1B95DE
	andi.b	#$EF,$2E(a4)
	move.w	#$760,$22(a4)
	move.w	#$760,$16(a4)
	move.w	#$FFC5,$1E(a4)
	move.w	#$12,$6E(a4)
	lea.l	$456A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	ori.l	#$200000,$90(a4)
	andi.l	#$FFFFFFFD,$90(a4)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_1B92C0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1B9762
loc_1B95DE:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1B95F2
	move.w	-$3B98(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1B95FA
loc_1B95F2:
	move.w	-$3B98(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1B95FA:
	beq.s	loc_1B9650
	ori.b	#$10,$2E(a4)
	move.w	#$760,$22(a4)
	move.w	#$F8A0,$16(a4)
	move.w	#$3B,$1E(a4)
	move.w	#$12,$6E(a4)
	lea.l	$456A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	ori.l	#$200000,$90(a4)
	andi.l	#$FFFFFFFD,$90(a4)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_1B92C0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1B9762
loc_1B9650:
	movea.l	$76(a4),a0
	tst.b	$2(a0)
	ble.w	loc_1B973C
	tst.b	$9D(a4)
	bne.s	loc_1B9672
	move.w	-$3BA4(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1B9680
loc_1B9672:
	move.w	-$3BA4(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_1B9680:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$86(a0),a1
	jsr	(a1)
	andi.l	#$FFDFFFFF,$90(a4)
	addq.w	#$4,a7
	clr.w	$6C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1B9762
loc_1B96AA:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1B96BE
	move.w	-$3B9A(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_1B96C6
loc_1B96BE:
	move.w	-$3B9A(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_1B96C6:
	beq.s	loc_1B96F4
	tst.b	$9D(a4)
	bne.s	loc_1B96DE
	move.w	-$3B9A(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1B96EC
loc_1B96DE:
	move.w	-$3B9A(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_1B96EC:
	andi.b	#$EF,$2E(a4)
	bra.s	loc_1B973C
loc_1B96F4:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1B9708
	move.w	-$3B98(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_1B9710
loc_1B9708:
	move.w	-$3B98(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_1B9710:
	beq.s	loc_1B973C
	tst.b	$9D(a4)
	bne.s	loc_1B9728
	move.w	-$3B98(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1B9736
loc_1B9728:
	move.w	-$3B98(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_1B9736:
	ori.b	#$10,$2E(a4)
loc_1B973C:
	movea.l	$8C(a4),a0
	movea.l	a0,a1
	adda.w	$46(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> sub_1F6296
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_1B947C(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1B9762:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
