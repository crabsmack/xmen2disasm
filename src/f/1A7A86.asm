; ---------------------------------------------------------------------------
; Nightcrawler_UpdateCharge - NIGHTCRAWLER slot +$76: fill the teleport meter (+$9E) while A is held (twice as fast as the base); empty on release
; In:  8(a6) = player
; Out: d0
; Evidence: not while teleporting (+$90 $800000): A held and +$9E < $20 -> += 2 (4 in two-player), g_HudDirty; A released -> 0
; ---------------------------------------------------------------------------
Nightcrawler_UpdateCharge:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	#$800000,d0
	and.l	$90(a4),d0
	bne.s	loc_1A7ADE
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1A7AB2
	move.w	g_PadMaskA(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1A7ABA
loc_1A7AB2:
	move.w	g_PadMaskA(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1A7ABA:
	beq.s	loc_1A7ADE
	moveq	#$20,d0
	cmp.w	$9E(a4),d0
	ble.s	loc_1A7ADE
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_1A7ACE
	moveq	#$4,d0
	bra.s	loc_1A7AD0
loc_1A7ACE:
	moveq	#$2,d0
loc_1A7AD0:
	ext.w	d0
	add.w	d0,$9E(a4)
	move.b	#$1,g_HudDirty(a5)
	bra.s	loc_1A7B06
loc_1A7ADE:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1A7AF2
	move.w	g_PadMaskA(a5),d0
	and.w	g_Pad1Released(a5),d0
	bra.s	loc_1A7AFA
loc_1A7AF2:
	move.w	g_PadMaskA(a5),d0
	and.w	g_Pad2Released(a5),d0
loc_1A7AFA:
	beq.s	loc_1A7B06
	move.b	#$1,g_HudDirty(a5)
	clr.w	$9E(a4)
loc_1A7B06:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
