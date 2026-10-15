; ---------------------------------------------------------------------------
; AvalonA4_InstallTileHooks - install AvalonA4's four map tile hooks
; In:  none
; Out: none
; Evidence: -$3AF4..-$3AE8 = AvalonA4_SwitchTileHook, AvalonA4_GlobCrackBlockHook, AvalonA4_GlobCrackColumnHook, AvalonA4_CrackFloorHook; others 0; byte g_TileHooksOn = 1
; ---------------------------------------------------------------------------
AvalonA4_InstallTileHooks:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,g_TileHooks(a5)
	lea.l	AvalonA4_SwitchTileHook(pc),a0
	move.l	a0,g_TileHooks+$4(a5)
	lea.l	AvalonA4_GlobCrackBlockHook(pc),a0
	move.l	a0,g_TileHooks+$8(a5)
	lea.l	AvalonA4_GlobCrackColumnHook(pc),a0
	move.l	a0,g_TileHooks+$C(a5)
	lea.l	AvalonA4_CrackFloorHook(pc),a0
	move.l	a0,g_TileHooks+$10(a5)
	move.l	d0,g_TileHooks+$14(a5)
	move.l	d0,g_TileHooks+$18(a5)
	move.l	d0,g_TileHooks+$1C(a5)
	move.b	#$1,g_TileHooksOn(a5)
	unlk	a6
	rts
