; ---------------------------------------------------------------------------
; sub_1F241C	[jt 2445]
; ---------------------------------------------------------------------------
sub_1F241C:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$18(a4),d7
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F2440
	move.w	-$3B9C(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1F2448
loc_1F2440:
	move.w	-$3B9C(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1F2448:
	beq.s	loc_1F248A
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F245E
	move.w	-$3B9A(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1F2466
loc_1F245E:
	move.w	-$3B9A(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1F2466:
	ext.l	d0
	move.l	d0,-(a7)
	movea.l	$8C(a4),a0
	move.w	$14(a0),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$12(a0),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	sub_1F1372(pc)
	lea.l	$10(a7),a7
	bra.s	loc_1F24CE
loc_1F248A:
	clr.w	$1E(a4)
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_1F24AC
	cmpi.w	#$100,$16(a4)
	ble.s	loc_1F24AC
	move.b	-$38DE(a5),d0
	moveq	#$40,d1
	lsl.l	d0,d1
	sub.w	d1,$16(a4)
	bra.s	loc_1F24CE
loc_1F24AC:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_1F24CA
	cmpi.w	#$FF00,$16(a4)
	bge.s	loc_1F24CA
	move.b	-$38DE(a5),d0
	moveq	#$40,d1
	lsl.l	d0,d1
	add.w	d1,$16(a4)
	bra.s	loc_1F24CE
loc_1F24CA:
	clr.w	$16(a4)
loc_1F24CE:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F24E2
	move.w	-$3BA4(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1F24EA
loc_1F24E2:
	move.w	-$3BA4(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1F24EA:
	bne.s	loc_1F24F4
	cmpi.w	#$FC7C,$18(a4)
	ble.s	loc_1F2500
loc_1F24F4:
	movea.l	$8C(a4),a0
	move.w	$E(a0),$20(a4)
	bra.s	loc_1F250A
loc_1F2500:
	movea.l	$8C(a4),a0
	move.w	$C(a0),$20(a4)
loc_1F250A:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$7E(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
