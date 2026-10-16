; ---------------------------------------------------------------------------
; SentinelsA1_ResetPalCycles - SentinelsA1: zero the palette-cycle timers/indices
; In:  none
; Out: none
; Evidence: clears the counter triples passed to Pal_CycleStep by SentinelsA1_CyclePalettes
; ---------------------------------------------------------------------------
SentinelsA1_ResetPalCycles:
	link.w	a6,#$0
	clr.w	g_SceneVar3B32(a5)
	clr.w	g_SceneVar3B42(a5)
	clr.w	g_SceneVar3B3A(a5)
	clr.w	g_SceneVar3B34(a5)
	clr.w	g_SceneVar3B44(a5)
	clr.w	g_SceneVar3B3C(a5)
	clr.w	g_SceneVar3B36(a5)
	clr.w	g_SceneVar3B46(a5)
	clr.w	g_SceneVar3B3E(a5)
	clr.w	g_SceneVar3B38(a5)
	clr.w	g_SceneVar3B48(a5)
	clr.w	g_SceneVar3B40(a5)
	clr.w	g_SentinelsA1PalTimer(a5)
	clr.w	g_SentinelsA1PalColour(a5)
	clr.w	g_SentinelsA1PalSeq(a5)
	clr.w	g_SentinelsA1ExitPalTimer(a5)
	clr.w	g_SentinelsA1ExitPalColour(a5)
	clr.w	g_SentinelsA1ExitPalSeq(a5)
	unlk	a6
	rts
