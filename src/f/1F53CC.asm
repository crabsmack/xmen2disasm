; ---------------------------------------------------------------------------
; sub_1F53CC	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1F53CC:
	link.w	a6,#$FFE2
	movem.l	d3-d7/a3-a4,-(a7)
	lea.l	-$E(a6),a3
	clr.w	d4
	move.l	-$348C(a5),d0
	sub.l	$10(a6),d0
	move.l	d0,d4
	asr.l	#$5,d4
	clr.w	d7
	moveq	#$C,d3
loc_1F53EA:
	clr.b	(a3,d7.w)
	move.w	d7,d0
	addq.w	#$1,d7
	cmp.w	d7,d3
	bgt.s	loc_1F53EA
	movea.l	$8(a6),a0
	move.w	$2(a0),d0
	asr.w	#$2,d0
	move.w	d0,-$16(a6)
	move.w	$4(a0),d5
	asr.w	#$2,d5
	moveq	#$0,d0
	move.w	$16(a0),d0
	tst.l	d0
	movea.l	d0,a4
	adda.l	$8(a6),a4
	move.w	(a4),-$14(a6)
	ble.w	loc_1F54DA
	addq.w	#$2,a4
	clr.w	d7
	bra.w	loc_1F54D2
loc_1F5428:
	move.w	(a4),d6
	move.w	$2(a4),-$1A(a6)
	move.w	$4(a4),-$18(a6)
	move.w	-$16(a6),d0
	muls.w	-$18(a6),d0
	add.l	d0,d0
	add.l	$C(a6),d0
	move.w	-$1A(a6),d1
	ext.l	d1
	add.l	d1,d1
	add.l	d0,d1
	move.l	d1,-$12(a6)
	movea.l	d1,a0
	move.w	(a0),d5
	tst.w	d6
	beq.s	loc_1F54CC
	move.w	d6,d0
	subq.w	#$1,d6
	move.b	(a3,d6.w),-$1(a6)
	move.b	#$1,(a3,d6.w)
	add.w	d4,d6
	tst.b	-$1(a6)
	bne.s	loc_1F54BA
	move.w	#$1FF,d0
	and.w	d6,d0
	moveq	#$0,d1
	move.w	d0,d1
	addq.l	#$1,d1
	lsl.l	#$4,d1
	add.l	d1,d1
	add.l	$10(a6),d1
	move.l	d1,-$1E(a6)
	move.l	-$348C(a5),d0
	cmp.l	-$1E(a6),d0
	bcc.s	loc_1F549A
	move.l	-$1E(a6),-$348C(a5)
loc_1F549A:
	moveq	#$0,d0
	move.l	d0,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	move.w	$16(a6),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.l	$10(a6),-(a7)
	jsr	sub_1F5340(pc)
	lea.l	$14(a7),a7
loc_1F54BA:
	movea.l	-$12(a6),a0
	move.w	#$FE00,d0
	and.w	(a0),d0
	or.w	d6,d0
	movea.l	-$12(a6),a0
	move.w	d0,(a0)
loc_1F54CC:
	addq.l	#$6,a4
	move.w	d7,d0
	addq.w	#$1,d7
loc_1F54D2:
	cmp.w	-$14(a6),d7
	blt.w	loc_1F5428
loc_1F54DA:
	moveq	#-$1,d5
	clr.w	d7
	moveq	#$C,d3
loc_1F54E0:
	tst.b	(a3,d7.w)
	beq.s	loc_1F54E8
	move.w	d7,d5
loc_1F54E8:
	move.w	d7,d0
	addq.w	#$1,d7
	cmp.w	d7,d3
	bgt.s	loc_1F54E0
	ext.l	d5
	move.l	d5,d0
	addq.l	#$1,d0
	movem.l	-$3A(a6),d3-d7/a3-a4
	unlk	a6
	rts
