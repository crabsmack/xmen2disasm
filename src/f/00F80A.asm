; ---------------------------------------------------------------------------
; AvalonB1_CamHookWait60 - AvalonB1 camera hook stage 2: hold the players still for 60 frames, then stage 3
; In:  8(a6) = camera
; Out: none
; Evidence: g_Camera+4 chain after AvalonB1_CamHookWait2; counter -$3B32 > $3B -> AvalonB1_CamHookScroll120
; ---------------------------------------------------------------------------
AvalonB1_CamHookWait60:
	link.w	a6,#$0
	clr.w	g_Pad1Pressed(a5)
	clr.w	g_Pad2Pressed(a5)
	clr.w	g_Pad1Latch(a5)
	clr.w	g_Pad2Latch(a5)
	moveq	#$3C,d0
	cmp.w	-$3B32(a5),d0
	bgt.s	loc_00F836
	clr.w	-$3B32(a5)
	lea.l	AvalonB1_CamHookScroll120(pc),a0
	movea.l	g_Camera(a5),a1
	move.l	a0,$4(a1)
loc_00F836:
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_00F85A
	clr.w	-$173A(a5)
	clr.l	-$1742(a5)
	clr.w	-$1738(a5)
loc_00F85A:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_00F87E
	clr.w	-$182A(a5)
	clr.l	-$1832(a5)
	clr.w	-$1828(a5)
loc_00F87E:
	move.w	g_CameraY(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	g_CameraX(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	AvalonB1_ScrollCameraTo(pc)
	unlk	a6
	rts
