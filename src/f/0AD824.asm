; ---------------------------------------------------------------------------
; sub_0AD824	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0AD824:
	link.w	a6,#$0
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	jsr	sub_0AD486(pc)
	tst.b	-$38DE(a5)
	beq.s	loc_0AD846
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	jsr	sub_0AD486(pc)
loc_0AD846:
	unlk	a6
	rts
