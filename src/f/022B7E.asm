; ---------------------------------------------------------------------------
; AvalonA2_InstallHooks - install AvalonA2's parallax, frame hook, tile hook and event hooks
; In:  none
; Out: none
; Evidence: Scroll_SetParallax(jt $22BEA), g_SceneFrameHook = AvalonA2_FrameHook, AvalonA2_InstallTileHooks, AvalonA2_InstallEventHooks
; ---------------------------------------------------------------------------
AvalonA2_InstallHooks:
	link.w	a6,#$0
	lea.l	$512(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$5102(a5)	; -> Scroll_SetParallax
	lea.l	AvalonA2_FrameHook(pc),a0
	move.l	a0,g_SceneFrameHook(a5)
	jsr	AvalonA2_InstallTileHooks(pc)
	jsr	AvalonA2_InstallEventHooks(pc)
	unlk	a6
	rts
