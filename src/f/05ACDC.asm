; ---------------------------------------------------------------------------
; BaniMazaB2_InstallFrameHook - install BaniMazaB2_FrameHook as the scene frame hook
; In:  none
; Out: none
; Evidence: g_SceneFrameHook = BaniMazaB2_FrameHook
; ---------------------------------------------------------------------------
BaniMazaB2_InstallFrameHook:
	link.w	a6,#$0
	lea.l	BaniMazaB2_FrameHook(pc),a0
	move.l	a0,g_SceneFrameHook(a5)
	unlk	a6
	rts
