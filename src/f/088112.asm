; ---------------------------------------------------------------------------
; CloneA5_CamApply - CloneA5 camera apply hook: lock the camera to the arena, play g_CamShake, set the parallax scroll values from the boss offsets
; In:  8(a6) = camera
; Out: none
; Evidence: installed at camera +$C by CloneA5_CamSetHooks; g_CameraX/Y := camera +$30/+$32 forced to g_SceneVar3B24/g_SceneVar3B22; g_CamShake interpreter (dx,dy pairs, $64 end, $65 back, $66 call Sys_Nop1F945C); scroll words g_FgScrollX.. from g_BroodBossOffsetX/g_BroodBossOffsetY and the factors at g_FgScrollFactorY..; calls the hooks at g_MapColHook/g_MapRowHook with interrupts off; TAS 49258-52125 every frame
; Found: link-after-rts
; ---------------------------------------------------------------------------
CloneA5_CamApply:
	link.w	a6,#$0
	movem.l	d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$30(a4),d6
	move.w	$32(a4),d7
	move.w	g_CameraX(a5),d5
	move.w	g_CameraY(a5),d5
	move.w	d6,g_CameraX(a5)
	move.w	d7,g_CameraY(a5)
	move.w	g_CameraX(a5),d0
	cmp.w	g_SceneVar3B24(a5),d0
	beq.s	loc_088146
	move.w	g_SceneVar3B24(a5),g_CameraX(a5)
loc_088146:
	move.w	g_CameraY(a5),d0
	cmp.w	g_SceneVar3B22(a5),d0
	beq.s	loc_088156
	move.w	g_SceneVar3B22(a5),g_CameraY(a5)
loc_088156:
	tst.l	g_CamShake(a5)
	beq.s	loc_0881D2
	movea.l	g_CamShake(a5),a0
	moveq	#$64,d0
	cmp.b	(a0),d0
	bne.s	loc_08816E
	moveq	#$0,d0
	move.l	d0,g_CamShake(a5)
	bra.s	loc_0881D2
loc_08816E:
	movea.l	g_CamShake(a5),a0
	moveq	#$65,d0
	cmp.b	(a0),d0
	bne.s	loc_088186
	move.b	$1(a0),d0
	ext.w	d0
	ext.l	d0
	sub.l	d0,g_CamShake(a5)
	bra.s	loc_0881D2
loc_088186:
	movea.l	g_CamShake(a5),a0
	moveq	#$66,d0
	cmp.b	(a0),d0
	bne.s	loc_0881B2
	move.l	a0,d0
	addq.l	#$1,g_CamShake(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	movea.l	g_CamShake(a5),a0
	addq.l	#$1,g_CamShake(a5)
	move.b	(a0),d1
	ext.w	d1
	ext.l	d1
	move.l	d1,-(a7)
	jsr	$4F92(a5)	; -> Sys_Nop1F945C
	addq.w	#$8,a7
	bra.s	loc_0881D2
loc_0881B2:
	movea.l	g_CamShake(a5),a0
	addq.l	#$1,g_CamShake(a5)
	move.b	(a0),d0
	ext.w	d0
	add.w	d0,g_CameraX(a5)
	movea.l	g_CamShake(a5),a0
	addq.l	#$1,g_CamShake(a5)
	move.b	(a0),d0
	ext.w	d0
	add.w	d0,g_CameraY(a5)
loc_0881D2:
	move.l	g_BroodBossOffsetX(a5),d0
	asr.l	#$8,d0
	move.w	d0,g_BgScrollBaseX(a5)
	move.l	g_BroodBossOffsetY(a5),d0
	asr.l	#$8,d0
	move.w	d0,g_BgScrollBaseY(a5)
	move.w	g_SceneVar3B02(a5),d0
	add.w	d0,g_FgScrollX(a5)
	move.w	g_FgScrollFactorY(a5),d0
	muls.w	g_CameraY(a5),d0
	asr.l	#$8,d0
	add.w	g_FgScrollBaseY(a5),d0
	move.w	d0,g_FgScrollY(a5)
	move.w	g_BgScrollFactorX(a5),d0
	muls.w	g_CameraX(a5),d0
	asr.l	#$8,d0
	add.w	g_BgScrollBaseX(a5),d0
	move.w	d0,g_BgScrollX(a5)
	move.w	g_BgScrollFactorY(a5),d0
	muls.w	g_CameraY(a5),d0
	asr.l	#$8,d0
	add.w	g_BgScrollBaseY(a5),d0
	move.w	d0,g_BgScrollY(a5)
	clr.w	g_SceneVar3B02(a5)
	move.w	g_CloneA5CamFlags(a5),d0
	btst	#$0,d0
	beq.s	loc_088250
	move.w	g_FgScrollX(a5),d0
	ext.l	d0
	cmp.l	g_SceneVar3B20(a5),d0
	bge.s	loc_088250
	addi.w	#$3C0,g_FgScrollX(a5)
	addi.w	#$3C0,g_FgStreamX(a5)
	subi.w	#$3C0,g_FgScrollAdjX(a5)
loc_088250:
	jsr	$4D9A(a5)	; -> Irq_Disable
	movea.l	g_MapColHook(a5),a0
	jsr	(a0)
	movea.l	g_MapRowHook(a5),a0
	jsr	(a0)
	jsr	$4DA2(a5)	; -> Irq_Enable
	move.b	#$1,g_FgScrollDirty(a5)
	move.b	#$1,g_BgScrollDirty(a5)
	movem.l	-$10(a6),d5-d7/a4
	unlk	a6
	rts
