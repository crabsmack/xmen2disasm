; ---------------------------------------------------------------------------
; loc_1F76D6
; ---------------------------------------------------------------------------
loc_1F76D6:
	tst.w	$4(a3)
	sge.b	d3
	neg.b	d3
	beq.s	loc_1F76E8
	move.w	$4(a3),d0
	ext.l	d0
	bra.s	loc_1F76F0
loc_1F76E8:
	move.w	$4(a3),d0
	ext.l	d0
	neg.l	d0
loc_1F76F0:
	moveq	#$60,d1
	cmp.l	d0,d1
	ble.w	loc_1F7790
	move.b	$1(a3),d0
	subq.b	#$1,d0
	beq.s	loc_1F7758
	subq.b	#$1,d0
	beq.s	loc_1F7774
	subq.b	#$1,d0
	beq.s	loc_1F773C
	subq.b	#$1,d0
	beq.s	loc_1F7720
	subi.b	#$B,d0
	beq.s	loc_1F773C
	subi.b	#$10,d0
	beq.s	loc_1F7774
	subq.b	#$1,d0
	beq.s	loc_1F7758
	bra.w	loc_1F78CA
loc_1F7720:
	tst.w	$18(a4)
	bge.w	loc_1F78CA
	movea.l	$10(a6),a0
	tst.b	$4(a0)
	ble.w	loc_1F78CA
	clr.w	$18(a4)
	bra.w	loc_1F78CA
loc_1F773C:
	tst.w	$18(a4)
	ble.w	loc_1F78CA
	movea.l	$10(a6),a0
	tst.b	$4(a0)
	bge.w	loc_1F78CA
	clr.w	$18(a4)
	bra.w	loc_1F78CA
loc_1F7758:
	tst.w	$16(a4)
	bge.w	loc_1F78CA
	movea.l	$10(a6),a0
	tst.b	$3(a0)
	ble.w	loc_1F78CA
	clr.w	$16(a4)
	bra.w	loc_1F78CA
loc_1F7774:
	tst.w	$16(a4)
	ble.w	loc_1F78CA
	movea.l	$10(a6),a0
	tst.b	$3(a0)
	bge.w	loc_1F78CA
	clr.w	$16(a4)
	bra.w	loc_1F78CA
loc_1F7790:
	tst.w	$16(a4)
	bne.s	loc_1F77BA
	tst.w	$4(a3)
	ble.s	loc_1F77A2
	move.w	$18(a4),$16(a4)
loc_1F77A2:
	tst.w	$4(a3)
	bge.w	loc_1F78CA
	move.w	$18(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$16(a4)
	bra.w	loc_1F78CA
loc_1F77BA:
	tst.w	$18(a4)
	bne.s	loc_1F77E4
	tst.w	$4(a3)
	ble.s	loc_1F77CC
	move.w	$16(a4),$18(a4)
loc_1F77CC:
	tst.w	$4(a3)
	bge.w	loc_1F78CA
	move.w	$16(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$18(a4)
	bra.w	loc_1F78CA
loc_1F77E4:
	move.b	$1(a3),d0
	subq.b	#$1,d0
	bmi.w	loc_1F78CA
	cmpi.b	#$1F,d0
	bgt.w	loc_1F78CA
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_1F76D6(pc,d1.w),d1
	jmp	Sw_1F76D6-2(pc,d1.w)
