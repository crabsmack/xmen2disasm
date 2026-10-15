; ---------------------------------------------------------------------------
; SpaceA1_InstallTileHooks - SpaceA1: clear the tile-trigger hook table and set SpaceA1_SwitchTileHit as the switch-tile handler
; In:  none
; Out: none
; Evidence: writes $FFC708-$FFC724 (slot $FFC710 = SpaceA1_SwitchTileHit), byte $FFCC38 = 1
; ---------------------------------------------------------------------------
SpaceA1_InstallTileHooks:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,g_TileHooks(a5)
	move.l	d0,g_TileHooks+$4(a5)
	lea.l	SpaceA1_SwitchTileHit(pc),a0
	move.l	a0,g_TileHooks+$8(a5)
	move.l	d0,g_TileHooks+$C(a5)
	move.l	d0,g_TileHooks+$10(a5)
	move.l	d0,g_TileHooks+$14(a5)
	move.l	d0,g_TileHooks+$18(a5)
	move.l	d0,g_TileHooks+$1C(a5)
	move.b	#$1,g_TileHooksOn(a5)
	unlk	a6
	rts
