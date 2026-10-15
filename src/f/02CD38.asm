; ---------------------------------------------------------------------------
; AvalonA3_InstallHooks - install the AvalonA3 per-frame hook
; In:  none
; Out: none
; Evidence: -$388E = AvalonA3_FrameHook
; ---------------------------------------------------------------------------
AvalonA3_InstallHooks:
	link.w	a6,#$0
	lea.l	AvalonA3_FrameHook(pc),a0
	move.l	a0,g_SceneFrameHook(a5)
	unlk	a6
	rts
