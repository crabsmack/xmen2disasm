; ---------------------------------------------------------------------------
; sub_0C1412	[jt 1120]
; ---------------------------------------------------------------------------
sub_0C1412:
	link.w	a6,#$0
	movem.l	d6-d7,-(a7)
	pea.l	-$1758(a5)
	jsr	sub_0C1372(pc)
	move.w	d0,d6
	pea.l	-$1848(a5)
	jsr	sub_0C1372(pc)
	move.w	d0,d7
	tst.w	d6
	beq.s	loc_0C1436
	moveq	#$1,d0
	bra.s	loc_0C1438
loc_0C1436:
	moveq	#$0,d0
loc_0C1438:
	tst.w	d7
	beq.s	loc_0C1440
	moveq	#$1,d1
	bra.s	loc_0C1442
loc_0C1440:
	moveq	#$0,d1
loc_0C1442:
	add.b	d1,d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	moveq	#$A,d0
	move.l	d0,-(a7)
	jsr	$524A(a5)	; -> sub_1FE630
	ext.l	d6
	move.l	d6,-(a7)
	moveq	#$B,d0
	move.l	d0,-(a7)
	jsr	$524A(a5)	; -> sub_1FE630
	ext.l	d7
	move.l	d7,-(a7)
	moveq	#$C,d0
	move.l	d0,-(a7)
	jsr	$524A(a5)	; -> sub_1FE630
	lea.l	$20(a7),a7
	movem.l	-$8(a6),d6-d7
	unlk	a6
	rts
