; ---------------------------------------------------------------------------
; SpaceB1_FrameHook - SpaceB1 per-frame hook: count the frame and cycle palettes (twice at half rate)
; In:  none
; Out: d0
; Evidence: g_SceneFrameHook; g_FrameCounter; skipped while g_PalFadeActive
; ---------------------------------------------------------------------------
SpaceB1_FrameHook:
	link.w	a6,#$0
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_107576
	jsr	SpaceB1_CyclePalettes(pc)
loc_107576:
	tst.b	-$38DE(a5)
	beq.s	loc_10758E
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_10758E
	jsr	SpaceB1_CyclePalettes(pc)
loc_10758E:
	unlk	a6
	rts
