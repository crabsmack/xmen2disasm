; ---------------------------------------------------------------------------
; sub_1582B6	[jt 1981]
; ---------------------------------------------------------------------------
sub_1582B6:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.b	$7(a3),d7
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$3E62(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	move.w	#$400,$90(a4)
	clr.w	$9E(a4)
	move.w	#$C8,$A0(a4)
	move.w	#$C8,$A2(a4)
	tst.b	d7
	beq.s	loc_158314
	lea.l	sub_158FE4(pc),a0
	move.l	a0,$5C(a4)
	lea.l	sub_158FE4(pc),a0
	move.l	a0,$64(a4)
	bra.s	loc_158324
loc_158314:
	lea.l	sub_158E32(pc),a0
	move.l	a0,$5C(a4)
	lea.l	sub_158E32(pc),a0
	move.l	a0,$64(a4)
loc_158324:
	andi.w	#$BFFF,$4(a4)
	ori.w	#$108A,$6(a4)
	tst.b	d7
	beq.s	loc_15833A
	ori.w	#$10,$6(a4)
loc_15833A:
	clr.b	$100(a4)
	clr.b	$FF(a4)
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_158372
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_15836A
	ori.b	#$4,-$1A68(a5)
	bra.s	loc_1583B8
loc_15836A:
	andi.b	#$FB,-$1A68(a5)
	bra.s	loc_1583B8
loc_158372:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_1583A2
	moveq	#$4,d0
	and.b	-$181A(a5),d0
	beq.s	loc_15839A
	ori.b	#$4,-$1A68(a5)
	bra.s	loc_1583B8
loc_15839A:
	andi.b	#$FB,-$1A68(a5)
	bra.s	loc_1583B8
loc_1583A2:
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_1583B2
	ori.b	#$4,-$1A68(a5)
	bra.s	loc_1583B8
loc_1583B2:
	andi.b	#$FB,-$1A68(a5)
loc_1583B8:
	moveq	#$0,d0
	move.l	d0,$30(a4)
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
