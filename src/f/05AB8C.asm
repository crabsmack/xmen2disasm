; ---------------------------------------------------------------------------
; BaniMazaB2_FrameHook - BaniMazaB2 per-frame hook: advance the frame counter (2 at half rate)
; In:  none
; Out: none
; Evidence: installed in g_SceneFrameHook by BaniMazaB2_InstallFrameHook
; ---------------------------------------------------------------------------
BaniMazaB2_FrameHook:
	link.w	a6,#$0
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_05ABA6
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
loc_05ABA6:
	unlk	a6
	rts
