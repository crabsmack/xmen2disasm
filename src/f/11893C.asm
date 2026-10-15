; ---------------------------------------------------------------------------
; RThetaObject_Move - polar movement: speed +$8C += acceleration +$8E (clamped to +-max +$90), turn rate +$96 += +$9A, heading +$92 += turn rate (degrees 8.8, wrapped to 0-360), velocity = speed x (cos, -sin) of the heading, position += velocity; each step doubled at half rate (RTHETAOBJECT override of slot 18 Move; does not call the parent)
; In:  8(a6) = this  $C(a6) = word frame step (1, or 2 when the game runs at half rate)
; Out: none
; Evidence: Math_CosDeg/Math_SinDeg; speed integer part selects a 1x-16x multiplier switch, bits $80/$40 add halves/quarters; previous velocity kept in +$1A/+$1C; method 18 of class descriptor $118C8E (name string "RTHETAOBJECT", parent ACTOR)
; ---------------------------------------------------------------------------
RThetaObject_Move:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	move.w	$E(a6),d6
	movea.l	$8(a6),a4
	move.w	$16(a4),$1A(a4)
	move.w	$18(a4),$1C(a4)
	move.w	$8E(a4),d0
	add.w	d0,$8C(a4)
	cmpi.w	#$1,d6
	ble.s	loc_11896E
	move.w	$8E(a4),d0
	add.w	d0,$8C(a4)
loc_11896E:
	move.w	$8C(a4),d0
	cmp.w	$90(a4),d0
	ble.s	loc_118980
	move.w	$90(a4),$8C(a4)
	bra.s	loc_11899E
loc_118980:
	move.w	$90(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	$8C(a4),d1
	ext.l	d1
	cmp.l	d1,d0
	ble.s	loc_11899E
	move.w	$90(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$8C(a4)
loc_11899E:
	move.l	$9A(a4),d0
	add.l	d0,$96(a4)
	cmpi.w	#$1,d6
	ble.s	loc_1189BE
	move.l	$9A(a4),d0
	add.l	d0,$96(a4)
	bra.s	loc_1189BE
loc_1189B6:
	subi.l	#$16800,$96(a4)
loc_1189BE:
	cmpi.l	#$16800,$96(a4)
	bge.s	loc_1189B6
	bra.s	loc_1189D2
loc_1189CA:
	addi.l	#$16800,$96(a4)
loc_1189D2:
	tst.l	$96(a4)
	blt.s	loc_1189CA
	move.l	$96(a4),d0
	add.l	d0,$92(a4)
	cmpi.w	#$1,d6
	ble.s	loc_1189F8
	move.l	$96(a4),d0
	add.l	d0,$92(a4)
	bra.s	loc_1189F8
loc_1189F0:
	subi.l	#$16800,$92(a4)
loc_1189F8:
	cmpi.l	#$16800,$92(a4)
	bge.s	loc_1189F0
	bra.s	loc_118A0C
loc_118A04:
	addi.l	#$16800,$92(a4)
loc_118A0C:
	tst.l	$92(a4)
	blt.s	loc_118A04
	move.l	$92(a4),d0
	asr.l	#$8,d0
	move.l	d0,-(a7)
	jsr	$5172(a5)	; -> Math_CosDeg
	move.l	d0,d6
	asr.l	#$8,d6
	move.l	$92(a4),d0
	asr.l	#$8,d0
	move.l	d0,-(a7)
	jsr	$517A(a5)	; -> Math_SinDeg
	asr.l	#$8,d0
	neg.l	d0
	move.l	d0,d7
	move.w	$8C(a4),d0
	asr.w	#$8,d0
	addq.w	#$8,a7
	bmi.w	RThetaObject_Move_Case16
	cmpi.w	#$10,d0
	bgt.w	RThetaObject_Move_Case16
	add.w	d0,d0
	move.w	Sw_11893C(pc,d0.w),d0
	jmp	Sw_11893C-2(pc,d0.w)
