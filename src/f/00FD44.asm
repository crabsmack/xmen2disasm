; ---------------------------------------------------------------------------
; AvalonB1_InstallTileHooks - install AvalonB1's map tile hooks (only slot -$3AF4 = AvalonB1_TileHook)
; In:  none
; Out: none
; Evidence: clears the 8 hook longs at g_TileHooks..-$3ADC except -$3AF4, sets byte g_TileHooksOn = 1
; ---------------------------------------------------------------------------
AvalonB1_InstallTileHooks:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,g_TileHooks(a5)
	lea.l	AvalonB1_TileHook(pc),a0
	move.l	a0,g_TileHooks+$4(a5)
	move.l	d0,g_TileHooks+$8(a5)
	move.l	d0,g_TileHooks+$C(a5)
	move.l	d0,g_TileHooks+$10(a5)
	move.l	d0,g_TileHooks+$14(a5)
	move.l	d0,g_TileHooks+$18(a5)
	move.l	d0,g_TileHooks+$1C(a5)
	move.b	#$1,g_TileHooksOn(a5)
	unlk	a6
	rts
