; ---------------------------------------------------------------------------
; sub_1FC708
; ---------------------------------------------------------------------------
sub_1FC708:
	move.w	g_ScalerParams+$1C(a5),g_ScalerBudget(a5)
	tst.b	g_ScalerParams+$19(a5)
	beq.w	sub_1FD520
	move.b	g_ScalerParams+$15(a5),d0
	cmp.b	g_ScalerTableKey(a5),d0
	beq.s	loc_1FC72E
	move.b	d0,g_ScalerTableKey(a5)
	moveq	#-$1,d0
	move.l	d0,g_ScalerSizeKey(a5)
	sf.b	-$BFC(a5)
loc_1FC72E:
	move.w	g_ScalerVram(a5),g_ScalerVramCursor(a5)
	move.b	g_ScalerParams+$14(a5),d0
	beq.s	loc_1FC76A
	subq.b	#$1,d0
	bne.s	loc_1FC776
	move.w	g_ScalerParams+$C(a5),d0
	mulu.w	g_ScalerParams+$E(a5),d0
	movea.l	g_ScalerDest(a5),a0
	move.w	d0,d1
	lsl.w	#$5,d1
	adda.w	d1,a0
	moveq	#$0,d1
	move.l	d1,d2
	move.l	d1,d3
	move.l	d1,d4
	movea.l	d1,a1
	movea.l	d1,a2
	movea.l	d1,a3
	movea.l	d1,a4
	subq.w	#$1,d0
loc_1FC762:
	movem.l	d1-d4/a1-a4,-(a0)
	dbra	d0,loc_1FC762
loc_1FC76A:
	moveq	#$0,d0
	move.w	d0,g_ScalerOffsetX(a5)
	move.w	d0,g_ScalerRowsLeft(a5)
	bra.s	loc_1FC794
loc_1FC776:
	move.w	g_ScalerParams+$C(a5),d0
	lsl.w	#$3,d0
	sub.w	g_ScalerParams+$10(a5),d0
	lsr.w	#$1,d0
	move.w	d0,g_ScalerOffsetX(a5)
	move.w	g_ScalerParams+$E(a5),d0
	lsl.w	#$3,d0
	sub.w	g_ScalerParams+$12(a5),d0
	move.w	d0,g_ScalerRowsLeft(a5)
loc_1FC794:
	move.w	g_ScalerParams(a5),d0
	tst.b	g_ScalerHalfWidth(a5)
	beq.s	loc_1FC7A2
	addq.w	#$1,d0
	lsr.w	#$1,d0
loc_1FC7A2:
	move.w	d0,-$C26(a5)
	movea.l	g_ScalerLine1(a5),a2
	movea.l	g_ScalerLine0(a5),a3
	move.w	g_ScalerParams+$10(a5),d6
	move.w	g_ScalerParams+$12(a5),d7
	tst.b	g_ScalerParams+$18(a5)
	beq.s	loc_1FC7C0
	exg.l	a2,a3
	exg.l	d6,d7
loc_1FC7C0:
	moveq	#$0,d4
	move.w	g_ScalerParams+$A(a5),d4
	divu.w	d7,d4
	move.l	d4,d2
	clr.w	d2
	divu.w	d7,d2
	swap	d4
	move.w	d2,d4
	moveq	#$0,d2
	moveq	#$0,d3
	move.w	-$C26(a5),d0
	tst.b	g_ScalerParams+$17(a5)
	beq.s	loc_1FC7E2
	neg.w	d0
loc_1FC7E2:
	subq.w	#$1,d7
loc_1FC7E4:
	add.l	d4,d2
	move.l	d2,d1
	swap	d1
	muls.w	d0,d1
	sub.w	d3,d1
	move.w	d1,(a2)+
	add.w	d1,d3
	dbra	d7,loc_1FC7E4
	moveq	#$0,d5
	move.w	g_ScalerParams+$8(a5),d5
	divu.w	d6,d5
	move.l	d5,d2
	clr.w	d2
	divu.w	d6,d2
	swap	d5
	move.w	d2,d5
	moveq	#$0,d2
	moveq	#$0,d3
	tst.b	g_ScalerParams+$16(a5)
	beq.s	loc_1FC816
	neg.l	d5
	moveq	#-$1,d3
