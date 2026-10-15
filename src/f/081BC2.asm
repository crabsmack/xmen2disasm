; ---------------------------------------------------------------------------
; CloneA2_FlickerInit - reset the CloneA2 palette flicker counters
; In:  none
; Out: none
; Evidence: sets g_SceneVar3B32=2 g_SceneVar3B3A=$1A (Tbl_CloneA2FlickerPattern length) g_SceneVar3B34=9 g_SceneVar3B3C=6 g_SceneVar3B04=0, the counters CloneA2_FlickerUpdate counts down; jt 552; called from CloneA2_InstallHooks
; ---------------------------------------------------------------------------
CloneA2_FlickerInit:
	link.w	a6,#$0
	move.w	#$2,g_SceneVar3B32(a5)
	move.w	#$1A,g_SceneVar3B3A(a5)
	move.w	#$9,g_SceneVar3B34(a5)
	move.w	#$6,g_SceneVar3B3C(a5)
	clr.w	g_SceneVar3B04(a5)
	unlk	a6
	rts
