; ---------------------------------------------------------------------------
; Game_SceneLoop - run scenes in sequence (Cerebro, select, stages), handle deaths, lives and game over; when the sequence ends, play the 4 attract demos
; In:  none
; Out: none
; Evidence: calls g_SceneTable[g_SceneIndex].fn with Scene_PreLoadReset/Scene_PostLoadVram as load hooks; afterwards copies player +$68 health to g_P1Health/g_P2Health, spends a life or drops the player; g_SceneIndex = -1 -> switch on g_AttractDemoNum to Game_AttractDemo*; TAS RAM: g_SceneIndex steps 0,1,2...
; ---------------------------------------------------------------------------
Game_SceneLoop:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a3-a4,-(a7)
	moveq	#$0,d0
	move.l	d0,g_Unk38B0(a5)
	clr.b	g_DemoActive(a5)
	clr.b	g_StartEndsScene(a5)
	clr.b	g_SegFlag38C4(a5)
	move.w	#$3,g_Unk38AC(a5)
	clr.w	g_Unk3B00(a5)
	jsr	Scene_RegisterAll(pc)
	move.w	#$FFFF,g_ResumeSceneIndex(a5)
	jsr	Game_ResetPlayers(pc)
loc_005CF8:
	move.w	g_SceneIndex(a5),d0
	asl.w	#$3,d0
	lea.l	g_SceneTable(a5),a0
	tst.l	$4(a0,d0.w)
	beq.s	loc_005D2C
	lea.l	Scene_PreLoadReset(pc),a0
	move.l	a0,g_ScenePreLoadHook(a5)
	lea.l	Scene_PostLoadVram(pc),a0
	move.l	a0,g_ScenePostLoadHook(a5)
	move.w	g_SceneIndex(a5),d0
	asl.w	#$3,d0
	lea.l	g_SceneTable(a5),a0
	movea.l	$4(a0,d0.w),a1
	jsr	(a1)
	jsr	$4ACA(a5)	; -> Cyclops_ResetBeams
loc_005D2C:
	moveq	#-$1,d0
	cmp.b	g_P1CharIndex(a5),d0
	beq.s	loc_005D3A
	move.w	g_Player1+$68(a5),g_P1Health(a5)
loc_005D3A:
	moveq	#-$1,d0
	cmp.b	g_P2CharIndex(a5),d0
	beq.s	loc_005D48
	move.w	g_Player2+$68(a5),g_P2Health(a5)
loc_005D48:
	tst.w	g_P1Health(a5)
	sgt.b	d3
	neg.b	d3
	beq.s	loc_005D56
	moveq	#$0,d0
	bra.s	loc_005D58
loc_005D56:
	moveq	#$1,d0
loc_005D58:
	move.b	d0,d5
	tst.w	g_P2Health(a5)
	sgt.b	d3
	neg.b	d3
	beq.s	loc_005D68
	moveq	#$0,d0
	bra.s	loc_005D6A
loc_005D68:
	moveq	#$1,d0
loc_005D6A:
	move.b	d0,d6
	tst.b	d5
	beq.s	loc_005D9E
	moveq	#-$1,d0
	cmp.b	g_P1CharIndex(a5),d0
	beq.s	loc_005D9E
	tst.w	g_P1Lives(a5)
	beq.s	loc_005D8A
	subq.w	#$1,g_P1Lives(a5)
	move.w	#$700,g_P1Health(a5)
	bra.s	loc_005D9E
loc_005D8A:
	clr.w	g_P1Health(a5)
	dc.w	$1B7C,$FFFF,$C444	; insn: move.b #$ff, -$3bbc(a5)
	moveq	#$0,d0
	move.l	d0,g_Player1(a5)
	clr.w	g_Player1+$4(a5)
loc_005D9E:
	tst.b	d6
	beq.s	loc_005DD0
	moveq	#-$1,d0
	cmp.b	g_P2CharIndex(a5),d0
	beq.s	loc_005DD0
	tst.w	g_P2Lives(a5)
	beq.s	loc_005DBC
	subq.w	#$1,g_P2Lives(a5)
	move.w	#$700,g_P2Health(a5)
	bra.s	loc_005DD0
loc_005DBC:
	clr.w	g_P2Health(a5)
	dc.w	$1B7C,$FFFF,$C445	; insn: move.b #$ff, -$3bbb(a5)
	moveq	#$0,d0
	move.l	d0,g_Player2(a5)
	clr.w	g_Player2+$4(a5)
loc_005DD0:
	tst.b	g_SceneIndexSet(a5)
	bne.s	loc_005E26
	tst.b	d5
	beq.s	loc_005DDE
	tst.b	d6
	bne.s	loc_005DF8
loc_005DDE:
	addq.w	#$1,g_SceneIndex(a5)
	moveq	#$0,d0
	move.b	g_ScnCredits(a5),d0
	cmp.w	g_SceneIndex(a5),d0
	bge.w	loc_005F10
	jsr	Game_ResetPlayers(pc)
	bra.w	loc_005F10
loc_005DF8:
	tst.w	g_P1Health(a5)
	bne.s	loc_005E04
	tst.w	g_P2Health(a5)
	beq.s	loc_005E18
loc_005E04:
	move.w	g_SceneIndex(a5),g_ResumeSceneIndex(a5)
	moveq	#$0,d0
	move.b	g_ScnPlayerSelect(a5),d0
	move.w	d0,g_SceneIndex(a5)
	bra.w	loc_005F10
loc_005E18:
	moveq	#$0,d0
	move.b	g_ScnFailure(a5),d0
	move.w	d0,g_SceneIndex(a5)
	bra.w	loc_005F10
loc_005E26:
	moveq	#-$1,d0
	cmp.w	g_SceneIndex(a5),d0
	bne.w	loc_005F10
	move.w	g_AttractDemoNum(a5),d0
	bmi.s	Game_AttractDemoNightcrawler
	cmpi.w	#$3,d0
	bgt.s	Game_AttractDemoNightcrawler
	add.w	d0,d0
	move.w	Sw_005CC6(pc,d0.w),d0
	jmp	Sw_005CC6-2(pc,d0.w)
