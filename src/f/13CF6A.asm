; ---------------------------------------------------------------------------
; Ninja_ClipToSegs - keep an airborne NINJA out of segments: push its box out of the overlapping segment and stop the blocked velocity (landing clears vy and gravity)
; In:  8(a6) = this  $E(a6) = word previous x px  $12(a6) = word previous y px
; Out: d0 = misc
; Evidence: Obj_UpdateBoxes, Ninja_FindSegInBox(box centre, ...); side hits zero +$16/+$1E, floor hit zeroes +$18/+$20 (Ninja_StateWaitLanding waits for +$20 = 0); caller Ninja_Move while the animation is Tbl_NinjaAnimAirborne
; ---------------------------------------------------------------------------
Ninja_ClipToSegs:
	link.w	a6,#$FFEA
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$4E(a4),d5
	move.w	$52(a4),-$6(a6)
	move.w	$4C(a4),-$4(a6)
	move.w	$50(a4),-$2(a6)
	move.l	a4,-(a7)
	jsr	$4DD2(a5)	; -> Obj_UpdateBoxes
	move.w	$50(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$52(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$4C(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$4E(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$18(a4),d0
	asr.w	#$8,d0
	ext.l	d0
	addq.l	#$1,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	-$4(a6),d1
	ext.l	d1
	move.w	-$2(a6),d2
	ext.l	d2
	move.w	-$4(a6),d3
	ext.l	d3
	sub.l	d3,d2
	asr.l	#$1,d2
	add.l	d1,d2
	move.l	d2,-(a7)
	ext.l	d5
	move.w	-$6(a6),d1
	ext.l	d1
	ext.l	d5
	sub.l	d5,d1
	asr.l	#$1,d1
	add.l	d5,d1
	move.l	d1,-(a7)
	jsr	Ninja_FindSegInBox(pc)
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$24(a7),a7
	beq.w	loc_13D1C4
	move.l	$8(a4),d4
	asr.l	#$8,d4
	move.l	$C(a4),d7
	asr.l	#$8,d7
	move.w	$52(a4),d0
	ext.l	d0
	move.w	$4E(a4),d1
	ext.l	d1
	sub.l	d1,d0
	move.w	d0,-$C(a6)
	cmp.w	$50(a4),d7
	slt.b	d3
	neg.b	d3
	beq.s	loc_13D02C
	move.w	$50(a4),d0
	bra.s	loc_13D02E
loc_13D02C:
	move.w	d7,d0
loc_13D02E:
	ext.l	d0
	move.w	$4C(a4),d1
	ext.l	d1
	sub.l	d1,d0
	move.w	d0,-$A(a6)
	move.w	$8(a3),d0
	cmp.w	$C(a3),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_13D050
	move.w	$8(a3),d0
	bra.s	loc_13D054
loc_13D050:
	move.w	$C(a3),d0
loc_13D054:
	move.w	d0,-$14(a6)
	move.w	$8(a3),d0
	cmp.w	$C(a3),d0
	sgt.b	d3
	neg.b	d3
	beq.s	loc_13D06C
	move.w	$8(a3),d0
	bra.s	loc_13D070
loc_13D06C:
	move.w	$C(a3),d0
loc_13D070:
	move.w	d0,-$12(a6)
	move.w	$A(a3),d0
	cmp.w	$E(a3),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_13D088
	move.w	$A(a3),d0
	bra.s	loc_13D08C
loc_13D088:
	move.w	$E(a3),d0
loc_13D08C:
	move.w	d0,-$10(a6)
	move.w	$A(a3),d0
	cmp.w	$E(a3),d0
	sgt.b	d3
	neg.b	d3
	beq.s	loc_13D0A4
	move.w	$A(a3),d0
	bra.s	loc_13D0A8
loc_13D0A4:
	move.w	$E(a3),d0
loc_13D0A8:
	move.w	d0,-$E(a6)
	move.w	$4E(a4),d6
	move.w	-$6(a6),d0
	cmp.w	-$14(a6),d0
	blt.s	loc_13D0C0
	cmp.w	-$12(a6),d5
	ble.s	loc_13D112
loc_13D0C0:
	cmp.w	$E(a6),d4
	ble.s	loc_13D0E8
	move.w	$52(a4),d0
	cmp.w	-$14(a6),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_13D0DA
	move.w	$52(a4),d0
	bra.s	loc_13D0DE
loc_13D0DA:
	move.w	-$14(a6),d0
loc_13D0DE:
	move.w	d0,d6
	subq.w	#$1,d6
	sub.w	-$C(a6),d6
	bra.s	loc_13D10A
loc_13D0E8:
	cmp.w	$E(a6),d4
	bge.s	loc_13D10A
	move.w	$4E(a4),d0
	cmp.w	-$12(a6),d0
	sgt.b	d3
	neg.b	d3
	beq.s	loc_13D102
	move.w	$4E(a4),d0
	bra.s	loc_13D106
loc_13D102:
	move.w	-$12(a6),d0
loc_13D106:
	move.w	d0,d6
	addq.w	#$1,d6
loc_13D10A:
	clr.w	$1E(a4)
	clr.w	$16(a4)
loc_13D112:
	move.w	d4,d0
	sub.w	$4E(a4),d0
	add.w	d0,d6
	move.w	d7,d0
	sub.w	$4C(a4),d0
	move.w	d0,-$8(a6)
	move.w	d7,d5
	move.w	-$2(a6),d0
	cmp.w	-$10(a6),d0
	blt.s	loc_13D13A
	move.w	-$4(a6),d0
	cmp.w	-$E(a6),d0
	ble.s	loc_13D186
loc_13D13A:
	cmp.w	$12(a6),d7
	ble.s	loc_13D15E
	move.w	-$10(a6),d0
	sub.w	-$A(a6),d0
	move.w	d0,-$16(a6)
	move.w	-$8(a6),d5
	add.w	-$16(a6),d5
	clr.w	$18(a4)
	clr.w	$20(a4)
	bra.s	loc_13D182
loc_13D15E:
	cmp.w	$12(a6),d7
	bge.s	loc_13D182
	move.w	$4C(a4),d0
	cmp.w	-$E(a6),d0
	sgt.b	d3
	neg.b	d3
	beq.s	loc_13D178
	move.w	$4C(a4),d0
	bra.s	loc_13D17C
loc_13D178:
	move.w	-$E(a6),d0
loc_13D17C:
	move.w	d0,d5
	add.w	-$8(a6),d5
loc_13D182:
	clr.w	$18(a4)
loc_13D186:
	cmp.w	d6,d4
	beq.s	loc_13D192
	clr.w	$1E(a4)
	clr.w	$16(a4)
loc_13D192:
	cmp.w	d5,d7
	ble.s	loc_13D1A0
	clr.w	$18(a4)
	clr.w	$20(a4)
	bra.s	loc_13D1A8
loc_13D1A0:
	cmp.w	d5,d7
	bge.s	loc_13D1A8
	clr.w	$18(a4)
loc_13D1A8:
	ext.l	d6
	move.l	d6,d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	ext.l	d5
	move.l	d5,d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	move.l	a4,-(a7)
	jsr	$4DD2(a5)	; -> Obj_UpdateBoxes
	addq.w	#$4,a7
loc_13D1C4:
	movem.l	-$32(a6),d3-d7/a3-a4
	unlk	a6
	rts
