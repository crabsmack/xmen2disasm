; ---------------------------------------------------------------------------
; sub_1A757E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1A757E:
	link.w	a6,#$FFFC
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d3
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.s	loc_1A75CC
	move.l	d3,-$4(a6)
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	move.l	d3,d0
	move.l	-$4(a6),d3
	tst.b	d0
	beq.s	loc_1A75B6
	move.w	g_PadMaskDown(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1A75BE
loc_1A75B6:
	move.w	g_PadMaskDown(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1A75BE:
	beq.s	loc_1A75CC
	movea.l	$76(a4),a0
	tst.b	$2(a0)
	ble.s	loc_1A75CC
	moveq	#$1,d3
loc_1A75CC:
	move.b	d3,d7
	move.l	#$800000,d0
	and.l	$90(a4),d0
	beq.s	loc_1A75F0
	clr.w	$6C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1A76DC
loc_1A75F0:
	move.w	#$1,$10(a4)
	ori.l	#$800000,$90(a4)
	move.w	#$3C,$6A(a4)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	move.l	a4,-(a7)
	jsr	$4E7A(a5)	; -> Obj_Detach
	ori.l	#$8,$90(a4)
	ori.l	#$40,$90(a4)
	clr.b	$70(a4)
	pea.l	($85).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($85).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$44A2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	tst.b	d7
	lea.l	$14(a7),a7
	beq.s	loc_1A765A
	subq.w	#$8,$9E(a4)
	andi.b	#$F3,$9D(a4)
loc_1A765A:
	moveq	#$E,d0
	cmp.w	$9E(a4),d0
	sgt.b	d3
	neg.b	d3
	beq.s	loc_1A766A
	moveq	#$E,d0
	bra.s	loc_1A766E
loc_1A766A:
	move.w	$9E(a4),d0
loc_1A766E:
	move.w	d0,$C4(a4)
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1A7684
	moveq	#$F,d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1A768A
loc_1A7684:
	moveq	#$F,d0
	and.w	g_Pad2Held(a5),d0
loc_1A768A:
	move.w	d0,$C2(a4)
	beq.s	loc_1A76C8
	ori.l	#$200000,$90(a4)
	tst.b	d7
	beq.s	loc_1A76B2
	move.w	#$FF,$6C(a4)
	lea.l	sub_1A7730(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1A76DC
loc_1A76B2:
	move.w	#$FF,$6C(a4)
	lea.l	sub_1A76E6(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1A76DC
loc_1A76C8:
	move.w	#$FF,$6C(a4)
	lea.l	sub_1A78BC(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1A76DC:
	movem.l	-$10(a6),d3/d7/a4
	unlk	a6
	rts
