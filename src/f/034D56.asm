; ---------------------------------------------------------------------------
; AvalonA4_ResetEffectCounters - reset the AvalonA4 stage-effect counters used by AvalonA4_AnimatePalettes
; In:  none
; Out: none
; Evidence: called by AvalonA4_RunScene; byte g_AvalonA4PalStep = 0, g_SceneVar3B32 = 5, g_SceneVar3B3A = 0, g_SceneVar3B34 = 4, g_SceneVar3B3C = 0
; ---------------------------------------------------------------------------
AvalonA4_ResetEffectCounters:
	link.w	a6,#$0
	jsr	AvalonA4_NopStatic(pc)
	clr.b	g_AvalonA4PalStep(a5)
	move.w	#$5,g_SceneVar3B32(a5)
	clr.w	g_SceneVar3B3A(a5)
	move.w	#$4,g_SceneVar3B34(a5)
	clr.w	g_SceneVar3B3C(a5)
	unlk	a6
	rts
