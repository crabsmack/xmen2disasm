; ---------------------------------------------------------------------------
; BaniMazaB2_InstallTileHooks - install BaniMazaB2's map tile hook (slot -$3AF0 = BaniMazaB2_CrackFloorHook)
; In:  none
; Out: none
; Evidence: clears the 8 hook longs g_TileHooks..-$3ADC except -$3AF0; byte g_TileHooksOn = 1
; ---------------------------------------------------------------------------
BaniMazaB2_InstallTileHooks:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,g_TileHooks(a5)
	move.l	d0,g_TileHooks+$4(a5)
	lea.l	BaniMazaB2_CrackFloorHook(pc),a0
	move.l	a0,g_TileHooks+$8(a5)
	move.l	d0,g_TileHooks+$C(a5)
	move.l	d0,g_TileHooks+$10(a5)
	move.l	d0,g_TileHooks+$14(a5)
	move.l	d0,g_TileHooks+$18(a5)
	move.l	d0,g_TileHooks+$1C(a5)
	move.b	#$1,g_TileHooksOn(a5)
	unlk	a6
	rts
