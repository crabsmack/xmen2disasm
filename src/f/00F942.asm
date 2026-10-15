; ---------------------------------------------------------------------------
; AvalonB1_CamHookFadeIn - AvalonB1 camera hook stage 4: keep scrolling up and step the palette fade every 6 frames until the table ends
; In:  8(a6) = camera
; Out: none
; Evidence: AvalonB1_PalFadeStep(row -$3B3A, jt $2CA table); negative table byte ends it -> AvalonB1_CamHookFinish and sets byte -$38B4
; ---------------------------------------------------------------------------
AvalonB1_CamHookFadeIn:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	clr.w	g_Pad1Pressed(a5)
	clr.w	g_Pad2Pressed(a5)
	clr.w	g_Pad1Latch(a5)
	clr.w	g_Pad2Latch(a5)
	moveq	#$6,d0
	cmp.w	g_SceneVar3B32(a5),d0
	bgt.s	loc_00F9AC
	clr.w	g_SceneVar3B32(a5)
	lea.l	$CA(a5),a0
	movea.l	$2(a0),a4
	move.w	g_SceneVar3B3A(a5),d0
	ext.l	d0
	lsl.l	#$3,d0
	tst.b	(a4,d0.l)
	blt.s	loc_00F996
	move.l	a4,-(a7)
	move.w	g_SceneVar3B3A(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	AvalonB1_PalFadeStep(pc)
	move.w	g_SceneVar3B3A(a5),d0
	addq.w	#$1,g_SceneVar3B3A(a5)
	addq.w	#$8,a7
	bra.s	loc_00F9AC
loc_00F996:
	clr.w	g_SceneVar3B32(a5)
	lea.l	AvalonB1_CamHookFinish(pc),a0
	movea.l	g_Camera(a5),a1
	move.l	a0,$4(a1)
	move.b	#$1,g_HudOn(a5)
loc_00F9AC:
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_00F9D0
	clr.w	g_Player1+$1E(a5)
	clr.l	g_Player1+$16(a5)
	clr.w	g_Player1+$20(a5)
loc_00F9D0:
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_00F9F4
	clr.w	g_Player2+$1E(a5)
	clr.l	g_Player2+$16(a5)
	clr.w	g_Player2+$20(a5)
loc_00F9F4:
	move.w	g_CameraX(a5),d6
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_00FA02
	moveq	#$4,d0
	bra.s	loc_00FA04
loc_00FA02:
	moveq	#$2,d0
loc_00FA04:
	ext.w	d0
	move.w	g_CameraY(a5),d7
	sub.w	d0,d7
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	AvalonB1_ScrollCameraTo(pc)
	addq.w	#$8,a7
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
