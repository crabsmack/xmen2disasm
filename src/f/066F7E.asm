; ---------------------------------------------------------------------------
; LogoAndDemo_RunScene - scene 'CerebroScreen LogoAndDemo': Cerebro intro with PRESS START; start pressed -> new game, else attract demos
; In:  none
; Out: none
; Evidence: Scene_RegisterAll entry; -$3C5E bit 1 (set when START pressed in Cerebro_PlayIntro) -> Game_ResetPlayers, else g_SceneIndex = -1 (Game_SceneLoop plays demos)
; ---------------------------------------------------------------------------
LogoAndDemo_RunScene:
	link.w	a6,#$0
	move.w	#$1,g_ProgressFlags(a5)
	move.w	#$1,g_SceneVar3B0C(a5)
	clr.w	g_SceneVar3B0A(a5)
	moveq	#$0,d0
	move.l	d0,g_SceneVar3B14(a5)
	jsr	Cerebro_Run(pc)
	moveq	#$2,d0
	and.w	g_ProgressFlags(a5),d0
	beq.s	loc_066FAA
	jsr	$32(a5)	; -> Game_ResetPlayers
	bra.s	loc_066FB6
loc_066FAA:
	move.w	#$FFFF,g_SceneIndex(a5)
	move.b	#$1,g_SceneIndexSet(a5)
loc_066FB6:
	unlk	a6
	rts
