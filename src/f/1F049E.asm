; ---------------------------------------------------------------------------
; sub_1F049E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1F049E:
	link.w	a6,#$0
	movem.l	d3/a3-a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	g_Player1(a5),a0
	cmpa.l	a4,a0
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F04BE
	lea.l	g_Player2(a5),a0
	move.l	a0,d0
	bra.s	loc_1F04C4
loc_1F04BE:
	lea.l	g_Player1(a5),a0
	move.l	a0,d0
loc_1F04C4:
	movea.l	d0,a3
	move.w	$4(a3),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	beq.s	loc_1F04E2
	moveq	#$0,d0
	bra.s	loc_1F0538
loc_1F04E2:
	move.l	#$8000,d0
	and.l	$90(a4),d0
	beq.s	loc_1F050C
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F0502
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_1F0538
loc_1F0502:
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad2Latch(a5),d0
	bra.s	loc_1F0538
loc_1F050C:
	move.l	#$4000,d0
	and.l	$90(a4),d0
	beq.s	loc_1F0536
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F052C
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_1F0538
loc_1F052C:
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad2Latch(a5),d0
	bra.s	loc_1F0538
loc_1F0536:
	moveq	#$0,d0
loc_1F0538:
	movem.l	-$C(a6),d3/a3-a4
	unlk	a6
	rts
