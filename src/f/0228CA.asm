; ---------------------------------------------------------------------------
; AvalonA2_ResetCounters - reset the AvalonA2 scene counters g_SceneVar3B32 = 1 and g_SceneVar3B3A = 0
; In:  none
; Out: none
; Evidence: called by AvalonA2_RunScene before the level loop
; ---------------------------------------------------------------------------
AvalonA2_ResetCounters:
	link.w	a6,#$0
	move.w	#$1,g_SceneVar3B32(a5)
	clr.w	g_SceneVar3B3A(a5)
	unlk	a6
	rts
