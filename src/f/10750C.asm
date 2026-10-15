; ---------------------------------------------------------------------------
; SpaceB1_InstallTileHooks - SpaceB1: clear the tile-trigger hooks and set Switch_TileHit as the switch-tile handler
; In:  none
; Out: none
; Evidence: $FFC710 = Switch_TileHit, byte $FFCC38 = 1
; ---------------------------------------------------------------------------
SpaceB1_InstallTileHooks:
	link.w	a6,#$0
	move.b	#$1,g_TileHooksOn(a5)
	moveq	#$0,d0
	move.l	d0,g_TileHooks(a5)
	move.l	d0,g_TileHooks+$4(a5)
	lea.l	$2A42(a5),a0
	move.l	a0,g_TileHooks+$8(a5)
	move.l	d0,g_TileHooks+$C(a5)
	move.l	d0,g_TileHooks+$10(a5)
	move.l	d0,g_TileHooks+$14(a5)
	move.l	d0,g_TileHooks+$18(a5)
	move.l	d0,g_TileHooks+$1C(a5)
	unlk	a6
	rts
