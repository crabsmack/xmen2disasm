; ---------------------------------------------------------------------------
; sub_1F91E8	[jt 2539]
; ---------------------------------------------------------------------------
sub_1F91E8:
	link.w	a6,#$FFFC
	movem.l	d4-d7/a3-a4,-(a7)
	move.w	$16(a6),d4
	move.w	$E(a6),d5
	move.w	$A(a6),d7
	blt.s	loc_1F9204
	cmpi.w	#$1D,d7
	ble.s	loc_1F920C
loc_1F9204:
	move.b	-$135A(a5),d0
	bra.w	loc_1F9418
loc_1F920C:
	move.l	d7,d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	-$134C(a5),a0
	lea.l	(a0,d0.w),a3
	moveq	#$0,d0
	move.w	$12(a3),d0
	move.w	#$8000,d1
	and.w	d0,d1
	bne.s	loc_1F9236
	move.b	-$135A(a5),d0
	bra.w	loc_1F9418
loc_1F9236:
	moveq	#$0,d0
	move.w	$12(a3),d0
	moveq	#$8,d1
	and.w	d0,d1
	beq.s	loc_1F924E
	moveq	#$0,d0
	move.w	$10(a3),d0
	moveq	#$3,d6
	and.w	d0,d6
	bra.s	loc_1F925C
loc_1F924E:
	tst.w	d4
	beq.s	loc_1F9256
	moveq	#$0,d0
	bra.s	loc_1F9258
loc_1F9256:
	moveq	#$3,d0
loc_1F9258:
	ext.w	d0
	move.w	d0,d6
loc_1F925C:
	tst.w	d5
	beq.s	loc_1F9264
	moveq	#$0,d0
	bra.s	loc_1F926A
loc_1F9264:
	move.l	#$400,d0
loc_1F926A:
	ext.l	d0
	moveq	#$0,d1
	move.b	$13(a6),d1
	lsl.l	#$2,d1
	or.l	d0,d1
	moveq	#$0,d0
	move.w	d6,d0
	moveq	#$3,d2
	and.w	d0,d2
	moveq	#$0,d0
	move.w	d2,d0
	move.l	d0,d7
	or.l	d1,d7
	moveq	#$0,d0
	move.w	d7,d0
	moveq	#$0,d1
	move.w	$10(a3),d1
	move.l	d0,d6
	sub.l	d1,d6
	tst.l	d6
	beq.w	loc_1F9416
	tst.l	d6
	bge.w	loc_1F9350
	tst.l	$4(a3)
	beq.w	loc_1F93EE
	movea.l	$4(a3),a4
	bra.s	loc_1F92B6
loc_1F92AE:
	move.l	a4,-$4(a6)
	movea.l	$4(a4),a4
loc_1F92B6:
	move.l	a4,d0
	beq.s	loc_1F92C0
	cmp.w	$10(a4),d7
	bcs.s	loc_1F92AE
loc_1F92C0:
	move.l	a4,d0
	bne.s	loc_1F930E
	tst.l	(a3)
	beq.s	loc_1F92D0
	movea.l	(a3),a0
	move.l	$4(a3),$4(a0)
loc_1F92D0:
	tst.l	$4(a3)
	beq.s	loc_1F92DC
	movea.l	$4(a3),a0
	move.l	(a3),(a0)
loc_1F92DC:
	tst.l	(a3)
	bne.s	loc_1F92E6
	move.l	$4(a3),-$1354(a5)
loc_1F92E6:
	movea.l	-$4(a6),a0
	move.l	a0,(a3)
	move.l	$4(a0),$4(a3)
	movea.l	-$4(a6),a0
	move.l	a3,$4(a0)
	tst.l	$4(a3)
	beq.s	loc_1F9306
	movea.l	$4(a3),a0
	move.l	a3,(a0)
loc_1F9306:
	move.l	a3,-$1350(a5)
	bra.w	loc_1F93EE
loc_1F930E:
	cmpa.l	$4(a3),a4
	beq.w	loc_1F93EE
	tst.l	(a3)
	beq.s	loc_1F9322
	movea.l	(a3),a0
	move.l	$4(a3),$4(a0)
loc_1F9322:
	tst.l	$4(a3)
	beq.s	loc_1F932E
	movea.l	$4(a3),a0
	move.l	(a3),(a0)
loc_1F932E:
	tst.l	(a3)
	bne.s	loc_1F9338
	move.l	$4(a3),-$1354(a5)
loc_1F9338:
	move.l	a4,$4(a3)
	move.l	(a4),(a3)
	move.l	a3,(a4)
	tst.l	(a3)
	beq.w	loc_1F93EE
	movea.l	(a3),a0
	move.l	a3,$4(a0)
	bra.w	loc_1F93EE
loc_1F9350:
	tst.l	(a3)
	beq.w	loc_1F93EE
	movea.l	(a3),a4
	bra.s	loc_1F9360
loc_1F935A:
	move.l	a4,-$4(a6)
	movea.l	(a4),a4
loc_1F9360:
	move.l	a4,d0
	beq.s	loc_1F936A
	cmp.w	$10(a4),d7
	bhi.s	loc_1F935A
loc_1F936A:
	move.l	a4,d0
	bne.s	loc_1F93B0
	tst.l	(a3)
	beq.s	loc_1F937A
	movea.l	(a3),a0
	move.l	$4(a3),$4(a0)
loc_1F937A:
	tst.l	$4(a3)
	beq.s	loc_1F9386
	movea.l	$4(a3),a0
	move.l	(a3),(a0)
loc_1F9386:
	tst.l	$4(a3)
	bne.s	loc_1F9390
	move.l	(a3),-$1350(a5)
loc_1F9390:
	movea.l	-$4(a6),a0
	move.l	a0,$4(a3)
	move.l	(a0),(a3)
	movea.l	-$4(a6),a0
	move.l	a3,(a0)
	tst.l	(a3)
	beq.s	loc_1F93AA
	movea.l	(a3),a0
	move.l	a3,$4(a0)
loc_1F93AA:
	move.l	a3,-$1354(a5)
	bra.s	loc_1F93EE
loc_1F93B0:
	cmpa.l	(a3),a4
	beq.s	loc_1F93EE
	tst.l	(a3)
	beq.s	loc_1F93C0
	movea.l	(a3),a0
	move.l	$4(a3),$4(a0)
loc_1F93C0:
	tst.l	$4(a3)
	beq.s	loc_1F93CC
	movea.l	$4(a3),a0
	move.l	(a3),(a0)
loc_1F93CC:
	tst.l	$4(a3)
	bne.s	loc_1F93D6
	move.l	(a3),-$1350(a5)
loc_1F93D6:
	move.l	a4,(a3)
	move.l	$4(a4),$4(a3)
	move.l	a3,$4(a4)
	tst.l	$4(a3)
	beq.s	loc_1F93EE
	movea.l	$4(a3),a0
	move.l	a3,(a0)
loc_1F93EE:
	move.w	d7,$10(a3)
	tst.w	d5
	beq.s	loc_1F93FE
	ori.w	#$400,$12(a3)
	bra.s	loc_1F9404
loc_1F93FE:
	andi.w	#$FBFF,$12(a3)
loc_1F9404:
	tst.w	d4
	beq.s	loc_1F9410
	ori.w	#$10,$12(a3)
	bra.s	loc_1F9416
loc_1F9410:
	andi.w	#$FFEF,$12(a3)
loc_1F9416:
	moveq	#$0,d0
loc_1F9418:
	movem.l	-$1C(a6),d4-d7/a3-a4
	unlk	a6
	rts
