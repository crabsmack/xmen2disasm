; ---------------------------------------------------------------------------
; sub_1B9B02	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1B9B02:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$44(a4)
	beq.s	loc_1B9B1C
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.s	loc_1B9B54
loc_1B9B1C:
	tst.b	$9D(a4)
	bne.s	loc_1B9B32
	move.w	g_PadMaskA(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1B9B40
loc_1B9B32:
	move.w	g_PadMaskA(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_1B9B40:
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.s	loc_1B9B66
loc_1B9B54:
	clr.w	$6C(a4)
	lea.l	sub_1B9B02(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1B9B66:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
