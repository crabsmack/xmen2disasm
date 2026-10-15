; ---------------------------------------------------------------------------
; CloneA5_RunScene - scene function for 'CloneA5 BroodBoss': load the boss arena and run it
; In:  none
; Out: none
; Evidence: registered under that name (Scene_RegisterAll, jt 644); Level_Load with Tbl_BroodBossHall class list $08CD28; music $13; boss offsets -$3C44 = 0, -$3C48 = $3300; palette-cycle table from $088B1E; segment hooks CloneA5_SegHook16/15; Players_PlaceAtStart; effect pools via Debris_CreatePool; palette line 0 = Pal_CloneA2Line0; scene hook CloneA5_FrameHook; Level_Run; TAS 49125
; Found: jt 644
; ---------------------------------------------------------------------------
CloneA5_RunScene:
	link.w	a6,#$FCFC
	movem.l	d3/d7/a3-a4,-(a7)
	lea.l	$1532(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	moveq	#$F,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$1522(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$1512(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$151A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$151A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$1112(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$152A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4FCA(a5)	; -> Level_Load
	jsr	$5242(a5)	; -> Snd_StopAll
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$13,d1
	move.l	d1,-(a7)
	jsr	$524A(a5)	; -> Snd_SetParam
	moveq	#$A,d0
	move.l	d0,-(a7)
	moveq	#$48,d1
	move.l	d1,-(a7)
	pea.l	-$2D0(a6)
	jsr	$2E2A(a5)	; -> ICandy_PoolInit
	move.b	#$1,g_HudOn(a5)
	clr.w	g_FgScrollFactorX(a5)
	move.w	#$100,g_FgScrollFactorY(a5)
	clr.w	g_BgScrollFactorX(a5)
	clr.w	g_BgScrollFactorY(a5)
	moveq	#$0,d0
	move.l	d0,g_BroodBossOffsetX(a5)
	move.l	#$3300,g_BroodBossOffsetY(a5)
	clr.w	g_BgScrollBaseY(a5)
	jsr	CloneA5_ResetPalCycle(pc)
	lea.l	-$304(a6),a0
	move.l	a0,-$3B18(a5)
	move.b	#$5,g_BroodBossHealthBar(a5)
	moveq	#$33,d7
	lea.l	$14D2(a5),a0
	movea.l	$2(a0),a4
	lea.l	$54(a7),a7
	bra.s	loc_08880A
loc_088800:
	movea.l	-$3B18(a5),a0
	addq.l	#$1,-$3B18(a5)
	move.b	(a4)+,(a0)
loc_08880A:
	move.w	d7,d0
	subq.w	#$1,d7
	tst.w	d0
	bge.s	loc_088800
	lea.l	-$304(a6),a0
	move.l	a0,-$3B18(a5)
	lea.l	CloneA5_SegHook16(pc),a0
	move.l	a0,g_SegTypeHooks+$58(a5)
	lea.l	CloneA5_SegHook15(pc),a0
	move.l	a0,g_SegTypeHooks+$54(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	jsr	$8A(a5)	; -> Players_PlaceAtStart
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$12,d1
	move.l	d1,-(a7)
	jsr	$3B62(a5)	; -> Debris_CreatePool
	move.l	d0,-$3B1C(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$12,d1
	move.l	d1,-(a7)
	jsr	$3B62(a5)	; -> Debris_CreatePool
	move.l	d0,-$3B14(a5)
	clr.b	g_SpawnEnabled(a5)
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	lea.l	$28(a7),a7
	bne.s	loc_0888AA
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
loc_0888AA:
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0888F0
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
loc_0888F0:
	jsr	CloneA5_InitShockSprites(pc)
	moveq	#$10,d0
	move.l	d0,-(a7)
	jsr	$3382(a5)	; -> BioBalls_AllocBallList
	move.w	#$200,g_PalBase(a5)
	lea.l	$1122(a5),a0
	movea.l	$2(a0),a4
	lea.l	g_PalBase(a5),a3
	moveq	#$0,d7
	moveq	#$10,d3
	addq.w	#$4,a7
loc_088914:
	move.w	(a4)+,(a3)+
	move.l	d7,d0
	addq.l	#$1,d7
	cmp.l	d7,d3
	bgt.s	loc_088914
	clr.w	-$3B0C(a5)
	clr.w	-$3B0E(a5)
	jsr	CloneA5_InitTileHooks(pc)
	move.b	d0,g_TileHooksOn(a5)
	jsr	CloneA5_InitCamera(pc)
	lea.l	CloneA5_FrameHook(pc),a0
	move.l	a0,g_SceneFrameHook(a5)
	clr.b	g_TwoPlayerStep(a5)
	jsr	$5002(a5)	; -> Level_Run
	movem.l	-$314(a6),d3/d7/a3-a4
	unlk	a6
	rts
