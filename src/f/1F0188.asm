; ---------------------------------------------------------------------------
; sub_1F0188	[jt 2409]
; ---------------------------------------------------------------------------
sub_1F0188:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.l	$A6(a4)
	clr.w	$1E(a4)
	movea.l	$8C(a4),a0
	move.w	$E(a0),$20(a4)
	moveq	#$8,d0
	and.l	$90(a4),d0
	beq.s	loc_1F01D6
	clr.w	$AA(a4)
	tst.b	$9D(a4)
	bne.s	loc_1F01C6
	move.w	-$3BA4(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1F01E4
loc_1F01C6:
	move.w	-$3BA4(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
	bra.s	loc_1F01E4
loc_1F01D6:
	move.l	a4,-(a7)
	jsr	sub_1F00F6(pc)
	move.w	#$F,$AA(a4)
	addq.w	#$4,a7
loc_1F01E4:
	andi.l	#$FFFFFDFF,$90(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
