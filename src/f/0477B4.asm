; ---------------------------------------------------------------------------
; BaniMazaA2_FrameHook - BaniMazaA2 per-frame hook: frame counter, update the four parts when active, palette animation
; In:  none
; Out: none
; Evidence: installed in g_SceneFrameHook by BaniMazaA2_LoadLevel; BaniMazaA2_UpdateDebris, BaniMazaA2_AnimatePalettes
; ---------------------------------------------------------------------------
BaniMazaA2_FrameHook:
	link.w	a6,#$0
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_0477CE
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
loc_0477CE:
	movea.l	-$3B14(a5),a0
	tst.w	$84(a0)
	beq.s	loc_0477DC
	jsr	BaniMazaA2_UpdateDebris(pc)
loc_0477DC:
	jsr	BaniMazaA2_AnimatePalettes(pc)
	unlk	a6
	rts
