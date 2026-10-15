; ---------------------------------------------------------------------------
; XPlayer_Walk - XPLAYER slot +$AE: start walking toward the latched direction
; In:  8(a6) = player
; Out: none
; Evidence: XPlayer_WalkAccel(char +$1C, +$1E, Right latched), anim 0, clears the Left/Right latch, state XPlayer_StateWalk
; ---------------------------------------------------------------------------
XPlayer_Walk:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F3362
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_1F336A
loc_1F3362:
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_1F336A:
	ext.l	d0
	move.l	d0,-(a7)
	movea.l	$8C(a4),a0
	move.w	$1E(a0),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$1C(a0),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	XPlayer_WalkAccel(pc)
	moveq	#$0,d0
	move.l	d0,$44(a4)
	tst.b	$9D(a4)
	lea.l	$10(a7),a7
	bne.s	loc_1F33A8
	move.w	g_PadMaskLeftRight(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1F33B6
loc_1F33A8:
	move.w	g_PadMaskLeftRight(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_1F33B6:
	lea.l	XPlayer_StateWalk(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	XPlayer_StateWalk(pc)
	addq.w	#$4,a7
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
