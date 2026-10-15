; ---------------------------------------------------------------------------
; SavageA2_InstallFrameHook - SavageA2: install SavageA2_FrameHook in g_SceneFrameHook
; In:  none
; Out: none
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageA2_InstallFrameHook:
	link.w	a6,#$0
	lea.l	SavageA2_FrameHook(pc),a0
	move.l	a0,g_SceneFrameHook(a5)
	unlk	a6
	rts
