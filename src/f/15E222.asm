; ---------------------------------------------------------------------------
; sub_15E222	[jt 2060]
; ---------------------------------------------------------------------------
sub_15E222:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	moveq	#$0,d0
	move.b	$3A(a3),d0
	cmpi.b	#$2,d0
	bcs.w	loc_15E3CA
	moveq	#$0,d7
	move.b	$3B(a3),d7
	tst.l	d7
	bra.s	loc_15E28C
loc_15E246:
	cmpi.w	#$FF,d7
	seq.b	d3
	neg.b	d3
	beq.s	loc_15E254
	moveq	#$0,d0
	bra.s	loc_15E262
loc_15E254:
	ext.l	d7
	movea.l	-$34A6(a5),a0
	move.l	d7,d0
	asl.l	#$2,d0
	move.l	(a0,d0.l),d0
loc_15E262:
	movea.l	d0,a4
	cmpi.w	#$FF,d7
	seq.b	d3
	neg.b	d3
	beq.s	loc_15E272
	moveq	#$0,d0
	bra.s	loc_15E280
loc_15E272:
	ext.l	d7
	movea.l	-$34A6(a5),a0
	move.l	d7,d0
	asl.l	#$2,d0
	move.l	(a0,d0.l),d0
loc_15E280:
	movea.l	d0,a0
	moveq	#$0,d0
	move.b	$3C(a0),d0
	move.w	d0,d7
	movea.l	(a4),a0
loc_15E28C:
	cmpi.w	#$FF,d7
	bne.s	loc_15E246
	ori.w	#$4000,$4(a3)
	andi.b	#$DF,$2E(a3)
	tst.l	$30(a3)
	beq.s	loc_15E308
	movea.l	$30(a3),a0
	moveq	#$20,d0
	cmp.b	(a0),d0
	beq.s	loc_15E308
	move.w	$34(a3),d5
	move.w	$36(a3),d6
	moveq	#$2,d7
	movea.l	-$34A6(a5),a0
	movea.l	$8(a0),a4
	bra.s	loc_15E2FE
loc_15E2C2:
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_15E2EE
	cmp.w	$34(a4),d5
	bge.s	loc_15E2EE
	pea.l	$2E(a4)
	jsr	$5072(a5)	; -> sub_1FB126
	sub.w	d6,$34(a4)
	addq.w	#$4,a7
loc_15E2EE:
	addq.w	#$1,d7
	move.w	d7,d0
	ext.l	d0
	movea.l	-$34A6(a5),a0
	asl.l	#$2,d0
	movea.l	(a0,d0.l),a4
loc_15E2FE:
	cmp.w	-$13F2(a5),d7
	blt.s	loc_15E2C2
	sub.w	d6,-$3598(a5)
loc_15E308:
	move.b	#$FF,$3B(a3)
	move.b	#$FF,$3A(a3)
	move.w	#$200,d0
	and.w	$6(a3),d0
	beq.s	loc_15E32A
	pea.l	sub_15E7EA(pc)
	move.l	a3,-(a7)
	jsr	$4F2A(a5)	; -> sub_1F7D5E
	addq.w	#$8,a7
loc_15E32A:
	movea.l	$7C(a3),a4
	move.l	a4,d0
	beq.s	loc_15E33A
	move.l	a4,-(a7)
	jsr	$4FE2(a5)	; -> sub_1F9D1E
	addq.w	#$4,a7
loc_15E33A:
	moveq	#$1,d0
	and.w	$6(a3),d0
	bne.s	loc_15E374
	moveq	#$10,d0
	and.w	$6(a3),d0
	beq.s	loc_15E360
	pea.l	-$165E(a5)
	move.l	$80(a3),-(a7)
	jsr	sub_15DF66(pc)
	moveq	#$0,d0
	move.l	d0,$80(a3)
	addq.w	#$8,a7
	bra.s	loc_15E374
loc_15E360:
	pea.l	-$1656(a5)
	move.l	$80(a3),-(a7)
	jsr	sub_15DF66(pc)
	moveq	#$0,d0
	move.l	d0,$80(a3)
	addq.w	#$8,a7
loc_15E374:
	moveq	#$2,d0
	and.w	$6(a3),d0
	bne.s	loc_15E3AE
	moveq	#$10,d0
	and.w	$6(a3),d0
	beq.s	loc_15E39A
	pea.l	-$165A(a5)
	move.l	$84(a3),-(a7)
	jsr	sub_15DF66(pc)
	moveq	#$0,d0
	move.l	d0,$84(a3)
	addq.w	#$8,a7
	bra.s	loc_15E3AE
loc_15E39A:
	pea.l	-$1652(a5)
	move.l	$84(a3),-(a7)
	jsr	sub_15DF66(pc)
	moveq	#$0,d0
	move.l	d0,$84(a3)
	addq.w	#$8,a7
loc_15E3AE:
	moveq	#-$1,d0
	cmp.w	$88(a3),d0
	bge.s	loc_15E3CA
	move.w	$88(a3),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$4F72(a5)	; -> sub_1F9122
	move.w	#$FFFF,$88(a3)
	addq.w	#$4,a7
loc_15E3CA:
	movem.l	-$18(a6),d3/d5-d7/a3-a4
	unlk	a6
	rts
