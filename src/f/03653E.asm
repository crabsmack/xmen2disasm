; ---------------------------------------------------------------------------
; loc_03653E	[runtime: executed in tas]
; ---------------------------------------------------------------------------
loc_03653E:
	move.l	d7,d0
	neg.l	d0
	move.l	d0,d7
	movea.l	$8C(a4),a3
	move.l	a3,d0
	beq.w	loc_0366E6
	move.w	$A6(a4),d0
	ext.l	d0
	move.l	d0,d4
	lsl.l	#$8,d4
	move.w	$A8(a4),d0
	ext.l	d0
	move.l	d0,d6
	lsl.l	#$8,d6
	move.w	$52(a3),d0
	ext.l	d0
	move.w	$4E(a3),d1
	ext.l	d1
	add.l	d0,d1
	lsl.l	#$7,d1
	move.l	d1,d5
	add.l	d7,d5
	move.w	$4C(a3),d0
	ext.l	d0
	move.w	$50(a3),d1
	ext.l	d1
	add.l	d0,d1
	lsl.l	#$7,d1
	move.w	$A0(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,d7
	add.l	d1,d7
	moveq	#$0,d0
	move.b	$9B(a4),d0
	moveq	#$2,d1
	and.b	d0,d1
	beq.s	loc_0365B6
	cmp.l	d5,d4
	ble.s	loc_0365AA
	move.l	d4,d5
	ori.b	#$4,$9B(a4)
loc_0365AA:
	cmp.l	d5,d6
	bge.s	loc_0365B6
	move.l	d6,d5
	ori.b	#$8,$9B(a4)
loc_0365B6:
	move.w	$52(a4),d0
	ext.l	d0
	move.w	$4E(a4),d1
	ext.l	d1
	add.l	d0,d1
	lsl.l	#$7,d1
	move.l	d5,d6
	sub.l	d1,d6
	move.w	$4C(a4),d0
	ext.l	d0
	move.w	$50(a4),d1
	ext.l	d1
	add.l	d0,d1
	lsl.l	#$7,d1
	move.l	d7,d5
	sub.l	d1,d5
	move.l	d6,d0
	moveq	#$1E,d1
	jsr	$3FA2(a5)	; -> sub_15C222
	move.w	d0,$16(a4)
	move.l	d5,d0
	moveq	#$37,d1
	jsr	$3FA2(a5)	; -> sub_15C222
	move.w	d0,$18(a4)
	bra.w	loc_0366E6
loc_0365FA:
	move.w	$A2(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,d6
	sub.l	$8(a4),d6
	move.w	$A4(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,d5
	sub.l	$C(a4),d5
	tst.l	d6
	sge.b	d3
	neg.b	d3
	beq.s	loc_036622
	move.l	d6,d0
	bra.s	loc_036626
loc_036622:
	move.l	d6,d0
	neg.l	d0
loc_036626:
	tst.l	d5
	sge.b	d3
	neg.b	d3
	beq.s	loc_036632
	move.l	d5,d1
	bra.s	loc_036636
loc_036632:
	move.l	d5,d1
	neg.l	d1
loc_036636:
	add.l	d0,d1
	asr.l	#$8,d1
	moveq	#$C,d0
	cmp.l	d1,d0
	blt.s	loc_036654
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	clr.b	$B2(a4)
	bra.w	loc_0366E6
loc_036654:
	move.l	d6,d0
	moveq	#$A,d1
	jsr	$3FA2(a5)	; -> sub_15C222
	move.l	d0,d4
	move.l	d5,d0
	moveq	#$19,d1
	jsr	$3FA2(a5)	; -> sub_15C222
	move.l	d0,d6
	tst.l	d4
	sge.b	d3
	neg.b	d3
	beq.s	loc_036674
	move.l	d4,d0
	bra.s	loc_036678
loc_036674:
	move.l	d4,d0
	neg.l	d0
loc_036678:
	cmpi.l	#$400,d0
	ble.s	loc_0366A8
	move.l	#$400,d7
	move.l	d6,d1
	move.l	d1,d0
	mulu.w	#$400,d1
	swap	d0
	mulu.w	#$400,d0
	swap	d0
	clr.w	d0
	add.l	d0,d1
	move.l	d1,d0
	move.l	d4,d1
	jsr	$3FA2(a5)	; -> sub_15C222
	move.l	d0,d5
	move.l	d7,d4
	move.l	d5,d6
loc_0366A8:
	move.w	d4,$16(a4)
	move.w	d6,$18(a4)
	bra.s	loc_0366E6
loc_0366B2:
	move.w	$A2(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,d6
	sub.l	$8(a4),d6
	move.w	$A4(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,d4
	sub.l	$C(a4),d4
	move.l	d6,d0
	moveq	#$5,d1
	jsr	$3FA2(a5)	; -> sub_15C222
	move.w	d0,$16(a4)
	move.l	d4,d0
	moveq	#$5,d1
	jsr	$3FA2(a5)	; -> sub_15C222
	move.w	d0,$18(a4)
