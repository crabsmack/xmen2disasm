; ---------------------------------------------------------------------------
; sub_1F33D0	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1F33D0:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$100,d0
	and.w	$4(a4),d0
	bne.s	loc_1F33F2
	move.l	a4,-(a7)
	jsr	sub_1F049E(pc)
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_1F345A
loc_1F33F2:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_1F3420
	tst.b	$9D(a4)
	bne.s	loc_1F3410
	move.w	g_PadMaskLeft(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1F3444
loc_1F3410:
	move.w	g_PadMaskLeft(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
	bra.s	loc_1F3444
loc_1F3420:
	tst.b	$9D(a4)
	bne.s	loc_1F3436
	move.w	g_PadMaskRight(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1F3444
loc_1F3436:
	move.w	g_PadMaskRight(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_1F3444:
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_1F35D2
loc_1F345A:
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.w	loc_1F3506
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F347A
	move.w	g_PadMaskB(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_1F3482
loc_1F347A:
	move.w	g_PadMaskB(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_1F3482:
	bne.w	loc_1F3506
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F349A
	move.w	g_PadMaskC(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_1F34A2
loc_1F349A:
	move.w	g_PadMaskC(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_1F34A2:
	bne.s	loc_1F3506
	moveq	#$10,d0
	and.l	$90(a4),d0
	beq.s	loc_1F34CA
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F34C0
	move.w	g_PadMaskA(a5),d0
	and.w	g_Pad1Released(a5),d0
	bra.s	loc_1F34E6
loc_1F34C0:
	move.w	g_PadMaskA(a5),d0
	and.w	g_Pad2Released(a5),d0
	bra.s	loc_1F34E6
loc_1F34CA:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F34DE
	move.w	g_PadMaskA(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_1F34E6
loc_1F34DE:
	move.w	g_PadMaskA(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_1F34E6:
	bne.s	loc_1F3506
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F34FC
	move.w	g_PadMaskLeftRight(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1F3504
loc_1F34FC:
	move.w	g_PadMaskLeftRight(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1F3504:
	bne.s	loc_1F351C
loc_1F3506:
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_1F35D2
loc_1F351C:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F3530
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1F3538
loc_1F3530:
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1F3538:
	beq.s	loc_1F355E
	moveq	#$0,d0
	move.l	d0,-(a7)
	movea.l	$8C(a4),a0
	move.w	$1E(a0),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.w	$1C(a0),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.l	a4,-(a7)
	jsr	sub_1F3282(pc)
	lea.l	$10(a7),a7
	bra.s	loc_1F359E
loc_1F355E:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F3572
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1F357A
loc_1F3572:
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1F357A:
	beq.s	loc_1F359E
	moveq	#$1,d0
	move.l	d0,-(a7)
	movea.l	$8C(a4),a0
	move.w	$1E(a0),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.w	$1C(a0),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.l	a4,-(a7)
	jsr	sub_1F3282(pc)
	lea.l	$10(a7),a7
loc_1F359E:
	movea.l	$8C(a4),a0
	movea.l	a0,a1
	adda.w	$3E(a1),a0
	move.l	a0,-(a7)
	movea.l	$8C(a4),a0
	movea.l	a0,a1
	adda.w	$42(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	sub_1F32D0(pc)
	lea.l	$C(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_1F33D0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1F35D2:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
