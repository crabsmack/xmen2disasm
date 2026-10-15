; ---------------------------------------------------------------------------
; PlayerSelect_RunScene - scene 'CerebroScreen PlayerSelect' (between stages and after a death): player select, then resume the saved scene
; In:  none
; Out: none
; Evidence: Scene_RegisterAll registers it between every stage; if -$3B92 >= 0 (scene to return to after a death, set by Game_SceneLoop) sets g_SceneIndex from it and clears it
; ---------------------------------------------------------------------------
PlayerSelect_RunScene:
	link.w	a6,#$0
	clr.w	-$3B0C(a5)
	move.w	#$1,-$3B0A(a5)
	moveq	#$0,d0
	move.l	d0,-$3B14(a5)
	tst.w	g_ResumeSceneIndex(a5)
	blt.s	loc_066F64
	move.w	g_ResumeSceneIndex(a5),g_SceneIndex(a5)
loc_066F64:
	jsr	Cerebro_Run(pc)
	tst.w	g_ResumeSceneIndex(a5)
	blt.s	loc_066F7A
	move.b	#$1,g_SceneIndexSet(a5)
	move.w	#$FFFF,g_ResumeSceneIndex(a5)
loc_066F7A:
	unlk	a6
	rts
