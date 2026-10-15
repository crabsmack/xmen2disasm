; ---------------------------------------------------------------------------
; Cerebro_AnimatePalettes_EndB - tail of Cerebro_AnimatePalettes: advance the second sequence index (wraps after 7)
; In:  none
; Out: none
; Evidence: common exit of the Sw_064DD2 cases; sets g_PalBaseDirty
; ---------------------------------------------------------------------------
Cerebro_AnimatePalettes_EndB:
	addq.w	#$1,g_SceneVar3B3A(a5)
	moveq	#$7,d0
	cmp.w	g_SceneVar3B3A(a5),d0
	bge.s	loc_064E92
	clr.w	g_SceneVar3B3A(a5)
loc_064E92:
	move.b	#$1,g_PalBaseDirty(a5)
loc_064E98:
	unlk	a6
	rts
