; ---------------------------------------------------------------------------
; CloneA1_FrameHook - CloneA1 per-frame hook: frame counter and palette cycles (twice at half rate)
; In:  none
; Out: none
; Evidence: installed in g_SceneFrameHook by CloneA1_InstallHooks; CloneA1_CyclePalettes unless g_PalFadeActive
; ---------------------------------------------------------------------------
CloneA1_FrameHook:
	link.w	a6,#$0
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_077560
	jsr	CloneA1_CyclePalettes(pc)
loc_077560:
	tst.b	-$38DE(a5)
	beq.s	loc_077578
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_077578
	jsr	CloneA1_CyclePalettes(pc)
loc_077578:
	unlk	a6
	rts
