; ---------------------------------------------------------------------------
; Deathbird_Move_Wobble	[runtime: executed in tas]
; ---------------------------------------------------------------------------
Deathbird_Move_Wobble:
	move.w	$16(a4),$1A(a4)
	move.w	$18(a4),$1C(a4)
	move.w	$16(a4),d0
	ext.l	d0
	add.l	d0,$8(a4)
	move.w	$18(a4),d0
	ext.l	d0
	add.l	d0,$C(a4)
	move.w	$1E(a4),d0
	add.w	d0,$16(a4)
	move.w	$20(a4),d0
	add.w	d0,$18(a4)
	move.w	$A(a4),d6
	sub.w	$94(a4),d6
	move.w	$E(a4),d7
	sub.w	$98(a4),d7
	move.w	$A6(a4),d0
	add.w	d0,$A2(a4)
	move.w	$A8(a4),d0
	add.w	d0,$A4(a4)
	moveq	#$64,d0
	cmp.w	$A2(a4),d0
	bge.s	loc_112226
	move.w	#$64,$A2(a4)
	bra.s	loc_112234
loc_112226:
	moveq	#-$64,d0
	cmp.w	$A2(a4),d0
	ble.s	loc_112234
	move.w	#$FF9C,$A2(a4)
loc_112234:
	moveq	#$64,d0
	cmp.w	$A4(a4),d0
	bge.s	loc_112244
	move.w	#$64,$A4(a4)
	bra.s	loc_112252
loc_112244:
	moveq	#-$64,d0
	cmp.w	$A4(a4),d0
	ble.s	loc_112252
	move.w	#$FF9C,$A4(a4)
loc_112252:
	cmpi.w	#$60,d6
	ble.s	loc_112260
	move.w	#$FFFC,$A6(a4)
	bra.s	loc_11226C
loc_112260:
	cmpi.w	#$FFA0,d6
	bge.s	loc_11226C
	move.w	#$4,$A6(a4)
loc_11226C:
	cmpi.w	#$60,d7
	ble.s	loc_11227A
	move.w	#$FFFD,$A8(a4)
	bra.s	loc_112286
loc_11227A:
	cmpi.w	#$FFA0,d7
	bge.s	loc_112286
	move.w	#$3,$A8(a4)
loc_112286:
	tst.w	$16(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_112298
	move.w	$16(a4),d0
	ext.l	d0
	bra.s	loc_1122A0
loc_112298:
	move.w	$16(a4),d0
	ext.l	d0
	neg.l	d0
loc_1122A0:
	moveq	#$10,d1
	cmp.l	d0,d1
	bgt.s	loc_1122C8
	move.w	$16(a4),d0
	ext.l	d0
	move.w	#$8000,d1
	and.w	d0,d1
	move.w	$1A(a4),d0
	ext.l	d0
	move.w	#$8000,d2
	and.w	d0,d2
	eor.w	d2,d1
	moveq	#$0,d0
	move.w	d1,d0
	tst.l	d0
	bls.s	loc_1122CE
loc_1122C8:
	move.l	$8(a4),$92(a4)
loc_1122CE:
	tst.w	$18(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_1122E0
	move.w	$18(a4),d0
	ext.l	d0
	bra.s	loc_1122E8
loc_1122E0:
	move.w	$18(a4),d0
	ext.l	d0
	neg.l	d0
loc_1122E8:
	moveq	#$10,d1
	cmp.l	d0,d1
	bgt.s	loc_112310
	move.w	$18(a4),d0
	ext.l	d0
	move.w	#$8000,d1
	and.w	d0,d1
	move.w	$1C(a4),d0
	ext.l	d0
	move.w	#$8000,d2
	and.w	d0,d2
	eor.w	d2,d1
	moveq	#$0,d0
	move.w	d1,d0
	tst.l	d0
	bls.s	loc_112316
loc_112310:
	move.l	$C(a4),$96(a4)
loc_112316:
	move.w	$A2(a4),d0
	ext.l	d0
	add.l	d0,$8(a4)
	move.w	$A4(a4),d0
	ext.l	d0
	add.l	d0,$C(a4)
	subq.w	#$1,d5
	bgt.w	Deathbird_Move_Wobble
