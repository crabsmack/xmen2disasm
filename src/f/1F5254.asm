; ---------------------------------------------------------------------------
; Scroll_Init - reset all scroll/camera state and set the plane size to 64x32 cells
; In:  none
; Out: none
; Evidence: VDP reg $90 = 1; clears the scroll request flags g_FgScrollDirty..g_VsramReq and ~40 camera/scroll words in g_BgScrollAdjY..g_CameraY; called last by Sys_InitHardware
; ---------------------------------------------------------------------------
Scroll_Init:
	link.w	a6,#$0
	movem.l	d6-d7,-(a7)
	move.w	#$9001,($C00004).l
	clr.b	g_MapDrawOff(a5)
	clr.b	g_BgLockToObj(a5)
	clr.b	g_BgOffsetOn(a5)
	clr.b	g_ScrollResync(a5)
	clr.w	g_BgOffsetX(a5)
	clr.w	g_BgOffsetY(a5)
	clr.b	g_FgScrollDirty(a5)
	clr.b	g_BgScrollDirty(a5)
	clr.b	g_ColumnVsReq(a5)
	clr.b	g_VsramReq(a5)
	move.w	#$100,g_FgScrollFactorX(a5)
	move.w	#$100,g_FgScrollFactorY(a5)
	clr.w	g_BgScrollFactorX(a5)
	clr.w	g_BgScrollFactorY(a5)
	clr.w	g_FgScrollBaseX(a5)
	clr.w	g_FgScrollBaseY(a5)
	clr.w	g_BgScrollBaseX(a5)
	clr.w	g_BgScrollBaseY(a5)
	clr.w	g_CameraX(a5)
	clr.w	g_CameraY(a5)
	clr.w	g_FgMapExtraW(a5)
	clr.w	g_FgMapExtraH(a5)
	clr.w	g_CamMaxX(a5)
	clr.w	g_CamMaxXTarget(a5)
	clr.w	g_CamMinX(a5)
	clr.w	g_CamMinXTarget(a5)
	clr.w	g_CamMaxY(a5)
	clr.w	g_CamMaxYTarget(a5)
	clr.w	g_CamMinY(a5)
	clr.w	g_CamMinYTarget(a5)
	move.w	g_CameraX(a5),d6
	move.w	d6,g_FgScrollX(a5)
	move.w	g_CameraY(a5),d7
	move.w	d7,g_FgScrollY(a5)
	move.w	d6,g_BgScrollX(a5)
	move.w	d7,g_BgScrollY(a5)
	clr.w	g_FgStreamX(a5)
	clr.w	g_FgStreamY(a5)
	clr.w	g_BgStreamX(a5)
	clr.w	g_BgStreamY(a5)
	clr.w	g_FgScrollAdjX(a5)
	clr.w	g_FgScrollAdjY(a5)
	clr.w	g_BgScrollAdjX(a5)
	clr.w	g_BgScrollAdjY(a5)
	clr.w	g_FgMapW(a5)
	clr.w	g_FgMapH(a5)
	move.w	#$1,g_MapTilesEnd(a5)
	clr.b	g_BgMapPresent(a5)
	clr.b	g_BgWrapX(a5)
	clr.b	g_BgWrapY(a5)
	clr.b	g_FgMapPresent(a5)
	movem.l	-$8(a6),d6-d7
	unlk	a6
	rts
