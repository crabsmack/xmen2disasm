; ---------------------------------------------------------------------------
; CloneA2_LoadResources - load the two CloneA2 graphics/resource sets into g_MaintRobotSprDef and g_BioFlameSprDef
; In:  none
; Out: none
; Evidence: SprDef_Add(jt $3982 data, 1) -> g_MaintRobotSprDef, SprDef_Add(jt $3662 data, 3) -> g_BioFlameSprDef (same call shape as the actor ClassInit resource loads); called from CloneA2_InstallHooks
; ---------------------------------------------------------------------------
CloneA2_LoadResources:
	link.w	a6,#$0
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$3982(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,g_MaintRobotSprDef(a5)
	moveq	#$3,d0
	move.l	d0,-(a7)
	lea.l	$3662(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,g_BioFlameSprDef(a5)
	unlk	a6
	rts
