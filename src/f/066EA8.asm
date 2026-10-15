; ---------------------------------------------------------------------------
; CerebroAvalon_RunScene - scene 'CerebroScreen Avalon': briefing text (jt $F8A) + player select
; In:  none
; Out: none
; Evidence: Scene_RegisterAll entry; Cerebro_Run with script jt $F8A
; ---------------------------------------------------------------------------
CerebroAvalon_RunScene:
	link.w	a6,#$0
	clr.w	g_SceneVar3B0C(a5)
	move.w	#$1,g_SceneVar3B0A(a5)
	lea.l	$F8A(a5),a0
	move.l	$2(a0),g_SceneVar3B14(a5)
	jsr	Cerebro_Run(pc)
	unlk	a6
	rts
