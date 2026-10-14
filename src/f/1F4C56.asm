; ---------------------------------------------------------------------------
; sub_1F4C56	[convert.py]
; ---------------------------------------------------------------------------
sub_1F4C56:
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$1C(a7),a3
	move.b	-$38DE(a5),d4
	andi.w	#$FE7F,$4(a3)
	move.w	$16(a3),d0
	move.w	$18(a3),d1
	move.w	d0,$1A(a3)
	move.w	d1,$1C(a3)
	bra.s	loc_1F4C86
loc_1F4C7A:
	subq.b	#$1,d4
	blt.s	loc_1F4C80
	bra.s	loc_1F4C86
loc_1F4C80:
	movem.l	(a7)+,d4-d7/a3-a4
	rts
loc_1F4C86:
	move.w	#$1000,d0
	and.w	$4(a3),d0
	bne.w	loc_1F4E34
	move.l	$72(a3),d5
	movea.l	$76(a3),a4
	clr.w	d7
	lea.l	-$346A(a5),a0
	moveq	#$0,d0
	move.b	$1(a4),d0
	add.w	d0,d0
	add.w	d0,d0
	move.l	(a0,d0.w),d7
	beq.s	loc_1F4CC6
	pea.l	($0).w
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	pea.l	($1).w
	movea.l	d7,a0
	jsr	(a0)
	lea.l	$10(a7),a7
	move.w	d0,d7
loc_1F4CC6:
	move.w	d7,d0
	bmi.s	loc_1F4CCE
	move.w	$1E(a3),d7
loc_1F4CCE:
	add.w	d7,$16(a3)
	move.w	$16(a3),d0
	blt.s	loc_1F4D04
	cmp.w	$22(a3),d0
	ble.s	loc_1F4CE8
	move.w	$22(a3),$16(a3)
	move.w	$16(a3),d0
loc_1F4CE8:
	tst.w	$4(a4)
	bne.s	loc_1F4CF4
	cmp.w	$26(a3),d0
	ble.s	loc_1F4D34
loc_1F4CF4:
	ext.l	d0
	tst.b	-$38BA(a5)
	beq.s	loc_1F4CFE
	asr.l	#$1,d0
loc_1F4CFE:
	add.l	d0,$72(a3)
	bra.s	loc_1F4D34
loc_1F4D04:
	neg.w	d0
	cmp.w	$22(a3),d0
	ble.s	loc_1F4D18
	move.w	$22(a3),d0
	neg.w	d0
	move.w	d0,$16(a3)
	neg.w	d0
loc_1F4D18:
	tst.w	$4(a4)
	bne.s	loc_1F4D24
	cmp.w	$26(a3),d0
	ble.s	loc_1F4D34
loc_1F4D24:
	neg.w	d0
	ext.l	d0
	tst.b	-$38BA(a5)
	beq.s	loc_1F4D30
	asr.l	#$1,d0
loc_1F4D30:
	add.l	d0,$72(a3)
loc_1F4D34:
	move.w	#$800,d0
	and.w	$4(a3),d0
	bne.s	loc_1F4D46
	cmp.l	$72(a3),d5
	beq.w	loc_1F4EF8
loc_1F4D46:
	movea.l	$76(a3),a4
	tst.b	-$38C4(a5)
	beq.s	loc_1F4DB6
	move.l	$72(a3),d0
	bge.s	loc_1F4D5C
	moveq	#$0,d0
	move.l	d0,$72(a3)
loc_1F4D5C:
	move.w	$6(a4),d1
	ext.l	d1
	lsl.l	#$8,d1
	cmp.l	d0,d1
	bge.s	loc_1F4DB6
	moveq	#$70,d0
	sub.l	d0,d1
	move.l	d1,$72(a3)
	ori.w	#$100,$4(a3)
	bra.s	loc_1F4DB6
