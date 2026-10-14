; ---------------------------------------------------------------------------
; loc_1FC466
; ---------------------------------------------------------------------------
loc_1FC466:
	add.l	d4,d3
	movea.l	-$4(a6),a3
	mulu.w	-$A(a6),d1
	adda.l	d1,a3
	adda.w	d0,a3
	move.l	a3,-$8(a6)
	movea.l	$8(a6),a2
	adda.w	$6(a4),a2
loc_1FC480:
	move.w	-$12(a6),d5
loc_1FC484:
	moveq	#$7,d4
loc_1FC486:
	move.l	(a2)+,d2
	bne.s	loc_1FC49E
	moveq	#$0,d0
	move.w	-$A(a6),d0
	tst.b	-$14(a6)
	beq.s	loc_1FC498
	neg.l	d0
loc_1FC498:
	adda.l	d0,a3
	bra.w	loc_1FC5CC
loc_1FC49E:
	tst.b	-$13(a6)
	bne.w	loc_1FC53A
	rol.l	#$8,d2
	moveq	#$0,d0
	move.b	d2,d0
	beq.s	loc_1FC4C8
	add.w	d0,d0
	move.w	(a1,d0.w),d0
	move.w	d0,d1
	lsr.w	#$8,d1
	beq.s	loc_1FC4BC
	move.b	d1,(a3)
loc_1FC4BC:
	addq.w	#$1,a3
	tst.b	d0
	beq.s	loc_1FC4C4
	move.b	d0,(a3)
loc_1FC4C4:
	addq.w	#$1,a3
	bra.s	loc_1FC4CA
loc_1FC4C8:
	addq.w	#$2,a3
loc_1FC4CA:
	rol.l	#$8,d2
	moveq	#$0,d0
	move.b	d2,d0
	beq.s	loc_1FC4EC
	add.w	d0,d0
	move.w	(a1,d0.w),d0
	move.w	d0,d1
	lsr.w	#$8,d1
	beq.s	loc_1FC4E0
	move.b	d1,(a3)
loc_1FC4E0:
	addq.w	#$1,a3
	tst.b	d0
	beq.s	loc_1FC4E8
	move.b	d0,(a3)
loc_1FC4E8:
	addq.w	#$1,a3
	bra.s	loc_1FC4EE
loc_1FC4EC:
	addq.w	#$2,a3
loc_1FC4EE:
	rol.l	#$8,d2
	moveq	#$0,d0
	move.b	d2,d0
	beq.s	loc_1FC510
	add.w	d0,d0
	move.w	(a1,d0.w),d0
	move.w	d0,d1
	lsr.w	#$8,d1
	beq.s	loc_1FC504
	move.b	d1,(a3)
loc_1FC504:
	addq.w	#$1,a3
	tst.b	d0
	beq.s	loc_1FC50C
	move.b	d0,(a3)
loc_1FC50C:
	addq.w	#$1,a3
	bra.s	loc_1FC512
loc_1FC510:
	addq.w	#$2,a3
loc_1FC512:
	rol.l	#$8,d2
	moveq	#$0,d0
	move.b	d2,d0
	beq.s	loc_1FC534
	add.w	d0,d0
	move.w	(a1,d0.w),d0
	move.w	d0,d1
	lsr.w	#$8,d1
	beq.s	loc_1FC528
	move.b	d1,(a3)
loc_1FC528:
	addq.w	#$1,a3
	tst.b	d0
	beq.s	loc_1FC530
	move.b	d0,(a3)
loc_1FC530:
	addq.w	#$1,a3
	bra.s	loc_1FC536
loc_1FC534:
	addq.w	#$2,a3
loc_1FC536:
	bra.w	loc_1FC5CA
loc_1FC53A:
	rol.l	#$8,d2
	moveq	#$0,d0
	move.b	d2,d0
	beq.s	loc_1FC55C
	add.w	d0,d0
	move.w	(a1,d0.w),d0
	move.w	d0,d1
	subq.w	#$1,a3
	lsr.w	#$8,d1
	beq.s	loc_1FC552
	move.b	d1,(a3)
loc_1FC552:
	subq.w	#$1,a3
	tst.b	d0
	beq.s	loc_1FC55E
	move.b	d0,(a3)
	bra.s	loc_1FC55E
loc_1FC55C:
	subq.w	#$2,a3
loc_1FC55E:
	rol.l	#$8,d2
	moveq	#$0,d0
	move.b	d2,d0
	beq.s	loc_1FC580
	add.w	d0,d0
	move.w	(a1,d0.w),d0
	move.w	d0,d1
	subq.w	#$1,a3
	lsr.w	#$8,d1
	beq.s	loc_1FC576
	move.b	d1,(a3)
loc_1FC576:
	subq.w	#$1,a3
	tst.b	d0
	beq.s	loc_1FC582
	move.b	d0,(a3)
	bra.s	loc_1FC582
loc_1FC580:
	subq.w	#$2,a3
loc_1FC582:
	rol.l	#$8,d2
	moveq	#$0,d0
	move.b	d2,d0
	beq.s	loc_1FC5A4
	add.w	d0,d0
	move.w	(a1,d0.w),d0
	move.w	d0,d1
	subq.w	#$1,a3
	lsr.w	#$8,d1
	beq.s	loc_1FC59A
	move.b	d1,(a3)
loc_1FC59A:
	subq.w	#$1,a3
	tst.b	d0
	beq.s	loc_1FC5A6
	move.b	d0,(a3)
	bra.s	loc_1FC5A6
loc_1FC5A4:
	subq.w	#$2,a3
loc_1FC5A6:
	rol.l	#$8,d2
	moveq	#$0,d0
	move.b	d2,d0
	beq.s	loc_1FC5C8
	add.w	d0,d0
	move.w	(a1,d0.w),d0
	move.w	d0,d1
	subq.w	#$1,a3
	lsr.w	#$8,d1
	beq.s	loc_1FC5BE
	move.b	d1,(a3)
loc_1FC5BE:
	subq.w	#$1,a3
	tst.b	d0
	beq.s	loc_1FC5CA
	move.b	d0,(a3)
	bra.s	loc_1FC5CA
loc_1FC5C8:
	subq.w	#$2,a3
loc_1FC5CA:
	adda.l	d3,a3
loc_1FC5CC:
	dbra	d4,loc_1FC486
	dbra	d5,loc_1FC484
	movea.l	-$8(a6),a3
	tst.b	-$13(a6)
	beq.s	loc_1FC5E2
	subq.w	#$8,a3
	bra.s	loc_1FC5E4
loc_1FC5E2:
	addq.w	#$8,a3
loc_1FC5E4:
	move.l	a3,-$8(a6)
	dbra	d6,loc_1FC480
	lea.l	$8(a4),a4
loc_1FC5F0:
	dbra	d7,loc_1FC400
	movem.l	-$38(a6),d2-d7/a2-a4
	unlk	a6
	rts
