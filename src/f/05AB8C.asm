; ---------------------------------------------------------------------------
; sub_05AB8C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_05AB8C:
	link.w	a6,#$0
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.b	-$38DE(a5)
	beq.s	loc_05ABA6
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
loc_05ABA6:
	unlk	a6
	rts
