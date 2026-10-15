; ---------------------------------------------------------------------------
; SiberiaB1_CamApply - SiberiaB1: camera to scroll globals with bounds clamp and parallax, adding the wind vector to the background scroll
; In:  8(a6) = camera
; Out: none
; Evidence: g_CameraX/g_CameraY, bounds $FFC76C-$FFC772, $FFC73E += wind $FFC744, hooks $FFC7AC/$FFC7B0
; ---------------------------------------------------------------------------
SiberiaB1_CamApply:
	link.w	a6,#$0
	movem.l	d4-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$2C(a4),d4
	add.w	$30(a4),d4
	move.w	$32(a4),d0
	ext.l	d0
	move.w	$2E(a4),d1
	ext.l	d1
	add.l	d0,d1
	move.w	$5C(a4),d5
	add.w	d1,d5
	move.w	-$3AC6(a5),d6
	move.w	-$3AC8(a5),d7
	move.w	d4,g_CameraX(a5)
	move.w	d5,g_CameraY(a5)
	move.w	g_CameraX(a5),d0
	cmp.w	g_CamMaxX(a5),d0
	ble.s	loc_0FC7D2
	move.w	g_CamMaxX(a5),g_CameraX(a5)
loc_0FC7D2:
	move.w	g_CameraX(a5),d0
	cmp.w	g_CamMinX(a5),d0
	bge.s	loc_0FC7E2
	move.w	g_CamMinX(a5),g_CameraX(a5)
loc_0FC7E2:
	move.w	g_CameraY(a5),d0
	cmp.w	g_CamMaxY(a5),d0
	ble.s	loc_0FC7F2
	move.w	g_CamMaxY(a5),g_CameraY(a5)
loc_0FC7F2:
	move.w	g_CameraY(a5),d0
	cmp.w	g_CamMinY(a5),d0
	bge.s	loc_0FC802
	move.w	g_CamMinY(a5),g_CameraY(a5)
loc_0FC802:
	move.w	-$3ABC(a5),d0
	add.w	d0,-$3AC2(a5)
	move.w	-$3ABE(a5),d0
	add.w	d0,-$3AC4(a5)
	move.w	-$3496(a5),d0
	muls.w	g_CameraX(a5),d0
	asr.l	#$8,d0
	add.w	-$349C(a5),d0
	move.w	d0,-$3AC6(a5)
	move.w	-$3498(a5),d0
	muls.w	g_CameraY(a5),d0
	asr.l	#$8,d0
	add.w	-$34A0(a5),d0
	move.w	d0,-$3AC8(a5)
	move.w	-$3AC6(a5),d0
	sub.w	d6,d0
	add.w	d0,-$3AC2(a5)
	move.w	-$3AC8(a5),d0
	sub.w	d7,d0
	add.w	d0,-$3AC4(a5)
	tst.b	-$3AC0(a5)
	beq.s	loc_0FC856
	addi.w	#$100,-$3AD0(a5)
loc_0FC856:
	clr.b	-$3AC0(a5)
	andi.w	#$1FF,-$3AC2(a5)
	andi.w	#$FF,-$3AC4(a5)
	jsr	$4D9A(a5)	; -> Irq_Disable
	movea.l	-$3A54(a5),a0
	jsr	(a0)
	movea.l	-$3A50(a5),a0
	jsr	(a0)
	jsr	$4DA2(a5)	; -> Irq_Enable
	move.b	#$1,-$3A58(a5)
	move.b	-$3A64(a5),-$3A56(a5)
	movem.l	-$14(a6),d4-d7/a4
	unlk	a6
	rts