loc_1FC816:
	subq.w	#$1,d6
loc_1FC818:
	add.l	d5,d2
	move.l	d2,d1
	swap	d1
	sub.w	d3,d1
	move.w	d1,(a3)+
	add.w	d1,d3
	dbra	d6,loc_1FC818
	bsr.w	sub_1FC1FA
	moveq	#-$10,d4
	moveq	#$F,d5
	move.w	g_ScalerParams+$6(a5),d0
	tst.b	g_ScalerParams+$17(a5)
	beq.s	loc_1FC840
	add.w	g_ScalerParams+$A(a5),d0
	subq.w	#$1,d0
loc_1FC840:
	mulu.w	-$C26(a5),d0
	add.w	g_ScalerParams+$4(a5),d0
	tst.b	g_ScalerParams+$16(a5)
	beq.s	loc_1FC854
	add.w	g_ScalerParams+$8(a5),d0
	subq.w	#$1,d0
loc_1FC854:
	movea.w	d0,a0
	tst.b	g_ScalerHalfWidth(a5)
	beq.s	loc_1FC862
	adda.l	g_ScalerSrcA(a5),a0
	bra.s	loc_1FC866
loc_1FC862:
	adda.l	g_ScalerSrcB(a5),a0
loc_1FC866:
	movea.l	g_ScalerLine4(a5),a4
	move.l	a4,g_ScalerRowStep(a5)
	move.w	g_ScalerParams+$12(a5),d7
	movea.l	g_ScalerLine1(a5),a4
	move.l	a4,g_ScalerColStep(a5)
	movea.l	g_ScalerDest(a5),a1
	tst.b	g_ScalerParams+$1A(a5)
	beq.s	loc_1FC89E
loc_1FC884:
	moveq	#$20,d1
	move.w	d7,d0
	cmp.w	d1,d7
	ble.s	loc_1FC88E
	move.w	d1,d7
loc_1FC88E:
	sub.w	d7,d0
	move.w	d7,g_ScalerChunkRow(a5)
	move.w	d0,g_ScalerChunkLeft(a5)
	sub.w	d7,d1
	move.w	d1,g_ScalerRowsLeft(a5)
loc_1FC89E:
	subq.w	#$1,d7
loc_1FC8A0:
	swap	d7
	move.l	a0,d3
	move.l	a1,d6
	tst.b	g_ScalerHalfWidth(a5)
	beq.s	loc_1FC8CC
	movea.l	g_ScalerLine5(a5),a2
	lea.l	Tbl_PixelPairExpand(pc),a3
	move.w	-$C26(a5),d7
	subq.w	#$1,d7
loc_1FC8BA:
	moveq	#$0,d0
	move.b	(a0)+,d0
	add.w	d0,d0
	move.w	(a3,d0.w),(a2)+
	dbra	d7,loc_1FC8BA
	movea.l	g_ScalerLine5(a5),a0
loc_1FC8CC:
	movea.l	g_ScalerLine0(a5),a2
	subq.w	#$1,g_ScalerRowCount(a5)
	bpl.s	loc_1FC8DC
	movea.l	g_ScalerLine3(a5),a3
	bra.s	loc_1FC8E0
loc_1FC8DC:
	movea.l	g_ScalerLine2(a5),a3
loc_1FC8E0:
	move.w	g_ScalerParams+$10(a5),d7
	move.w	d7,d2
	lsr.w	#$1,d7
	beq.w	loc_1FD43E
	neg.w	d7
	addi.w	#$A0,d7
	add.w	d7,d7
	move.w	d7,d0
	lsl.w	#$3,d7
	add.w	d0,d7
	jmp	Tbl_1FC8FE(pc,d7.w)
