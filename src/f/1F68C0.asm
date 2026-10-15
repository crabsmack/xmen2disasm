; ---------------------------------------------------------------------------
; Pal_RestoreCycle - restore the palette-cycle script pointer saved by Pal_SaveCycle
; In:  none
; Out: none
; Evidence: g_PalCycleScript := g_PalCycleSave
; ---------------------------------------------------------------------------
Pal_RestoreCycle:
	link.w	a6,#$0
	move.l	g_PalCycleSave(a5),g_PalCycleScript(a5)
	unlk	a6
	rts
