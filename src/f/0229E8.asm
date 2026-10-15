; ---------------------------------------------------------------------------
; AvalonA2_InstallTileHooks - install AvalonA2's map tile hooks (only slot -$3AF0 = AvalonA2_ToggleTileHook)
; In:  none
; Out: none
; Evidence: clears the 8 hook longs -$3AF8..-$3ADC except -$3AF0, sets byte -$35C8 = 1
; ---------------------------------------------------------------------------
AvalonA2_InstallTileHooks:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,g_TileHooks(a5)
	move.l	d0,g_TileHooks+$4(a5)
	lea.l	AvalonA2_ToggleTileHook(pc),a0
	move.l	a0,g_TileHooks+$8(a5)
	move.l	d0,g_TileHooks+$C(a5)
	move.l	d0,g_TileHooks+$10(a5)
	move.l	d0,g_TileHooks+$14(a5)
	move.l	d0,g_TileHooks+$18(a5)
	move.l	d0,g_TileHooks+$1C(a5)
	move.b	#$1,g_TileHooksOn(a5)
	unlk	a6
	rts
