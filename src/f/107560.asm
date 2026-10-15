; ---------------------------------------------------------------------------
; sub_107560	[link-after-rts]
; ---------------------------------------------------------------------------
sub_107560:
	link.w	a6,#$0
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_107576
	jsr	sub_1073A8(pc)
loc_107576:
	tst.b	-$38DE(a5)
	beq.s	loc_10758E
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_10758E
	jsr	sub_1073A8(pc)
loc_10758E:
	unlk	a6
	rts
