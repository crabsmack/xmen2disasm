; ---------------------------------------------------------------------------
; BroodClaw_CamApplyShake - camera apply hook after the boss scroll: play g_CamShake and set the camera position (Cam_SetPos)
; In:  8(a6) = camera
; Out: none
; Evidence: installed at camera +$C by BroodClaw_Swing; position = +$30/+$32 + +$2C/+$2E (+$5C) + shake; TAS 52126-57465
; Found: link-after-rts
; ---------------------------------------------------------------------------
BroodClaw_CamApplyShake:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	d6
	clr.w	d7
	tst.l	g_CamShake(a5)
	beq.s	loc_09B928
	movea.l	g_CamShake(a5),a0
	moveq	#$64,d0
	cmp.b	(a0),d0
	bne.s	loc_09B8C8
	moveq	#$0,d0
	move.l	d0,g_CamShake(a5)
	bra.s	loc_09B928
loc_09B8C8:
	movea.l	g_CamShake(a5),a0
	moveq	#$65,d0
	cmp.b	(a0),d0
	bne.s	loc_09B8E0
	move.b	$1(a0),d0
	ext.w	d0
	ext.l	d0
	sub.l	d0,g_CamShake(a5)
	bra.s	loc_09B928
loc_09B8E0:
	movea.l	g_CamShake(a5),a0
	moveq	#$66,d0
	cmp.b	(a0),d0
	bne.s	loc_09B90C
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
	bra.s	loc_09B928
loc_09B90C:
	movea.l	g_CamShake(a5),a0
	addq.l	#$1,g_CamShake(a5)
	move.b	(a0),d0
	ext.w	d0
	move.w	d0,d6
	movea.l	g_CamShake(a5),a0
	addq.l	#$1,g_CamShake(a5)
	move.b	(a0),d0
	ext.w	d0
	move.w	d0,d7
loc_09B928:
	move.w	$32(a4),d0
	ext.l	d0
	move.w	$2E(a4),d1
	ext.l	d1
	add.l	d0,d1
	move.w	$5C(a4),d0
	ext.l	d0
	add.l	d1,d0
	ext.l	d7
	add.l	d7,d0
	move.l	d0,-(a7)
	move.w	$30(a4),d0
	ext.l	d0
	move.w	$2C(a4),d1
	ext.l	d1
	add.l	d0,d1
	ext.l	d6
	add.l	d6,d1
	move.l	d1,-(a7)
	jsr	$4E32(a5)	; -> Cam_SetPos
	addq.w	#$8,a7
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
