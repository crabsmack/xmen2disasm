; ---------------------------------------------------------------------------
; sub_00FD78	[link-after-rts]
; ---------------------------------------------------------------------------
sub_00FD78:
	link.w	a6,#$0
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	move.w	-$3B32(a5),d0
	addq.w	#$1,-$3B32(a5)
	tst.b	-$38DE(a5)
	beq.s	loc_00FDA2
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	move.w	-$3B32(a5),d0
	addq.w	#$1,-$3B32(a5)
loc_00FDA2:
	jsr	sub_00FCA2(pc)
	unlk	a6
	rts
