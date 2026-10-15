; ---------------------------------------------------------------------------
; SavageA3_InstallTileHooks - SavageA3: install the tile hooks ([2] SavageA3_TileHookCrack, [3] PerimeterDoor_TileHook)
; In:  none
; Out: none
; Evidence: 8-entry table at $FFC708; byte -$33C8 := 1
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageA3_InstallTileHooks:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,g_TileHooks(a5)
	move.l	d0,g_TileHooks+$4(a5)
	lea.l	SavageA3_TileHookCrack(pc),a0
	move.l	a0,g_TileHooks+$8(a5)
	lea.l	$1BEA(a5),a0
	move.l	a0,g_TileHooks+$C(a5)
	move.l	d0,g_TileHooks+$10(a5)
	move.l	d0,g_TileHooks+$14(a5)
	move.l	d0,g_TileHooks+$18(a5)
	move.l	d0,g_TileHooks+$1C(a5)
	move.b	#$1,g_TileHooksOn(a5)
	unlk	a6
	rts
