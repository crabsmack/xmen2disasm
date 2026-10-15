; ---------------------------------------------------------------------------
; AvalonA2_FrameHook - AvalonA2 per-frame hook: frame counter (twice at half rate) and the disabled frame effect
; In:  none
; Out: none
; Evidence: installed in -$388E by AvalonA2_InstallHooks; g_FrameCounter += 1 (again when -$38DE); AvalonA2_DisabledFrameEffect unless g_PalFadeActive
; ---------------------------------------------------------------------------
AvalonA2_FrameHook:
	link.w	a6,#$0
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_022A32
	jsr	AvalonA2_DisabledFrameEffect(pc)
loc_022A32:
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_022A4A
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_022A4A
	jsr	AvalonA2_DisabledFrameEffect(pc)
loc_022A4A:
	unlk	a6
	rts
