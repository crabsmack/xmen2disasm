; ---------------------------------------------------------------------------
; sub_0DC350	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0DC350:
	link.w	a6,#$0
	movea.l	g_Camera(a5),a0
	move.w	#$C8,$42(a0)
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_0DC370
	jsr	sub_0DC2CE(pc)
loc_0DC370:
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_0DC388
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_0DC388
	jsr	sub_0DC2CE(pc)
loc_0DC388:
	unlk	a6
	rts
