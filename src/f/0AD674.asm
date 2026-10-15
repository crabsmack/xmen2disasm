; ---------------------------------------------------------------------------
; SavageA2_CamApply - SavageA2 camera apply hook: clamp the camera to the limits, parallax scroll values, flood-line raster position
; In:  8(a6) = camera
; Out: none
; Evidence: g_BgScrollY = $100 - (flood - g_CameraY); scroll hooks g_MapColHook/g_MapRowHook with interrupts off; installed at camera +$C; jt 894; TAS 30901-33098
; Found: jt 894
; ---------------------------------------------------------------------------
SavageA2_CamApply:
	link.w	a6,#$0
	movem.l	d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$30(a4),d0
	ext.l	d0
	move.w	$2C(a4),d1
	ext.l	d1
	move.l	d1,d6
	add.l	d0,d6
	move.w	$32(a4),d0
	ext.l	d0
	move.w	$2E(a4),d1
	ext.l	d1
	add.l	d0,d1
	move.w	$5C(a4),d0
	ext.l	d0
	move.l	d0,d7
	add.l	d1,d7
	move.w	g_CameraX(a5),d5
	move.w	g_CameraY(a5),d5
	move.w	d6,g_CameraX(a5)
	move.w	d7,g_CameraY(a5)
	move.w	g_CameraX(a5),d0
	cmp.w	g_CamMaxX(a5),d0
	ble.s	loc_0AD6C8
	move.w	g_CamMaxX(a5),g_CameraX(a5)
loc_0AD6C8:
	move.w	g_CameraX(a5),d0
	cmp.w	g_CamMinX(a5),d0
	bge.s	loc_0AD6D8
	move.w	g_CamMinX(a5),g_CameraX(a5)
loc_0AD6D8:
	move.w	g_CameraY(a5),d0
	cmp.w	g_CamMaxY(a5),d0
	ble.s	loc_0AD6E8
	move.w	g_CamMaxY(a5),g_CameraY(a5)
loc_0AD6E8:
	move.w	g_CameraY(a5),d0
	cmp.w	g_CamMinY(a5),d0
	bge.s	loc_0AD6F8
	move.w	g_CamMinY(a5),g_CameraY(a5)
loc_0AD6F8:
	move.w	g_FgScrollFactorX(a5),d0
	muls.w	g_CameraX(a5),d0
	asr.l	#$8,d0
	add.w	g_FgScrollBaseX(a5),d0
	move.w	d0,g_FgScrollX(a5)
	move.w	g_FgScrollFactorY(a5),d0
	muls.w	g_CameraY(a5),d0
	asr.l	#$8,d0
	add.w	g_FgScrollBaseY(a5),d0
	move.w	d0,g_FgScrollY(a5)
	move.w	g_BgScrollFactorX(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	g_CameraX(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$4E3A(a5)	; -> Math_MulFix8
	move.w	d0,g_BgScrollX(a5)
	move.w	g_FloodLineY(a5),d0
	ext.l	d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.w	#$100,d1
	sub.w	d0,d1
	move.w	d1,g_BgScrollY(a5)
	tst.b	g_BgWrapX(a5)
	addq.w	#$8,a7
	beq.s	loc_0AD75A
	andi.w	#$1FF,g_BgScrollX(a5)
loc_0AD75A:
	tst.b	g_BgWrapY(a5)
	beq.s	loc_0AD766
	andi.w	#$FF,g_BgScrollY(a5)
loc_0AD766:
	jsr	$4D9A(a5)	; -> Irq_Disable
	movea.l	g_MapColHook(a5),a0
	jsr	(a0)
	movea.l	g_MapRowHook(a5),a0
	jsr	(a0)
	jsr	$4DA2(a5)	; -> Irq_Enable
	move.b	#$1,g_FgScrollDirty(a5)
	move.b	g_BgMapPresent(a5),g_BgScrollDirty(a5)
	movem.l	-$10(a6),d5-d7/a4
	unlk	a6
	rts
