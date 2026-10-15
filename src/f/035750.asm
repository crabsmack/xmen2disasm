; ---------------------------------------------------------------------------
; AvalonA4_FrameHook - AvalonA4 per-frame hook: frame counter and the stage effect sub_034D7A (twice at half rate)
; In:  none
; Out: none
; Evidence: installed in -$388E by AvalonA4_InstallHooks; skipped while g_PalFadeActive
; ---------------------------------------------------------------------------
AvalonA4_FrameHook:
	link.w	a6,#$0
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_035766
	jsr	sub_034D7A(pc)
loc_035766:
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_03577E
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_03577E
	jsr	sub_034D7A(pc)
loc_03577E:
	unlk	a6
	rts
