; ---------------------------------------------------------------------------
; AvalonA4_InstallHooks - install AvalonA4's frame hook, tile hooks and event hooks
; In:  none
; Out: none
; Evidence: g_SceneFrameHook = AvalonA4_FrameHook, AvalonA4_InstallTileHooks, AvalonA4_InstallEventHooks
; ---------------------------------------------------------------------------
AvalonA4_InstallHooks:
	link.w	a6,#$0
	lea.l	AvalonA4_FrameHook(pc),a0
	move.l	a0,g_SceneFrameHook(a5)
	jsr	AvalonA4_InstallTileHooks(pc)
	jsr	AvalonA4_InstallEventHooks(pc)
	unlk	a6
	rts
