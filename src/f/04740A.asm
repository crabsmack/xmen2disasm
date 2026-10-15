; ---------------------------------------------------------------------------
; BaniMazaA2_ResetCounters - reset the BaniMazaA2 palette-animation counters and flags
; In:  none
; Out: none
; Evidence: g_SceneVar3B0C, g_SceneVar3B0E = 0; g_SceneVar3B02 = 2; g_SceneVar3B32 = 2, g_SceneVar3B34 = 4, g_SceneVar3B36 = 6, g_SceneVar3B38 = 6; g_SceneVar3B0A = 1
; ---------------------------------------------------------------------------
BaniMazaA2_ResetCounters:
	link.w	a6,#$0
	clr.w	g_SceneVar3B0C(a5)
	clr.w	g_SceneVar3B0E(a5)
	move.w	#$2,g_SceneVar3B02(a5)
	move.w	g_SceneVar3B02(a5),g_SceneVar3B32(a5)
	clr.w	g_SceneVar3B3A(a5)
	move.w	#$4,g_SceneVar3B34(a5)
	clr.w	g_SceneVar3B3C(a5)
	clr.w	g_SceneVar3B06(a5)
	move.w	#$1,g_SceneVar3B0A(a5)
	move.w	#$6,g_SceneVar3B38(a5)
	move.w	g_SceneVar3B38(a5),g_SceneVar3B36(a5)
	clr.w	g_SceneVar3B3E(a5)
	unlk	a6
	rts
