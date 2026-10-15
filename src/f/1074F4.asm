; ---------------------------------------------------------------------------
; SpaceB1_CyclePalettes_NextB - SpaceB1_CyclePalettes: advance the second cycle (wrap after 8)
; In:  -
; Out: -
; Evidence: shared tail of the Sw_10746C cases
; ---------------------------------------------------------------------------
SpaceB1_CyclePalettes_NextB:
	addq.w	#$1,g_SceneVar3B3E(a5)
	moveq	#$7,d0
	cmp.w	g_SceneVar3B3E(a5),d0
	bge.s	loc_107504
	clr.w	g_SceneVar3B3E(a5)
loc_107504:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