loc_1F4D78:
	moveq	#$0,d0
	move.b	$10(a4),d0
	cmpi.b	#$FF,d0
	beq.s	loc_1F4DA6
	lsl.w	#$2,d0
	move.w	d0,d1
	lsl.w	#$2,d0
	add.w	d1,d0
	lea.l	-$33D2(a5),a0
	lea.l	(a0,d0.w),a4
	move.l	a4,$76(a3)
	move.w	$6(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	add.l	d0,$72(a3)
	bra.s	loc_1F4DB6
loc_1F4DA6:
	move.l	a3,-(a7)
	jsr	$4EE2(a5)	; -> sub_1F6EC4
	move.l	a3,-(a7)
	jsr	$4E7A(a5)	; -> sub_1F6530
	addq.l	#$8,a7
	bra.s	loc_1F4DBC
loc_1F4DB6:
	tst.l	$72(a3)
	blt.s	loc_1F4D78
loc_1F4DBC:
	move.w	#$1000,d0
	and.w	$4(a3),d0
	bne.w	loc_1F4EF8
	bra.s	loc_1F4E0C
loc_1F4DCA:
	move.b	$11(a4),d0
	cmpi.b	#$FF,d0
	beq.s	loc_1F4DFC
	move.w	$6(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	sub.l	d0,$72(a3)
	moveq	#$0,d0
	move.b	$11(a4),d0
	lsl.w	#$2,d0
	move.w	d0,d1
	lsl.w	#$2,d0
	add.w	d1,d0
	lea.l	-$33D2(a5),a0
	lea.l	(a0,d0.w),a4
	move.l	a4,$76(a3)
	bra.s	loc_1F4E0C
loc_1F4DFC:
	move.l	a3,-(a7)
	jsr	$4EE2(a5)	; -> sub_1F6EC4
	move.l	a3,-(a7)
	jsr	$4E7A(a5)	; -> sub_1F6530
	addq.l	#$8,a7
	bra.s	loc_1F4E1C
loc_1F4E0C:
	move.l	$72(a3),d0
	asr.l	#$8,d0
	move.w	$6(a4),d1
	ext.l	d1
	cmp.l	d0,d1
	blt.s	loc_1F4DCA
loc_1F4E1C:
	move.w	#$1000,d0
	and.w	$4(a3),d0
	bne.w	loc_1F4EF8
	move.l	a3,-(a7)
	jsr	$4EDA(a5)	; -> sub_1F6D76
	addq.l	#$4,a7
	bra.w	loc_1F4EF8
loc_1F4E34:
	move.l	$8(a3),d5
	move.l	$C(a3),d6
	move.w	$1E(a3),d0
	add.w	d0,$16(a3)
	move.w	$20(a3),d0
	add.w	d0,$18(a3)
	move.w	$16(a3),d0
	blt.s	loc_1F4E78
	cmp.w	$22(a3),d0
	ble.s	loc_1F4E62
	move.w	$22(a3),$16(a3)
	move.w	$16(a3),d0
loc_1F4E62:
	cmp.w	$26(a3),d0
	ble.s	loc_1F4EA2
	ext.l	d0
	tst.b	-$38BA(a5)
	beq.s	loc_1F4E72
	asr.l	#$1,d0
loc_1F4E72:
	add.l	d0,$8(a3)
	bra.s	loc_1F4EA2
loc_1F4E78:
	neg.w	d0
	cmp.w	$22(a3),d0
	ble.s	loc_1F4E8C
	move.w	$22(a3),d0
	neg.w	d0
	move.w	d0,$16(a3)
	neg.w	d0
loc_1F4E8C:
	cmp.w	$26(a3),d0
	ble.s	loc_1F4EA2
	neg.w	d0
	ext.l	d0
	tst.b	-$38BA(a5)
	beq.s	loc_1F4E9E
	asr.l	#$1,d0
loc_1F4E9E:
	add.l	d0,$8(a3)
loc_1F4EA2:
	move.w	$18(a3),d0
	blt.s	loc_1F4ECE
	cmp.w	$24(a3),d0
	ble.s	loc_1F4EB8
	move.w	$24(a3),$18(a3)
	move.w	$18(a3),d0
loc_1F4EB8:
	cmp.w	$28(a3),d0
	ble.s	loc_1F4EF8
	ext.l	d0
	tst.b	-$38BA(a5)
	beq.s	loc_1F4EC8
	asr.l	#$1,d0
loc_1F4EC8:
	add.l	d0,$C(a3)
	bra.s	loc_1F4EF8
loc_1F4ECE:
	neg.w	d0
	cmp.w	$24(a3),d0
	ble.s	loc_1F4EE2
	move.w	$24(a3),d0
	neg.w	d0
	move.w	d0,$18(a3)
	neg.w	d0
loc_1F4EE2:
	cmp.w	$28(a3),d0
	ble.s	loc_1F4EF8
	neg.w	d0
	ext.l	d0
	tst.b	-$38BA(a5)
	beq.s	loc_1F4EF4
	asr.l	#$1,d0
loc_1F4EF4:
	add.l	d0,$C(a3)
loc_1F4EF8:
	bra.w	loc_1F4C7A
