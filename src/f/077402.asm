; ---------------------------------------------------------------------------
; CloneA1_ResetPalCycle - reset the CloneA1 palette-cycle counters
; In:  none
; Out: none
; Evidence: clears g_SceneVar3B32/g_SceneVar3B42/g_SceneVar3B3A and g_SceneVar3B34/g_SceneVar3B44/g_SceneVar3B3C
; ---------------------------------------------------------------------------
CloneA1_ResetPalCycle:
	link.w	a6,#$0
	clr.w	g_SceneVar3B32(a5)
	clr.w	g_SceneVar3B42(a5)
	clr.w	g_SceneVar3B3A(a5)
	clr.w	g_SceneVar3B34(a5)
	clr.w	g_SceneVar3B44(a5)
	clr.w	g_SceneVar3B3C(a5)
	unlk	a6
	rts
