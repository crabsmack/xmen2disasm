; ---------------------------------------------------------------------------
; sub_120124	[jt 1656]
; ---------------------------------------------------------------------------
sub_120124:
	link.w	a6,#$FFE8
	movem.l	d3-d7/a3-a4,-(a7)
	move.b	#$1,-$9(a6)
	clr.w	-$2(a6)
	movea.l	$8(a6),a0
	movea.l	$92(a0),a0
	move.w	(a0),-$10(a6)
	movea.l	$8(a6),a0
	andi.w	#$FFFE,$98(a0)
	move.b	#$1,-$3(a6)
	movea.l	$8(a6),a0
	move.l	$8(a0),d0
	asr.l	#$8,d0
	move.w	d0,-$8(a6)
	move.l	$C(a0),d0
	asr.l	#$8,d0
	move.w	d0,-$6(a6)
loc_12016A:
	movea.l	$8(a6),a0
	movea.l	$92(a0),a4
	addq.w	#$2,a4
	movea.l	$9A(a0),a3
	clr.w	d7
	bra.w	loc_1202BC
loc_12017E:
	tst.w	(a4)
	bge.s	loc_12018A
	tst.w	$2(a4)
	blt.w	loc_1202CC
loc_12018A:
	cmpi.w	#$3E8,(a3)
	blt.s	loc_120198
	movea.l	$8(a6),a0
	movea.l	$9A(a0),a3
loc_120198:
	tst.w	$2(a3)
	sge.b	d3
	neg.b	d3
	beq.s	loc_1201AA
	move.w	$2(a3),d0
	ext.l	d0
	bra.s	loc_1201B2
loc_1201AA:
	move.w	$2(a3),d0
	ext.l	d0
	neg.l	d0
loc_1201B2:
	move.w	d0,d4
	cmp.w	-$2(a6),d4
	sgt.b	d3
	neg.b	d3
	beq.s	loc_1201C2
	move.w	d4,d0
	bra.s	loc_1201C6
loc_1201C2:
	move.w	-$2(a6),d0
loc_1201C6:
	move.w	d0,-$2(a6)
	move.w	-$8(a6),d0
	ext.l	d0
	ext.l	d4
	move.l	d0,-$14(a6)
	movea.l	$8(a6),a0
	move.w	$A8(a0),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$5172(a5)	; -> sub_1FDEEA
	move.l	d0,d1
	move.l	d4,d0
	jsr	$3F9A(a5)	; -> sub_15C1FC
	swap	d0
	ext.l	d0
	move.l	-$14(a6),d1
	add.l	d1,d0
	move.w	(a3),d1
	add.w	d0,d1
	move.w	d1,-$E(a6)
	move.w	$2(a3),d0
	ext.l	d0
	move.l	d0,-$18(a6)
	movea.l	$8(a6),a0
	move.w	$A8(a0),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$517A(a5)	; -> sub_1FDEF8
	move.l	-$18(a6),d1
	exg.l	d0,d1
	jsr	$3F9A(a5)	; -> sub_15C1FC
	swap	d0
	ext.l	d0
	add.w	-$6(a6),d0
	move.w	d0,-$C(a6)
	movea.l	$8(a6),a0
	move.w	#$100,d0
	and.w	$98(a0),d0
	addq.w	#$8,a7
	beq.s	loc_1202AA
	move.w	-$E(a6),d5
	sub.w	(a4),d5
	move.w	-$C(a6),d6
	sub.w	$2(a4),d6
	tst.w	d5
	bne.s	loc_120256
	tst.w	d6
	beq.s	loc_1202B4
loc_120256:
	cmpi.w	#$FFFB,d5
	slt.b	d3
	neg.b	d3
	beq.s	loc_120264
	moveq	#-$5,d0
	bra.s	loc_120266
loc_120264:
	move.w	d5,d0
loc_120266:
	move.w	d0,d5
	cmpi.w	#$5,d5
	slt.b	d3
	neg.b	d3
	beq.s	loc_120276
	move.w	d5,d0
	bra.s	loc_120278
loc_120276:
	moveq	#$5,d0
loc_120278:
	move.w	d0,d5
	cmpi.w	#$FFFB,d6
	slt.b	d3
	neg.b	d3
	beq.s	loc_120288
	moveq	#-$5,d0
	bra.s	loc_12028A
loc_120288:
	move.w	d6,d0
loc_12028A:
	move.w	d0,d6
	cmpi.w	#$5,d6
	slt.b	d3
	neg.b	d3
	beq.s	loc_12029A
	move.w	d6,d0
	bra.s	loc_12029C
loc_12029A:
	moveq	#$5,d0
loc_12029C:
	move.w	d0,d6
	add.w	d5,(a4)
	add.w	d6,$2(a4)
	clr.b	-$3(a6)
	bra.s	loc_1202B4
loc_1202AA:
	move.w	-$E(a6),(a4)
	move.w	-$C(a6),$2(a4)
loc_1202B4:
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$6,a4
	addq.w	#$8,a3
loc_1202BC:
	moveq	#$0,d0
	move.w	d7,d0
	move.w	-$10(a6),d1
	ext.l	d1
	cmp.l	d0,d1
	bgt.w	loc_12017E
loc_1202CC:
	tst.b	-$3(a6)
	beq.s	loc_1202DC
	movea.l	$8(a6),a0
	andi.w	#$FEFF,$98(a0)
loc_1202DC:
	movea.l	$8(a6),a0
	move.w	#$100,d0
	and.w	$98(a0),d0
	bne.w	loc_120386
	movea.l	a0,a1
	move.w	$AA(a1),d0
	add.w	d0,$A8(a0)
	movea.l	$8(a6),a0
	tst.w	$A8(a0)
	blt.s	loc_120308
	cmpi.w	#$B4,$A8(a0)
	ble.s	loc_120386
loc_120308:
	movea.l	$8(a6),a0
	tst.w	$A8(a0)
	bge.s	loc_120318
	clr.w	$A8(a0)
	bra.s	loc_120322
loc_120318:
	movea.l	$8(a6),a0
	move.w	#$B4,$A8(a0)
loc_120322:
	movea.l	$8(a6),a0
	moveq	#$0,d0
	move.l	d0,$A2(a0)
	movea.l	$8(a6),a0
	move.l	$8(a0),d1
	asr.l	#$8,d1
	tst.w	$A8(a0)
	seq.b	d3
	neg.b	d3
	beq.s	loc_120348
	move.w	-$2(a6),d2
	ext.l	d2
	bra.s	loc_120352
loc_120348:
	move.w	-$2(a6),d0
	ext.l	d0
	neg.l	d0
	move.l	d0,d2
loc_120352:
	move.w	d2,d4
	add.w	d1,d4
	movea.l	$8(a6),a0
	cmpi.w	#$B4,$A8(a0)
	seq.b	d3
	neg.b	d3
	beq.s	loc_12036A
	moveq	#$1,d0
	bra.s	loc_12036C
loc_12036A:
	moveq	#$0,d0
loc_12036C:
	move.l	d0,-(a7)
	movea.l	$8(a6),a0
	move.l	$C(a0),d0
	asr.l	#$8,d0
	move.l	d0,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	jsr	sub_1200AE(pc)
	lea.l	$C(a7),a7
loc_120386:
	move.w	$E(a6),d0
	subq.w	#$1,$E(a6)
	tst.w	$E(a6)
	bgt.w	loc_12016A
	move.b	-$9(a6),d0
	movem.l	-$34(a6),d3-d7/a3-a4
	unlk	a6
	rts
