; ---------------------------------------------------------------------------
; SavageA3_InstallFrameHook - SavageA3: install SavageA3_FrameHook in g_SceneFrameHook
; In:  none
; Out: none
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageA3_InstallFrameHook:
	link.w	a6,#$0
	lea.l	SavageA3_FrameHook(pc),a0
	move.l	a0,g_SceneFrameHook(a5)
	unlk	a6
	rts
