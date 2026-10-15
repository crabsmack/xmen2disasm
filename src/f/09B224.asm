; ---------------------------------------------------------------------------
; BroodClaw_Swing - BROODCLAW motion: swing out/in along +$9C by the speed +$16; while retracting push the boss offset (-$3C44) or the scroll step (-$3B02, mode +$90); set the arm frame; hand the camera over when the scroll reaches the arena edge
; In:  8(a6) = this
; Out: none
; Evidence: arm frame byte -$3B10 by swing range; ends set +$8B, -$3B0C |= $10, g_CamShake := $088B06; x = home + offset - boss offset; with +$91 and mode 1 past -$3B20: camera +4 = Cam_DefaultUpdate, +$C = BroodClaw_CamApplyShake, XClone_CamSetNormal, -$3B0C |= $80, LineSegKiller_KillAll; TAS 49418-52266
; Found: jt 841
; ---------------------------------------------------------------------------
BroodClaw_Swing:
	link.w	a6,#$0
	movem.l	d4-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a4),d6
	clr.b	d6
	clr.b	d4
	clr.w	d7
	tst.b	$8B(a4)
	bne.w	loc_09B2F4
	moveq	#$4,d7
	move.w	#$FF00,d0
	and.w	$16(a4),d0
	ext.l	d0
	add.l	d0,$9C(a4)
	tst.l	$96(a4)
	beq.s	loc_09B292
	cmpi.l	#$2400,$9C(a4)
	ble.s	loc_09B26A
	move.w	#$4,-$3B10(a5)
	bra.s	loc_09B292
loc_09B26A:
	cmpi.l	#$1800,$9C(a4)
	ble.s	loc_09B27A
	clr.w	-$3B10(a5)
	bra.s	loc_09B292
loc_09B27A:
	cmpi.l	#$A00,$9C(a4)
	ble.s	loc_09B28C
	move.w	#$1,-$3B10(a5)
	bra.s	loc_09B292
loc_09B28C:
	move.w	#$2,-$3B10(a5)
loc_09B292:
	move.l	$9C(a4),d0
	asr.l	#$8,d0
	move.l	d0,d5
	asr.l	#$1,d5
	ext.l	d5
	move.l	d5,-(a7)
	jsr	$517A(a5)	; -> Math_SinDeg
	asr.l	#$3,d0
	add.w	d0,d7
	tst.l	$9C(a4)
	addq.w	#$4,a7
	ble.s	loc_09B2C4
	move.w	$9A(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	cmp.l	$9C(a4),d0
	ble.s	loc_09B2C4
	tst.b	d4
	beq.w	loc_09B388
loc_09B2C4:
	move.b	#$1,$8B(a4)
	ori.w	#$10,-$3B0C(a5)
	moveq	#$1,d6
	clr.w	d7
	tst.l	$9C(a4)
	bgt.s	loc_09B2E4
	moveq	#$0,d0
	move.l	d0,$9C(a4)
	bra.w	loc_09B388
loc_09B2E4:
	move.w	$9A(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$9C(a4)
	bra.w	loc_09B388
loc_09B2F4:
	clr.w	d7
	move.w	#$FF00,d0
	and.w	$16(a4),d0
	ext.l	d0
	sub.l	d0,$9C(a4)
	tst.b	$90(a4)
	beq.s	loc_09B316
	move.w	$16(a4),d0
	asr.w	#$8,d0
	add.w	d0,-$3B02(a5)
	bra.s	loc_09B324
loc_09B316:
	move.w	#$FF00,d0
	and.w	$16(a4),d0
	ext.l	d0
	sub.l	d0,g_BroodBossOffsetX(a5)
loc_09B324:
	tst.l	$96(a4)
	beq.s	loc_09B354
	cmpi.l	#$D00,$9C(a4)
	bge.s	loc_09B33C
	move.w	#$2,-$3B10(a5)
	bra.s	loc_09B354
loc_09B33C:
	cmpi.l	#$2200,$9C(a4)
	bge.s	loc_09B34E
	move.w	#$3,-$3B10(a5)
	bra.s	loc_09B354
loc_09B34E:
	move.w	#$4,-$3B10(a5)
loc_09B354:
	tst.l	$9C(a4)
	ble.s	loc_09B368
	move.w	$9A(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	cmp.l	$9C(a4),d0
	bgt.s	loc_09B388
loc_09B368:
	clr.b	$8B(a4)
	moveq	#$4,d7
	tst.l	$9C(a4)
	bgt.s	loc_09B37C
	moveq	#$0,d0
	move.l	d0,$9C(a4)
	bra.s	loc_09B388
loc_09B37C:
	move.w	$9A(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$9C(a4)
loc_09B388:
	move.w	$10(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	$9C(a4),d1
	add.l	d0,d1
	sub.l	g_BroodBossOffsetX(a5),d1
	move.l	d1,$8(a4)
	move.w	$12(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	ext.l	d7
	sub.l	d7,d0
	move.l	d0,$C(a4)
	tst.b	d6
	beq.s	loc_09B3BC
	lea.l	$14C2(a5),a0
	move.l	$2(a0),g_CamShake(a5)
loc_09B3BC:
	tst.b	$91(a4)
	beq.w	loc_09B454
	move.w	g_FgScrollX(a5),d0
	ext.l	d0
	move.w	$16(a4),d1
	asr.w	#$8,d1
	ext.l	d1
	add.l	d0,d1
	cmp.l	-$3B20(a5),d1
	bge.s	loc_09B454
	tst.b	$90(a4)
	beq.s	loc_09B454
	clr.b	$90(a4)
	lea.l	$4212(a5),a0
	movea.l	g_Camera(a5),a1
	move.l	a0,$4(a1)
	lea.l	BroodClaw_CamApplyShake(pc),a0
	movea.l	g_Camera(a5),a1
	move.l	a0,$C(a1)
	movea.l	g_Camera(a5),a0
	moveq	#$0,d0
	move.l	d0,$14(a0)
	movea.l	g_Camera(a5),a0
	move.l	d0,$1C(a0)
	movea.l	g_Camera(a5),a0
	move.w	g_CameraX(a5),$30(a0)
	movea.l	g_Camera(a5),a0
	move.w	g_CameraY(a5),$32(a0)
	move.b	#$1,g_CamModeSwitched(a5)
	movea.l	g_Camera(a5),a0
	clr.w	$2C(a0)
	movea.l	g_Camera(a5),a0
	clr.w	$2E(a0)
	movea.l	g_Camera(a5),a0
	clr.w	$5C(a0)
	move.l	g_Camera(a5),-(a7)
	jsr	$18FA(a5)	; -> XClone_CamSetNormal
	ori.w	#$80,-$3B0C(a5)
	jsr	$3912(a5)	; -> LineSegKiller_KillAll
	addq.w	#$4,a7
loc_09B454:
	movem.l	-$14(a6),d4-d7/a4
	unlk	a6
	rts
