; ---------------------------------------------------------------------------
; Barbarian_SetupLeap - BARBARIAN: set up a leap to the target point if it is within $96 px on both axes
; In:  8(a6) = this
; Out: d0 = 1 when leaping
; Evidence: velocities from Math_LDivS, facing by direction, gravity / max speed set, +4 bit $1000, frame $12; TAS 28049
; Found: link-after-rts
; ---------------------------------------------------------------------------
Barbarian_SetupLeap:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$9E(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,d7
	sub.l	$8(a4),d7
	move.w	$A0(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,d5
	sub.l	$C(a4),d5
	tst.l	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_0BD8C8
	move.l	d7,d0
	bra.s	loc_0BD8CC
loc_0BD8C8:
	move.l	d7,d0
	neg.l	d0
loc_0BD8CC:
	cmpi.l	#$9600,d0
	ble.s	loc_0BD8DA
	moveq	#$0,d0
	bra.w	loc_0BD9E6
loc_0BD8DA:
	tst.l	d5
	sge.b	d3
	neg.b	d3
	beq.s	loc_0BD8E6
	move.l	d5,d0
	bra.s	loc_0BD8EA
loc_0BD8E6:
	move.l	d5,d0
	neg.l	d0
loc_0BD8EA:
	cmpi.l	#$9600,d0
	ble.s	loc_0BD8F8
	moveq	#$0,d0
	bra.w	loc_0BD9E6
loc_0BD8F8:
	move.l	d5,d0
	asr.l	#$5,d0
	add.l	#$FFFFF448,d0
	tst.l	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_0BD90E
	move.l	d7,d1
	bra.s	loc_0BD912
loc_0BD90E:
	move.l	d7,d1
	neg.l	d1
loc_0BD912:
	moveq	#$10,d2
	swap	d1
	ext.l	d1
	asr.w	d2,d1
	move.l	d1,d6
	add.l	d0,d6
	move.l	d6,d0
	move.l	#$C8,d1
	jsr	$3FA2(a5)	; -> Math_LDivS
	tst.l	d0
	sge.b	d3
	neg.b	d3
	beq.s	loc_0BD940
	move.l	d6,d0
	move.l	#$C8,d1
	jsr	$3FA2(a5)	; -> Math_LDivS
	bra.s	loc_0BD94E
loc_0BD940:
	move.l	d6,d0
	move.l	#$C8,d1
	jsr	$3FA2(a5)	; -> Math_LDivS
	neg.l	d0
loc_0BD94E:
	move.l	d0,d5
	lsl.l	#$1,d5
	tst.l	d7
	bge.s	loc_0BD95E
	ori.b	#$10,$2E(a4)
	bra.s	loc_0BD964
loc_0BD95E:
	andi.b	#$EF,$2E(a4)
loc_0BD964:
	move.l	d7,d0
	move.l	d5,d1
	jsr	$3FA2(a5)	; -> Math_LDivS
	move.w	d0,$16(a4)
	move.w	#$C8,$20(a4)
	move.w	d6,$18(a4)
	tst.w	$16(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_0BD98C
	move.w	$16(a4),d0
	ext.l	d0
	bra.s	loc_0BD994
loc_0BD98C:
	move.w	$16(a4),d0
	ext.l	d0
	neg.l	d0
loc_0BD994:
	move.w	$22(a4),d1
	ext.l	d1
	cmp.l	d0,d1
	bge.s	loc_0BD9BC
	tst.w	$16(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_0BD9B0
	move.w	$16(a4),d0
	ext.l	d0
	bra.s	loc_0BD9B8
loc_0BD9B0:
	move.w	$16(a4),d0
	ext.l	d0
	neg.l	d0
loc_0BD9B8:
	move.w	d0,$22(a4)
loc_0BD9BC:
	move.w	#$1770,$24(a4)
	ori.w	#$1000,$4(a4)
	andi.w	#$BFFF,$6(a4)
	moveq	#$0,d0
	move.l	d0,$44(a4)
	moveq	#$12,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	moveq	#$1,d0
	addq.w	#$8,a7
loc_0BD9E6:
	movem.l	-$14(a6),d3/d5-d7/a4
	unlk	a6
	rts
