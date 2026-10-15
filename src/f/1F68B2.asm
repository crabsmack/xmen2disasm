; ---------------------------------------------------------------------------
; Pal_SaveCycle - remember the current palette-cycle script pointer
; In:  none
; Out: none
; Evidence: g_PalCycleSave := g_PalCycleScript; paired with Pal_RestoreCycle
; ---------------------------------------------------------------------------
Pal_SaveCycle:
	link.w	a6,#$0
	move.l	g_PalCycleScript(a5),g_PalCycleSave(a5)
	unlk	a6
	rts
