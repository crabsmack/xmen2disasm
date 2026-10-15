; ---------------------------------------------------------------------------
; FinalText_RunScene - scene 'CerebroScreen FinalText': the ending text (jt $FAA)
; In:  none
; Out: none
; Evidence: Scene_RegisterAll entry; Cerebro_Run with script jt $FAA, no select; sets g_ProgressFlags bit $4000 (game finished)
; ---------------------------------------------------------------------------
FinalText_RunScene:
	link.w	a6,#$0
	clr.w	g_SceneVar3B0C(a5)
	clr.w	g_SceneVar3B0A(a5)
	lea.l	$FAA(a5),a0
	move.l	$2(a0),g_SceneVar3B14(a5)
	jsr	Cerebro_Run(pc)
	ori.w	#$4000,g_ProgressFlags(a5)
	unlk	a6
	rts
