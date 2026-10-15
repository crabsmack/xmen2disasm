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
	move.l	d0,-$3AF8(a5)
	move.l	d0,-$3AF4(a5)
	move.l	d0,-$3AF0(a5)
	lea.l	XClone_TileHookOpenWall(pc),a0
	move.l	a0,-$3AEC(a5)
	move.l	d0,-$3AE8(a5)
	move.l	d0,-$3AE4(a5)
	lea.l	XClone_TileHookReward(pc),a0
	move.l	a0,-$3AE0(a5)
	move.l	d0,-$3ADC(a5)
	move.b	#$1,-$35C8(a5)
	clr.b	-$35CA(a5)
	moveq	#$1,d0
	unlk	a6
	rts
