; ---------------------------------------------------------------------------
; BaniMazaA1_InstallFrameHook - install BaniMazaA1_FrameHook as the scene frame hook
; In:  none
; Out: none
; Evidence: g_SceneFrameHook = BaniMazaA1_FrameHook
; ---------------------------------------------------------------------------
BaniMazaA1_InstallFrameHook:
	link.w	a6,#$0
	lea.l	BaniMazaA1_FrameHook(pc),a0
	move.l	a0,g_SceneFrameHook(a5)
	unlk	a6
	rts
