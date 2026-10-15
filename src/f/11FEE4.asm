; ---------------------------------------------------------------------------
; sub_11FEE4	[jt 1655]
; ---------------------------------------------------------------------------
sub_11FEE4:
	link.w	a6,#$FFF0
	movem.l	d3-d7/a3-a4,-(a7)
	move.b	#$1,-$7(a6)
	movea.l	$8(a6),a0
	movea.l	$92(a0),a0
	move.w	(a0),-$C(a6)
	movea.l	$8(a6),a0
	andi.w	#$FFFE,$98(a0)
	move.b	#$1,-$1(a6)
	movea.l	$8(a6),a0
	move.l	$8(a0),d0
	asr.l	#$8,d0
	move.w	d0,-$6(a6)
	move.l	$C(a0),d0
	asr.l	#$8,d0
	move.w	d0,-$4(a6)
loc_11FF26:
	movea.l	$8(a6),a0
	movea.l	$92(a0),a4
	addq.w	#$2,a4
	movea.l	a0,a1
	move.w	$A6(a1),d0
	ext.l	d0
	asl.l	#$3,d0
	movea.l	d0,a3
	adda.l	$9A(a0),a3
	clr.w	d7
	bra.w	loc_12001E
loc_11FF46:
	tst.w	(a4)
	bge.s	loc_11FF52
	tst.w	$2(a4)
	blt.w	loc_12002E
loc_11FF52:
	cmpi.w	#$3E8,(a3)
	blt.s	loc_11FF60
	movea.l	$8(a6),a0
	movea.l	$9A(a0),a3
loc_11FF60:
	move.w	(a3),d0
	ext.l	d0
	move.l	d0,-$10(a6)
	movea.l	$8(a6),a0
	move.w	$A8(a0),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$517A(a5)	; -> Math_SinDeg
	move.l	-$10(a6),d1
	exg.l	d0,d1
	jsr	$3F9A(a5)	; -> sub_15C1FC
	swap	d0
	ext.l	d0
	add.w	-$6(a6),d0
	move.w	d0,-$A(a6)
	move.w	$2(a3),d4
	add.w	-$4(a6),d4
	movea.l	$8(a6),a0
	move.w	#$100,d0
	and.w	$98(a0),d0
	addq.w	#$4,a7
	beq.s	loc_12000E
	move.w	-$A(a6),d5
	sub.w	(a4),d5
	move.w	d4,d6
	sub.w	$2(a4),d6
	tst.w	d5
	bne.s	loc_11FFBA
	tst.w	d6
	beq.s	loc_120016
loc_11FFBA:
	cmpi.w	#$FFFB,d5
	slt.b	d3
	neg.b	d3
	beq.s	loc_11FFC8
	moveq	#-$5,d0
	bra.s	loc_11FFCA
loc_11FFC8:
	move.w	d5,d0
loc_11FFCA:
	move.w	d0,d5
	cmpi.w	#$5,d5
	slt.b	d3
	neg.b	d3
	beq.s	loc_11FFDA
	move.w	d5,d0
	bra.s	loc_11FFDC
loc_11FFDA:
	moveq	#$5,d0
loc_11FFDC:
	move.w	d0,d5
	cmpi.w	#$FFFB,d6
	slt.b	d3
	neg.b	d3
	beq.s	loc_11FFEC
	moveq	#-$5,d0
	bra.s	loc_11FFEE
loc_11FFEC:
	move.w	d6,d0
loc_11FFEE:
	move.w	d0,d6
	cmpi.w	#$5,d6
	slt.b	d3
	neg.b	d3
	beq.s	loc_11FFFE
	move.w	d6,d0
	bra.s	loc_120000
loc_11FFFE:
	moveq	#$5,d0
loc_120000:
	move.w	d0,d6
	add.w	d5,(a4)
	add.w	d6,$2(a4)
	clr.b	-$1(a6)
	bra.s	loc_120016
loc_12000E:
	move.w	-$A(a6),(a4)
	move.w	d4,$2(a4)
loc_120016:
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$6,a4
	addq.w	#$8,a3
loc_12001E:
	moveq	#$0,d0
	move.w	d7,d0
	move.w	-$C(a6),d1
	ext.l	d1
	cmp.l	d0,d1
	bgt.w	loc_11FF46
loc_12002E:
	tst.b	-$1(a6)
	beq.s	loc_12003E
	movea.l	$8(a6),a0
	andi.w	#$FEFF,$98(a0)
loc_12003E:
	movea.l	$8(a6),a0
	move.w	#$100,d0
	and.w	$98(a0),d0
	bne.s	loc_120090
	addq.w	#$1,$A6(a0)
	movea.l	$8(a6),a0
	movea.l	a0,a1
	move.w	$A6(a1),d0
	ext.l	d0
	asl.l	#$3,d0
	movea.l	d0,a3
	adda.l	$9A(a0),a3
	cmpi.w	#$3E8,(a3)
	blt.s	loc_120072
	movea.l	$8(a6),a0
	clr.w	$A6(a0)
loc_120072:
	movea.l	$8(a6),a0
	addq.w	#$5,$A8(a0)
	movea.l	$8(a6),a0
	cmpi.w	#$168,$A8(a0)
	ble.s	loc_120090
	movea.l	$8(a6),a0
	subi.w	#$168,$A8(a0)
loc_120090:
	move.w	$E(a6),d0
	subq.w	#$1,$E(a6)
	tst.w	$E(a6)
	bgt.w	loc_11FF26
	move.b	-$7(a6),d0
	movem.l	-$2C(a6),d3-d7/a3-a4
	unlk	a6
	rts
