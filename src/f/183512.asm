; ---------------------------------------------------------------------------
; sub_183512	[jt 2138]
; ---------------------------------------------------------------------------
sub_183512:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	lea.l	$2B9A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$72(a0),a1
	jsr	(a1)
	move.l	#$80000,d0
	and.l	$90(a4),d0
	addq.w	#$4,a7
	beq.s	loc_183576
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$4,d1
	and.b	$2E(a4),d1
	beq.s	loc_18354E
	moveq	#$1,d1
	bra.s	loc_183550
loc_18354E:
	moveq	#$0,d1
loc_183550:
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	$C2(a4)
	pea.l	$DA(a4)
	pea.l	$D6(a4)
	jsr	sub_183320(pc)
	tst.b	d0
	lea.l	$18(a7),a7
	beq.s	loc_183576
	andi.l	#$FFF7FFFF,$90(a4)
loc_183576:
	move.l	#$100000,d0
	and.l	$90(a4),d0
	beq.s	loc_1835BA
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$4,d1
	and.b	$2E(a4),d1
	beq.s	loc_183592
	moveq	#$1,d1
	bra.s	loc_183594
loc_183592:
	moveq	#$0,d1
loc_183594:
	move.l	d1,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	$C2(a4)
	pea.l	$DA(a4)
	pea.l	$D8(a4)
	jsr	sub_183320(pc)
	tst.b	d0
	lea.l	$18(a7),a7
	beq.s	loc_1835BA
	andi.l	#$FFEFFFFF,$90(a4)
loc_1835BA:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
