; ---------------------------------------------------------------------------
; sub_035750	[link-after-rts]
; ---------------------------------------------------------------------------
sub_035750:
	link.w	a6,#$0
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.b	-$3A02(a5)
	bne.s	loc_035766
	jsr	sub_034D7A(pc)
loc_035766:
	tst.b	-$38DE(a5)
	beq.s	loc_03577E
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.b	-$3A02(a5)
	bne.s	loc_03577E
	jsr	sub_034D7A(pc)
loc_03577E:
	unlk	a6
	rts
