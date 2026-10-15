; ---------------------------------------------------------------------------
; AvalonB2_FrameHook - AvalonB2 per-frame hook: advance the frame counter and the palette cycles
; In:  none
; Out: none
; Evidence: installed in -$388E by AvalonB2_RunScene; g_FrameCounter += 1/2; reuses AvalonB1_CyclePalettes
; ---------------------------------------------------------------------------
AvalonB2_FrameHook:
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
