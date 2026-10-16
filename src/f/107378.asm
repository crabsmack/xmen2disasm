; ---------------------------------------------------------------------------
; SpaceB1_ResetPalCycles - SpaceB1: set four palette cycles' delay and step (only the first two are ever read)
; In:  none
; Out: none
; Evidence: $FFC6CC/$FFC6C4 and $FFC6CA/$FFC6C2
; ---------------------------------------------------------------------------
SpaceB1_ResetPalCycles:
	link.w	a6,#$0
	move.w	#$3,g_SceneVar3B34(a5)
	clr.w	g_SceneVar3B3C(a5)
	move.w	#$2,g_SceneVar3B36(a5)
	clr.w	g_SceneVar3B3E(a5)
	move.w	#$1,g_SceneVar3B38(a5)
	clr.w	g_SceneVar3B40(a5)
	move.w	#$2,g_SpaceB1Cycle4Delay(a5)
	clr.w	g_SpaceB1Cycle4Step(a5)
	unlk	a6
	rts
