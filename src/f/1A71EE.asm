; ---------------------------------------------------------------------------
; sub_1A71EE	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1A71EE:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.s	loc_1A726E
	movea.l	$8C(a4),a0
	move.w	$E(a0),$20(a4)
	clr.w	$1E(a4)
	movea.l	$8C(a4),a0
	move.w	$12(a0),$22(a4)
	move.w	$18(a0),$24(a4)
	tst.b	$9D(a4)
	bne.s	loc_1A7238
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1A7246
loc_1A7238:
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_1A7246:
	moveq	#$0,d0
	move.l	d0,$44(a4)
	bclr	#$0,$93(a4)
	andi.l	#$FFFFFFFD,$90(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.s	loc_1A72BC
loc_1A726E:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1A7282
	move.w	-$3BA6(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1A728A
loc_1A7282:
	move.w	-$3BA6(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1A728A:
	beq.s	loc_1A7296
	move.w	#$100,d0
	and.w	$4(a4),d0
	beq.s	loc_1A72AA
loc_1A7296:
	clr.w	$6C(a4)
	lea.l	sub_1A714C(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1A72BC
loc_1A72AA:
	clr.w	$6C(a4)
	lea.l	sub_1A71EE(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1A72BC:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
