; ---------------------------------------------------------------------------
; ControlBox_Init - parent Init, then no vertical speed, health 100, flags |= $4083, sprite set g_ControlPanelSprDef (palette 0); from the placement (or defaults): switch +$98 (+6), +$9E (+8, $B4), blast speed +$A0 (+$A, $300), +$A2/+$A3 = bytes +$D/+$F, switch flag word +$8C = &(-$3BFA)[switch]; switch already on (bit 0): ControlBox_StateArm, frame $FF and start its pattern (slot +$6E), else ControlBox_StateWaitSwitch (CONTROLBOX override of slot +$12 Init)
; In:  8(a6) = this, $C(a6) = long x, $10(a6) = long y (8 fraction bits), $14(a6) = placement entry or null
; Out: none
; Evidence: slot +$12 of the CONTROLBOX descriptor $0DDA02; TAS frames 2522-7098 (52 frames active)
; ---------------------------------------------------------------------------
ControlBox_Init:
	link.w	a6,#$FFF0
	movem.l	d6-d7/a3-a4,-(a7)
	move.l	$10(a6),d6
	move.l	$C(a6),d7
	movea.l	$14(a6),a4
	movea.l	$8(a6),a3
	move.l	a4,-(a7)
	move.l	d6,-(a7)
	move.l	d7,-(a7)
	move.l	a3,-(a7)
	lea.l	$2522(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$18(a3)
	clr.w	$20(a3)
	move.w	#$64,$68(a3)
	ori.w	#$4083,$6(a3)
	move.w	g_ControlPanelSprDef(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	jsr	$4E5A(a5)	; -> Obj_SetSpriteDef
	moveq	#-$4,d0
	and.b	$2E(a3),d0
	moveq	#$0,d1
	or.b	d0,d1
	move.b	d1,$2E(a3)
	move.l	a4,d0
	lea.l	$18(a7),a7
	bne.s	loc_0DD6BC
	lea.l	-$10(a6),a4
	move.l	d7,d0
	asr.l	#$8,d0
	move.w	d0,$2(a4)
	move.l	d6,d0
	asr.l	#$8,d0
	move.w	d0,$4(a4)
	clr.w	$6(a4)
	move.w	#$B4,$8(a4)
	move.w	#$300,$A(a4)
	clr.l	$C(a4)
loc_0DD6BC:
	move.w	$6(a4),$98(a3)
	move.w	$8(a4),d7
	beq.s	loc_0DD6CE
	move.w	d7,$9E(a3)
	bra.s	loc_0DD6D4
loc_0DD6CE:
	move.w	#$B4,$9E(a3)
loc_0DD6D4:
	move.w	$A(a4),d7
	beq.s	loc_0DD6E0
	move.w	d7,$A0(a3)
	bra.s	loc_0DD6E6
loc_0DD6E0:
	move.w	#$300,$A0(a3)
loc_0DD6E6:
	move.b	$D(a4),$A2(a3)
	move.b	$F(a4),$A3(a3)
	move.w	$98(a3),d0
	ext.l	d0
	movea.l	-$3BFA(a5),a0
	add.l	d0,d0
	adda.l	d0,a0
	move.l	a0,$8C(a3)
	movea.l	a0,a4
	move.w	(a4),d0
	btst	#$0,d0
	beq.s	loc_0DD73C
	lea.l	ControlBox_StateArm(pc),a0
	move.l	a0,$5C(a3)
	lea.l	ControlBox_StateArm(pc),a0
	move.l	a0,$64(a3)
	pea.l	($FF).w
	move.l	a3,-(a7)
	movea.l	(a3),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.l	a3,-(a7)
	movea.l	(a3),a0
	movea.l	$6E(a0),a1
	jsr	(a1)
	lea.l	$C(a7),a7
	bra.s	loc_0DD750
loc_0DD73C:
	lea.l	ControlBox_StateWaitSwitch(pc),a0
	move.l	a0,$5C(a3)
	lea.l	ControlBox_StateWaitSwitch(pc),a0
	move.l	a0,$64(a3)
	clr.w	$9A(a3)
loc_0DD750:
	movem.l	-$20(a6),d6-d7/a3-a4
	unlk	a6
	rts
