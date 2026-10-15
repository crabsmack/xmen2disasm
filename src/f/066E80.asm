; ---------------------------------------------------------------------------
; CerebroSentinels_RunScene - scene 'CerebroScreen Sentinels': Cerebro intro + briefing text (jt $F82) + player select
; In:  none
; Out: none
; Evidence: Scene_RegisterAll entry; sets -$3B0C = 1, -$3B0A = 1, script jt $F82, then Cerebro_Run; sets progress bit 1 in -$3C5E
; ---------------------------------------------------------------------------
CerebroSentinels_RunScene:
	link.w	a6,#$0
	move.w	#$1,-$3B0C(a5)
	move.w	#$1,-$3B0A(a5)
	lea.l	$F82(a5),a0
	move.l	$2(a0),-$3B14(a5)
	jsr	Cerebro_Run(pc)
	ori.w	#$2,g_ProgressFlags(a5)
	unlk	a6
	rts
