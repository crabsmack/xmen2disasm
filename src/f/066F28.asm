; ---------------------------------------------------------------------------
; CerebroClone_RunScene - scene 'CerebroScreen Clone': player select with no briefing text
; In:  none
; Out: none
; Evidence: Scene_RegisterAll entry; Cerebro_Run with script 0
; ---------------------------------------------------------------------------
CerebroClone_RunScene:
	link.w	a6,#$0
	clr.w	g_SceneVar3B0C(a5)
	move.w	#$1,g_SceneVar3B0A(a5)
	moveq	#$0,d0
	move.l	d0,g_SceneVar3B14(a5)
	jsr	Cerebro_Run(pc)
	unlk	a6
	rts
