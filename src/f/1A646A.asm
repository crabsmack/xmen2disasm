; ---------------------------------------------------------------------------
; Nightcrawler_StateWaitLeftRelease - after moving onto a ceiling: ignore Left until it is released, then hang
; In:  8(a6) = player
; Out: d0 = +4 flag 8
; Evidence: Left held -> stay; else Nightcrawler_StateCeilingHang
; ---------------------------------------------------------------------------
Nightcrawler_StateWaitLeftRelease:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1A648A
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1A6492
loc_1A648A:
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1A6492:
	beq.s	loc_1A64A8
	clr.w	$6C(a4)
	lea.l	Nightcrawler_StateWaitLeftRelease(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1A64BA
loc_1A64A8:
	clr.w	$6C(a4)
	lea.l	Nightcrawler_StateCeilingHang(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1A64BA:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
