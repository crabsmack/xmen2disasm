; ---------------------------------------------------------------------------
; SavageB1_InstallHooks - SavageB1: install the water draw hook (g_SceneDrawHook) and its frame hook
; In:  none
; Out: none
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageB1_InstallHooks:
	link.w	a6,#$0
	lea.l	Water_DrawHook(pc),a0
	move.l	a0,g_SceneDrawHook(a5)
	lea.l	SavageB1_FrameHook(pc),a0
	move.l	a0,g_SceneFrameHook(a5)
	unlk	a6
	rts
