; ---------------------------------------------------------------------------
; SavageA2_InstallTileHooks - SavageA2: install the tile hooks ([2] SavageA2_TileHookCrack, [3] PerimeterDoor_TileHook)
; In:  none
; Out: none
; Evidence: same 8-entry table at $FFC708 as XClone_InstallTileHooks; byte -$33C8 := 1; TAS 30858
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageA2_InstallTileHooks:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,-$3AF8(a5)
	move.l	d0,-$3AF4(a5)
	lea.l	SavageA2_TileHookCrack(pc),a0
	move.l	a0,-$3AF0(a5)
	lea.l	PerimeterDoor_TileHook(pc),a0
	move.l	a0,-$3AEC(a5)
	move.l	d0,-$3AE8(a5)
	move.l	d0,-$3AE4(a5)
	move.l	d0,-$3AE0(a5)
	move.l	d0,-$3ADC(a5)
	move.b	#$1,-$35C8(a5)
	unlk	a6
	rts
