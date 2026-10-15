; ---------------------------------------------------------------------------
; Map_StreamColumns - horizontal scrolling: draw the tile columns uncovered since the last frame for plane A and plane B
; In:  none
; Out: none
; Evidence: drawn x $FFC736 toward camera x $FFC73E (Map_DrawColumnA), plane B $FFC732 toward $FFC73A (unless $FFC74C); wide-plane flags $FFEE10/$FFEE12 change the margin
; ---------------------------------------------------------------------------
Map_StreamColumns:
	movem.l	d1-d7/a1-a4,-(a7)
	movea.l	-$3A84(a5),a4
	movea.l	-$3AA6(a5),a2
	move.w	-$3ACA(a5),d7
	add.w	-$3AD2(a5),d7
	asr.w	#$3,d7
	andi.w	#$3F,d7
	move.w	-$3ACA(a5),d4
	lsr.w	#$3,d4
	move.w	-$3ACC(a5),d6
	add.w	-$3AD4(a5),d6
	asr.w	#$3,d6
	andi.w	#$1F,d6
	move.w	-$3ACC(a5),d5
	lsr.w	#$3,d5
	move.w	-$3ACA(a5),d0
	move.w	d0,d1
	sub.w	-$3AC2(a5),d0
	bmi.s	loc_15F262
	addq.w	#$7,d0
	asr.w	#$3,d1
	asr.w	#$3,d0
	cmp.w	d1,d0
	ble.s	loc_15F25C
	move.w	d1,d0
	bra.s	loc_15F25C
loc_15F246:
	subq.w	#$8,-$3ACA(a5)
	subq.w	#$1,d4
	subq.w	#$1,d7
	andi.w	#$3F,d7
	tst.b	-$3AB2(a5)
	bne.s	loc_15F25C
	bsr.w	Map_DrawColumnA
loc_15F25C:
	dbra	d0,loc_15F246
	bra.s	loc_15F2BA
loc_15F262:
	moveq	#$18,d2
	addi.w	#$2C,d4
	addi.w	#$2C,d7
	tst.b	-$13F0(a5)
	bne.s	loc_15F27E
	move.w	#$B8,d2
	addi.w	#$14,d4
	addi.w	#$14,d7
loc_15F27E:
	add.w	d2,d0
	bpl.s	loc_15F2BA
	neg.w	d0
	asr.w	#$3,d0
	sub.w	-$3A5E(a5),d1
	neg.w	d1
	tst.b	-$13F0(a5)
	beq.s	loc_15F296
	addi.w	#$C0,d1
loc_15F296:
	asr.w	#$3,d1
	cmp.w	d1,d0
	ble.s	loc_15F2B2
	move.w	d1,d0
	bra.s	loc_15F2B2
loc_15F2A0:
	tst.b	-$3AB2(a5)
	bne.s	loc_15F2AA
	bsr.w	Map_DrawColumnA
loc_15F2AA:
	addq.w	#$8,-$3ACA(a5)
	addq.w	#$1,d4
	addq.w	#$1,d7
loc_15F2B2:
	andi.w	#$3F,d7
	dbra	d0,loc_15F2A0
loc_15F2BA:
	tst.b	-$3A64(a5)
	beq.w	loc_15F376
	tst.b	-$3AB4(a5)
	bne.w	loc_15F376
	movea.l	-$3A88(a5),a4
	movea.l	-$3A8C(a5),a2
	move.w	-$3ACE(a5),d7
	add.w	-$3AD6(a5),d7
	asr.w	#$3,d7
	andi.w	#$3F,d7
	move.w	-$3ACE(a5),d4
	lsr.w	#$3,d4
	move.w	-$3AD0(a5),d6
	add.w	-$3AD8(a5),d6
	asr.w	#$3,d6
	andi.w	#$1F,d6
	move.w	-$3AD0(a5),d5
	lsr.w	#$3,d5
	move.w	-$3ACE(a5),d0
	move.w	d0,d1
	sub.w	-$3AC6(a5),d0
	bmi.s	loc_15F330
	addq.w	#$7,d0
	asr.w	#$3,d1
	asr.w	#$3,d0
	cmp.w	d1,d0
	ble.s	loc_15F32A
	move.w	d1,d0
	bra.s	loc_15F32A
loc_15F314:
	subq.w	#$8,-$3ACE(a5)
	subq.w	#$1,d4
	subq.w	#$1,d7
	andi.w	#$3F,d7
	tst.b	-$3AB2(a5)
	bne.s	loc_15F32A
	bsr.w	Map_DrawColumnB
loc_15F32A:
	dbra	d0,loc_15F314
	bra.s	loc_15F376
loc_15F330:
	moveq	#$18,d2
	addi.w	#$2C,d4
	addi.w	#$2C,d7
	tst.b	-$3AB4(a5)
	bne.s	loc_15F346
	tst.b	-$13EE(a5)
	bne.s	loc_15F352
loc_15F346:
	move.w	#$B8,d2
	addi.w	#$14,d4
	addi.w	#$14,d7
loc_15F352:
	add.w	d2,d0
	bpl.s	loc_15F376
	neg.w	d0
	asr.w	#$3,d0
	bra.s	loc_15F36E
loc_15F35C:
	tst.b	-$3AB2(a5)
	bne.s	loc_15F366
	bsr.w	Map_DrawColumnB
loc_15F366:
	addq.w	#$8,-$3ACE(a5)
	addq.w	#$1,d4
	addq.w	#$1,d7
loc_15F36E:
	andi.w	#$3F,d7
	dbra	d0,loc_15F35C
loc_15F376:
	movem.l	(a7)+,d1-d7/a1-a4
	rts
