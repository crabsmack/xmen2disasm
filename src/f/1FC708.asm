; ---------------------------------------------------------------------------
; sub_1FC708
; ---------------------------------------------------------------------------
sub_1FC708:
	move.w	-$C7A(a5),-$C28(a5)
	tst.b	-$C7D(a5)
	beq.w	sub_1FD520
	move.b	-$C81(a5),d0
	cmp.b	-$BFB(a5),d0
	beq.s	loc_1FC72E
	move.b	d0,-$BFB(a5)
	moveq	#-$1,d0
	move.l	d0,-$C00(a5)
	sf.b	-$BFC(a5)
loc_1FC72E:
	move.w	-$C64(a5),-$C1E(a5)
	move.b	-$C82(a5),d0
	beq.s	loc_1FC76A
	subq.b	#$1,d0
	bne.s	loc_1FC776
	move.w	-$C8A(a5),d0
	mulu.w	-$C88(a5),d0
	movea.l	-$C68(a5),a0
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
	move.w	d0,-$C1C(a5)
	move.w	d0,-$C1A(a5)
	bra.s	loc_1FC794
loc_1FC776:
	move.w	-$C8A(a5),d0
	lsl.w	#$3,d0
	sub.w	-$C86(a5),d0
	lsr.w	#$1,d0
	move.w	d0,-$C1C(a5)
	move.w	-$C88(a5),d0
	lsl.w	#$3,d0
	sub.w	-$C84(a5),d0
	move.w	d0,-$C1A(a5)
loc_1FC794:
	move.w	-$C96(a5),d0
	tst.b	-$C62(a5)
	beq.s	loc_1FC7A2
	addq.w	#$1,d0
	lsr.w	#$1,d0
loc_1FC7A2:
	move.w	d0,-$C26(a5)
	movea.l	-$BEC(a5),a2
	movea.l	-$BF0(a5),a3
	move.w	-$C86(a5),d6
	move.w	-$C84(a5),d7
	tst.b	-$C7E(a5)
	beq.s	loc_1FC7C0
	exg.l	a2,a3
	exg.l	d6,d7
loc_1FC7C0:
	moveq	#$0,d4
	move.w	-$C8C(a5),d4
	divu.w	d7,d4
	move.l	d4,d2
	clr.w	d2
	divu.w	d7,d2
	swap	d4
	move.w	d2,d4
	moveq	#$0,d2
	moveq	#$0,d3
	move.w	-$C26(a5),d0
	tst.b	-$C7F(a5)
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
	move.w	-$C8E(a5),d5
	divu.w	d6,d5
	move.l	d5,d2
	clr.w	d2
	divu.w	d6,d2
	swap	d5
	move.w	d2,d5
	moveq	#$0,d2
	moveq	#$0,d3
	tst.b	-$C80(a5)
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
	move.w	-$C90(a5),d0
	tst.b	-$C7F(a5)
	beq.s	loc_1FC840
	add.w	-$C8C(a5),d0
	subq.w	#$1,d0
loc_1FC840:
	mulu.w	-$C26(a5),d0
	add.w	-$C92(a5),d0
	tst.b	-$C80(a5)
	beq.s	loc_1FC854
	add.w	-$C8E(a5),d0
	subq.w	#$1,d0
loc_1FC854:
	movea.w	d0,a0
	tst.b	-$C62(a5)
	beq.s	loc_1FC862
	adda.l	-$C70(a5),a0
	bra.s	loc_1FC866
loc_1FC862:
	adda.l	-$C6C(a5),a0
loc_1FC866:
	movea.l	-$BE0(a5),a4
	move.l	a4,-$BF8(a5)
	move.w	-$C84(a5),d7
	movea.l	-$BEC(a5),a4
	move.l	a4,-$BF4(a5)
	movea.l	-$C68(a5),a1
	tst.b	-$C7C(a5)
	beq.s	loc_1FC89E
loc_1FC884:
	moveq	#$20,d1
	move.w	d7,d0
	cmp.w	d1,d7
	ble.s	loc_1FC88E
	move.w	d1,d7
loc_1FC88E:
	sub.w	d7,d0
	move.w	d7,-$C20(a5)
	move.w	d0,-$C22(a5)
	sub.w	d7,d1
	move.w	d1,-$C1A(a5)
loc_1FC89E:
	subq.w	#$1,d7
loc_1FC8A0:
	swap	d7
	move.l	a0,d3
	move.l	a1,d6
	tst.b	-$C62(a5)
	beq.s	loc_1FC8CC
	movea.l	-$BDC(a5),a2
	lea.l	Tbl_PixelPairExpand(pc),a3
	move.w	-$C26(a5),d7
	subq.w	#$1,d7
loc_1FC8BA:
	moveq	#$0,d0
	move.b	(a0)+,d0
	add.w	d0,d0
	move.w	(a3,d0.w),(a2)+
	dbra	d7,loc_1FC8BA
	movea.l	-$BDC(a5),a0
loc_1FC8CC:
	movea.l	-$BF0(a5),a2
	subq.w	#$1,-$C24(a5)
	bpl.s	loc_1FC8DC
	movea.l	-$BE4(a5),a3
	bra.s	loc_1FC8E0
loc_1FC8DC:
	movea.l	-$BE8(a5),a3
loc_1FC8E0:
	move.w	-$C86(a5),d7
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
