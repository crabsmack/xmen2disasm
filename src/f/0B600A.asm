; ---------------------------------------------------------------------------
; SavageA4_ResetPalCycles - SavageA4: reset the palette-cycle counters (three used by SavageA4_CyclePalettes, three nothing in the scene reads)
; In:  none
; Out: none
; Evidence: g_SceneVar3B34/g_SceneVar3B44/g_SceneVar3B3C/g_SceneVar3B36/g_SceneVar3B46/g_SceneVar3B3E := 0; caller SavageA4_InstallHooks
; ---------------------------------------------------------------------------
SavageA4_ResetPalCycles:
	link.w	a6,#$0
	clr.w	g_SceneVar3B34(a5)
	clr.w	g_SceneVar3B44(a5)
	clr.w	g_SceneVar3B3C(a5)
	clr.w	g_SceneVar3B36(a5)
	clr.w	g_SceneVar3B46(a5)
	clr.w	g_SceneVar3B3E(a5)
	unlk	a6
	rts
