; ---------------------------------------------------------------------------
; sub_1F60E4	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1F60E4:
	link.w	a6,#$0
	movem.l	d6-d7,-(a7)
	move.w	g_CameraX(a5),d6
	move.w	g_CameraY(a5),d7
	move.w	$A(a6),g_CameraX(a5)
	move.w	$E(a6),g_CameraY(a5)
	move.w	g_CameraX(a5),d0
	cmp.w	g_CamMaxX(a5),d0
	ble.s	loc_1F6110
	move.w	g_CamMaxX(a5),g_CameraX(a5)
loc_1F6110:
	move.w	g_CameraX(a5),d0
	cmp.w	g_CamMinX(a5),d0
	bge.s	loc_1F6120
	move.w	g_CamMinX(a5),g_CameraX(a5)
loc_1F6120:
	move.w	g_CameraY(a5),d0
	cmp.w	g_CamMaxY(a5),d0
	ble.s	loc_1F6130
	move.w	g_CamMaxY(a5),g_CameraY(a5)
loc_1F6130:
	move.w	g_CameraY(a5),d0
	cmp.w	g_CamMinY(a5),d0
	bge.s	loc_1F6140
	move.w	g_CamMinY(a5),g_CameraY(a5)
loc_1F6140:
	tst.b	g_BgOffsetOn(a5)
	bne.s	loc_1F6160
	tst.b	g_BgLockToObj(a5)
	bne.s	loc_1F6160
	cmp.w	g_CameraX(a5),d6
	bne.s	loc_1F6160
	cmp.w	g_CameraY(a5),d7
	bne.s	loc_1F6160
	tst.b	g_ScrollResync(a5)
	beq.w	loc_1F624E
loc_1F6160:
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
	tst.b	g_ScrollResync(a5)
	beq.s	loc_1F6190
	addi.w	#$100,g_FgStreamY(a5)
loc_1F6190:
	clr.b	g_ScrollResync(a5)
	tst.b	g_BgLockToObj(a5)
	beq.s	loc_1F61D4
	movea.l	g_BgLockObj(a5),a0
	move.l	$8(a0),d0
	asr.l	#$8,d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.w	g_BgOffsetX(a5),d1
	sub.w	d0,d1
	move.w	d1,g_BgScrollX(a5)
	movea.l	g_BgLockObj(a5),a0
	move.l	$C(a0),d0
	asr.l	#$8,d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.w	g_BgOffsetY(a5),d1
	sub.w	d0,d1
	move.w	d1,g_BgScrollY(a5)
	bra.s	loc_1F6216
loc_1F61D4:
	move.w	g_BgScrollFactorX(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	g_CameraX(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	Math_MulFix8(pc)
	move.w	d0,g_BgScrollX(a5)
	move.w	g_BgScrollFactorY(a5),d0
	muls.w	g_CameraY(a5),d0
	asr.l	#$8,d0
	add.w	g_BgScrollBaseY(a5),d0
	move.w	d0,g_BgScrollY(a5)
	tst.b	g_BgOffsetOn(a5)
	addq.w	#$8,a7
	beq.s	loc_1F6216
	move.w	g_BgOffsetX(a5),d0
	add.w	d0,g_BgScrollX(a5)
	move.w	g_BgOffsetY(a5),d0
	add.w	d0,g_BgScrollY(a5)
loc_1F6216:
	tst.b	g_BgWrapX(a5)
	beq.s	loc_1F6222
	andi.w	#$1FF,g_BgScrollX(a5)
loc_1F6222:
	tst.b	g_BgWrapY(a5)
	beq.s	loc_1F622E
	andi.w	#$FF,g_BgScrollY(a5)
loc_1F622E:
	jsr	$4D9A(a5)	; -> Irq_Disable
	movea.l	g_MapColHook(a5),a0
	jsr	(a0)
	movea.l	g_MapRowHook(a5),a0
	jsr	(a0)
	jsr	$4DA2(a5)	; -> Irq_Enable
	move.b	#$1,g_FgScrollDirty(a5)
	move.b	g_BgMapPresent(a5),g_BgScrollDirty(a5)
loc_1F624E:
	movem.l	-$8(a6),d6-d7
	unlk	a6
	rts
