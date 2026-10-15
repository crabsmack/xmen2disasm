; ---------------------------------------------------------------------------
; sub_1F39C4	[jt 2463]
; ---------------------------------------------------------------------------
sub_1F39C4:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F39E4
	move.w	-$3B9C(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1F39EC
loc_1F39E4:
	move.w	-$3B9C(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1F39EC:
	beq.w	loc_1F3A7E
	move.w	#$100,d0
	and.w	$4(a4),d0
	bne.w	loc_1F3A7E
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F3A10
	move.w	-$3B9A(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1F3A18
loc_1F3A10:
	move.w	-$3B9A(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1F3A18:
	beq.s	loc_1F3A34
	tst.b	$9D(a4)
	bne.s	loc_1F3A2A
	move.w	-$3B9A(a5),d0
	or.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1F3A6A
loc_1F3A2A:
	move.w	-$3B9A(a5),d0
	or.w	d0,g_Pad2Latch(a5)
	bra.s	loc_1F3A6A
loc_1F3A34:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F3A48
	move.w	-$3B98(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1F3A50
loc_1F3A48:
	move.w	-$3B98(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1F3A50:
	beq.s	loc_1F3A6A
	tst.b	$9D(a4)
	bne.s	loc_1F3A62
	move.w	-$3B98(a5),d0
	or.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1F3A6A
loc_1F3A62:
	move.w	-$3B98(a5),d0
	or.w	d0,g_Pad2Latch(a5)
loc_1F3A6A:
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.s	loc_1F3AD4
loc_1F3A7E:
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	tst.b	$9D(a4)
	bne.s	loc_1F3AA0
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1F3AAE
loc_1F3AA0:
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_1F3AAE:
	movea.l	$8C(a4),a0
	movea.l	a0,a1
	adda.w	$42(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_1F383A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1F3AD4:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
