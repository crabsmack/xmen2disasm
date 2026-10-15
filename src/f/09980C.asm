; ---------------------------------------------------------------------------
; XClone_InstallTileHooks - install the clone-maker tile hooks into the 8-entry table at $FFC708 ([3] XClone_TileHookOpenWall, [6] XClone_TileHookReward)
; In:  none
; Out: d0 = 1
; Evidence: other entries 0; byte -$33C8 := 1, -$33CA := 0; jt 794; caller CloneA5 setup (CloneA5_InitTileHooks); TAS 49258
; Found: jt 794
; ---------------------------------------------------------------------------
XClone_InstallTileHooks:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,g_TileHooks(a5)
	move.l	d0,g_TileHooks+$4(a5)
	move.l	d0,g_TileHooks+$8(a5)
	lea.l	XClone_TileHookOpenWall(pc),a0
	move.l	a0,g_TileHooks+$C(a5)
	move.l	d0,g_TileHooks+$10(a5)
	move.l	d0,g_TileHooks+$14(a5)
	lea.l	XClone_TileHookReward(pc),a0
	move.l	a0,g_TileHooks+$18(a5)
	move.l	d0,g_TileHooks+$1C(a5)
	move.b	#$1,g_TileHooksOn(a5)
	clr.b	g_SolidMapIsBg(a5)
	moveq	#$1,d0
	unlk	a6
	rts
