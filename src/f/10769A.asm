; ---------------------------------------------------------------------------
; SpaceB1_InstallHooks - SpaceB1: frame hook, resources, switch tiles, palette cycles, place players, segment handler 27, create the camera
; In:  none
; Out: none
; Evidence: g_SceneFrameHook = SpaceB1_FrameHook; $FFCE02 = SegHook_HurtPlayerStop; CAMERA New (jt $4FBA) with SpaceB1_InitCamera
; ---------------------------------------------------------------------------
SpaceB1_InstallHooks:
	link.w	a6,#$0
	lea.l	SpaceB1_FrameHook(pc),a0
	move.l	a0,g_SceneFrameHook(a5)
	jsr	SpaceB1_LoadResources(pc)
	jsr	SpaceB1_InstallTileHooks(pc)
	jsr	SpaceB1_ResetPalCycles(pc)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	jsr	$8A(a5)	; -> Players_PlaceAtStart
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	lea.l	$10(a7),a7
	bne.s	loc_10770A
	ori.b	#$4,g_Player1+$2E(a5)
	moveq	#$8,d0
	and.w	g_Player1+$6(a5),d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.b	g_Player1+$42(a5),d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	g_Player1+$88(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	jsr	$4F7A(a5)	; -> DrawList_SetPriority
	lea.l	$10(a7),a7
loc_10770A:
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_107750
	ori.b	#$4,g_Player2+$2E(a5)
	moveq	#$8,d0
	and.w	g_Player2+$6(a5),d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.b	g_Player2+$42(a5),d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	g_Player2+$88(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	jsr	$4F7A(a5)	; -> DrawList_SetPriority
	lea.l	$10(a7),a7
loc_107750:
	lea.l	$3F1A(a5),a0
	move.l	a0,g_SegTypeHooks+$6C(a5)
	clr.b	g_TwoPlayerStep(a5)
	pea.l	SpaceB1_InitCamera(pc)
	lea.l	$4DBA(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$4DBA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$A(a0),a1
	jsr	(a1)
	move.l	d0,g_Camera(a5)
	addq.w	#$8,a7
	unlk	a6
	rts
