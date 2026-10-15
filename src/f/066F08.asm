; ---------------------------------------------------------------------------
; CerebroSpace_RunScene - scene 'CerebroScreen Space': briefing text (jt $FA2) + player select
; In:  none
; Out: none
; Evidence: Scene_RegisterAll entry; Cerebro_Run with script jt $FA2
; ---------------------------------------------------------------------------
CerebroSpace_RunScene:
	link.w	a6,#$0
	clr.w	-$3B0C(a5)
	move.w	#$1,-$3B0A(a5)
	lea.l	$FA2(a5),a0
	move.l	$2(a0),-$3B14(a5)
	jsr	Cerebro_Run(pc)
	unlk	a6
	rts
