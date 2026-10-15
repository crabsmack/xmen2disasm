; ---------------------------------------------------------------------------
; sub_0226F4	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0226F4:
	link.w	a6,#$0
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.b	-$38DE(a5)
	beq.s	loc_02270E
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
loc_02270E:
	jsr	$B2(a5)	; -> AvalonB1_CyclePalettes
	unlk	a6
	rts
