; ---------------------------------------------------------------------------
; sub_1A6C48	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1A6C48:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$BC(a4),a0
	move.w	$E(a0),d0
	ext.l	d0
	move.w	$4C(a4),d1
	ext.l	d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	add.l	d0,$C(a4)
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1A6C80
	move.w	g_PadMaskC(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_1A6C88
loc_1A6C80:
	move.w	g_PadMaskC(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_1A6C88:
	beq.s	loc_1A6D06
	movea.l	$8C(a4),a0
	move.w	$12(a0),$22(a4)
	move.w	$E(a0),$20(a4)
	moveq	#$0,d0
	move.l	d0,$44(a4)
	move.b	#$1,-$3892(a5)
	andi.w	#$DFFF,$6(a4)
	moveq	#$0,d1
	move.w	$C0(a4),d1
	moveq	#-$4,d2
	and.w	d1,d2
	moveq	#$0,d1
	move.w	d2,d1
	moveq	#$0,d2
	or.w	d1,d2
	move.w	d2,$C0(a4)
	move.w	$4C(a4),d5
	pea.l	($C8).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.l	a4,-(a7)
	jsr	$4DDA(a5)	; -> Obj_UpdateBox
	ext.l	d5
	move.w	$4C(a4),d0
	ext.l	d0
	move.l	d5,d1
	sub.l	d0,d1
	lsl.l	#$8,d1
	add.l	d1,$C(a4)
	lea.l	$C(a7),a7
	clr.w	$6C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1A6FD2
loc_1A6D06:
	move.w	#$100,d0
	and.w	$4(a4),d0
	beq.w	loc_1A6DF6
	move.l	$C(a4),d5
	asr.l	#$8,d5
	move.w	$4C(a4),d6
	moveq	#$0,d0
	move.b	$7B(a4),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_Segs(a5),a0
	lea.l	(a0,d0.w),a3
	moveq	#$0,d0
	move.l	d0,$44(a4)
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$F2(a0),a1
	jsr	(a1)
	move.w	d0,d7
	addq.w	#$8,a7
	beq.w	loc_1A6DEE
	move.l	a3,$BC(a4)
	moveq	#$0,d0
	move.w	$C0(a4),d0
	moveq	#-$4,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	ext.l	d7
	move.l	d7,d1
	or.l	d0,d1
	move.w	d1,$C0(a4)
	move.b	#$1,-$3892(a5)
	pea.l	($8D).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.l	a4,-(a7)
	jsr	$4DDA(a5)	; -> Obj_UpdateBox
	ext.l	d6
	ext.l	d5
	move.l	d6,d0
	add.l	d5,d0
	move.w	$4C(a4),d1
	ext.l	d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	cmpi.w	#$2,d7
	lea.l	$C(a7),a7
	bne.s	loc_1A6DBE
	movea.l	$BC(a4),a0
	move.w	$C(a0),d0
	ext.l	d0
	move.w	$4E(a4),d1
	ext.l	d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	add.l	d0,$8(a4)
	bra.s	loc_1A6DD6
loc_1A6DBE:
	movea.l	$BC(a4),a0
	move.w	$8(a0),d0
	ext.l	d0
	move.w	$52(a4),d1
	ext.l	d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	add.l	d0,$8(a4)
loc_1A6DD6:
	move.w	#$7,$6C(a4)
	lea.l	sub_1A6B36(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1A6FD2
loc_1A6DEE:
	clr.w	$1E(a4)
	clr.w	$16(a4)
loc_1A6DF6:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1A6E0A
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1A6E12
loc_1A6E0A:
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1A6E12:
	beq.w	loc_1A6EDA
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_1A6E8A
	andi.b	#$EF,$2E(a4)
	move.l	$BC(a4),-(a7)
	moveq	#$1B,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4BEA(a5)	; -> sub_1F1478
	tst.b	d0
	lea.l	$C(a7),a7
	bne.s	loc_1A6E6C
	move.w	#$208,$16(a4)
	lea.l	$447A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	move.b	#$1,-$3892(a5)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_1A6A5C(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1A6FD2
loc_1A6E6C:
	clr.w	$1E(a4)
	clr.w	$16(a4)
	clr.w	$6C(a4)
	lea.l	sub_1A6C48(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1A6FD2
loc_1A6E8A:
	move.l	$BC(a4),-(a7)
	moveq	#-$5,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4BEA(a5)	; -> sub_1F1478
	tst.b	d0
	lea.l	$C(a7),a7
	bne.s	loc_1A6EBC
	move.w	#$208,$16(a4)
	clr.w	$6C(a4)
	lea.l	sub_1A6C48(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1A6FD2
loc_1A6EBC:
	clr.w	$1E(a4)
	clr.w	$16(a4)
	clr.w	$6C(a4)
	lea.l	sub_1A6C48(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1A6FD2
loc_1A6EDA:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1A6EEE
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1A6EF6
loc_1A6EEE:
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1A6EF6:
	beq.w	loc_1A6FB8
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_1A6F6C
	ori.b	#$10,$2E(a4)
	move.l	$BC(a4),-(a7)
	moveq	#$1B,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4BEA(a5)	; -> sub_1F1478
	tst.b	d0
	lea.l	$C(a7),a7
	bne.s	loc_1A6F50
	move.w	#$FDF8,$16(a4)
	lea.l	$447A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	move.b	#$1,-$3892(a5)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_1A6A5C(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1A6FD2
loc_1A6F50:
	clr.w	$1E(a4)
	clr.w	$16(a4)
	clr.w	$6C(a4)
	lea.l	sub_1A6C48(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1A6FD2
loc_1A6F6C:
	move.l	$BC(a4),-(a7)
	moveq	#-$5,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4BEA(a5)	; -> sub_1F1478
	tst.b	d0
	lea.l	$C(a7),a7
	bne.s	loc_1A6F9C
	move.w	#$FDF8,$16(a4)
	clr.w	$6C(a4)
	lea.l	sub_1A6C48(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1A6FD2
loc_1A6F9C:
	clr.w	$1E(a4)
	clr.w	$16(a4)
	clr.w	$6C(a4)
	lea.l	sub_1A6C48(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1A6FD2
loc_1A6FB8:
	clr.w	$1E(a4)
	clr.w	$16(a4)
	clr.w	$6C(a4)
	lea.l	sub_1A6C48(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1A6FD2:
	movem.l	-$18(a6),d3/d5-d7/a3-a4
	unlk	a6
	rts
