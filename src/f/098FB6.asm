; ---------------------------------------------------------------------------
; XClone_LoadResources - load the clone-maker resources (clone art, effects)
; In:  none
; Out: none
; Evidence: SprDef_Add x4 -> -$3C3E, effect pool -$3B1C+4, -$1A84, -$1A88; GaussBullet_InitPool; run via Spr_ReloadDefs by XClone_StartMakerMode; TAS 52804
; Found: link-after-rts
; ---------------------------------------------------------------------------
XClone_LoadResources:
	link.w	a6,#$0
	moveq	#$2,d0
	move.l	d0,-(a7)
	lea.l	$433A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,g_EvilBeastThrowSprDef(a5)
	moveq	#$2,d0
	move.l	d0,-(a7)
	lea.l	$1542(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	movea.l	g_SceneVar3B1C(a5),a0
	move.w	d0,$4(a0)
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$37B2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,g_FlyBroodSprDef(a5)
	moveq	#$3,d0
	move.l	d0,-(a7)
	lea.l	$3662(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,g_BioFlameSprDef(a5)
	jsr	$2E8A(a5)	; -> GaussBullet_InitPool
	unlk	a6
	rts
