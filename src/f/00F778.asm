; ---------------------------------------------------------------------------
; AvalonB1_CamHookWait2 - AvalonB1 camera hook stage 1: hold the players still; after 2 frames set the intro palette and go to stage 2
; In:  8(a6) = camera
; Out: none
; Evidence: installed at g_Camera+4 by AvalonB1_InitCamera; counter -$3B32 (incremented by AvalonB1_FrameHook); zeroes both players' velocity/accel; AvalonB1_ScrollCameraTo(g_CameraX, g_CameraY)
; ---------------------------------------------------------------------------
AvalonB1_CamHookWait2:
	link.w	a6,#$0
	clr.w	g_Pad1Pressed(a5)
	clr.w	g_Pad2Pressed(a5)
	clr.w	g_Pad1Latch(a5)
	clr.w	g_Pad2Latch(a5)
	moveq	#$2,d0
	cmp.w	-$3B32(a5),d0
	bgt.s	loc_00F7A8
	clr.w	-$3B32(a5)
	lea.l	AvalonB1_CamHookWait60(pc),a0
	movea.l	g_Camera(a5),a1
	move.l	a0,$4(a1)
	jsr	AvalonB1_InitIntroPalette(pc)
loc_00F7A8:
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_00F7CC
	clr.w	g_Player1+$1E(a5)
	clr.l	g_Player1+$16(a5)
	clr.w	g_Player1+$20(a5)
loc_00F7CC:
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_00F7F0
	clr.w	g_Player2+$1E(a5)
	clr.l	g_Player2+$16(a5)
	clr.w	g_Player2+$20(a5)
loc_00F7F0:
	move.w	g_CameraY(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	g_CameraX(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	AvalonB1_ScrollCameraTo(pc)
	addq.w	#$8,a7
	unlk	a6
	rts
