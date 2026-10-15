; ---------------------------------------------------------------------------
; SiberiaB1_InitWind - SiberiaB1: start the wind at the first keyframe, create the camera, set map bounds and four palette colours
; In:  none
; Out: none
; Evidence: $FFC6EC = Tbl_SiberiaB1Wind; CAMERA New (jt $4FBA) with SiberiaB1_InitCamera; bounds from map header $0F563A
; ---------------------------------------------------------------------------
SiberiaB1_InitWind:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	move.b	#$1,-$3AB8(a5)
	clr.w	-$3B48(a5)
	clr.w	-$3B40(a5)
	move.w	#$600,-$3B06(a5)
	move.w	#$1E,-$3B04(a5)
	lea.l	$2992(a5),a0
	move.l	$2(a0),-$3B14(a5)
	clr.w	-$3B08(a5)
	clr.w	-$3B32(a5)
	pea.l	SiberiaB1_InitCamera(pc)
	lea.l	$4DBA(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$4DBA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$A(a0),a1
	jsr	(a1)
	move.l	d0,g_Camera(a5)
	lea.l	$296A(a5),a0
	movea.l	$2(a0),a4
	move.l	a4,d7
	movea.l	d7,a0
	move.w	$2(a0),d0
	ext.l	d0
	lsl.l	#$3,d0
	sub.w	#$140,d0
	move.w	d0,-$3A96(a5)
	move.w	d0,g_CamMaxX(a5)
	movea.l	d7,a0
	move.w	$4(a0),d0
	ext.l	d0
	lsl.l	#$3,d0
	sub.w	#$E0,d0
	move.w	d0,-$3A9A(a5)
	move.w	d0,g_CamMaxY(a5)
	move.w	#$A8A,g_PalBase+$52(a5)
	move.w	#$EEE,g_PalBase+$54(a5)
	move.w	#$CCC,g_PalBase+$56(a5)
	move.w	#$868,g_PalBase+$58(a5)
	move.b	#$1,g_PalBaseDirty(a5)
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
