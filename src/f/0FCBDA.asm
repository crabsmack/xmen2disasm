; ---------------------------------------------------------------------------
; SiberiaB1_UpdateWindSprite - SiberiaB1: pick wind-indicator sprite frame 1-4 from the wind angle when the wind is strong (>= $900), else 0
; In:  none
; Out: none
; Evidence: Spr_SetFrame on sprite slot $FFCC6A
; ---------------------------------------------------------------------------
SiberiaB1_UpdateWindSprite:
	link.w	a6,#$0
	move.l	d7,-(a7)
	move.w	g_SceneVar3B3A(a5),d7
	clr.w	g_SceneVar3B3A(a5)
	tst.w	g_SceneVar3B04(a5)
	blt.s	loc_0FCC34
	cmpi.w	#$900,g_SceneVar3B06(a5)
	blt.s	loc_0FCC34
	moveq	#$B,d0
	cmp.w	g_SceneVar3B04(a5),d0
	ble.s	loc_0FCC06
	move.w	#$1,g_SceneVar3B3A(a5)
	bra.s	loc_0FCC34
loc_0FCC06:
	moveq	#$23,d0
	cmp.w	g_SceneVar3B04(a5),d0
	ble.s	loc_0FCC16
	move.w	#$2,g_SceneVar3B3A(a5)
	bra.s	loc_0FCC34
loc_0FCC16:
	moveq	#$37,d0
	cmp.w	g_SceneVar3B04(a5),d0
	ble.s	loc_0FCC26
	move.w	#$3,g_SceneVar3B3A(a5)
	bra.s	loc_0FCC34
loc_0FCC26:
	moveq	#$55,d0
	cmp.w	g_SceneVar3B04(a5),d0
	ble.s	loc_0FCC34
	move.w	#$4,g_SceneVar3B3A(a5)
loc_0FCC34:
	cmp.w	g_SceneVar3B3A(a5),d7
	beq.s	loc_0FCC5A
	move.w	g_SceneVar3B3A(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	pea.l	g_SceneSprites(a5)
	jsr	$507A(a5)	; -> Spr_SetFrame
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	g_SceneSprites(a5)
	jsr	$5062(a5)	; -> Spr_UploadFrame
	lea.l	$10(a7),a7
loc_0FCC5A:
	move.l	-$4(a6),d7
	unlk	a6
	rts
