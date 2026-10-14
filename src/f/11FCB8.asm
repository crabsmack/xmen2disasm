; ---------------------------------------------------------------------------
; sub_11FCB8	[jt 1654]
; ---------------------------------------------------------------------------
sub_11FCB8:
	link.w	a6,#$FFEC
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.b	#$1,-$D(a6)
	movea.l	$92(a3),a0
	move.w	(a0),-$14(a6)
	ori.w	#$1,$98(a3)
	move.b	#$1,-$5(a6)
	move.l	$8(a3),d0
	asr.l	#$8,d0
	move.w	d0,-$C(a6)
	move.w	$A8(a3),-$4(a6)
	move.w	$A8(a3),d0
	ext.l	d0
	move.w	$A8(a3),d1
	asr.w	#$1,d1
	ext.l	d1
	add.l	d0,d1
	move.w	$A8(a3),d0
	asr.w	#$2,d0
	add.w	d1,d0
	move.w	d0,-$2(a6)
loc_11FD0A:
	move.l	$C(a3),-$A(a6)
	movea.l	$92(a3),a4
	addq.w	#$2,a4
	move.w	$A6(a3),d6
	clr.w	d7
	bra.w	loc_11FE62
loc_11FD20:
	moveq	#$0,d0
	move.w	d7,d0
	move.w	-$14(a6),d1
	asr.w	#$1,d1
	ext.l	d1
	cmp.l	d0,d1
	bne.s	loc_11FD3E
	move.w	$A6(a3),d6
	add.w	#$80,d6
	move.l	$C(a3),-$A(a6)
loc_11FD3E:
	move.w	-$2(a6),d0
	ext.l	d0
	ext.l	d6
	move.l	d6,d1
	moveq	#$40,d2
	add.l	d2,d1
	and.l	#$FF,d1
	cmpi.l	#$80,d1
	scs.b	d3
	neg.b	d3
	beq.s	loc_11FD76
	ext.l	d6
	move.l	d6,d1
	add.l	d2,d1
	and.l	#$7F,d1
	asl.w	#$2,d1
	lea.l	-$1C9C(a5),a0
	move.l	(a0,d1.w),d1
	bra.s	loc_11FD90
loc_11FD76:
	ext.l	d6
	move.l	d6,d1
	moveq	#$40,d2
	add.l	d2,d1
	and.l	#$7F,d1
	asl.w	#$2,d1
	lea.l	-$1C9C(a5),a0
	move.l	(a0,d1.w),d1
	neg.l	d1
loc_11FD90:
	jsr	$3F9A(a5)	; -> sub_15C1FC
	swap	d0
	ext.l	d0
	asr.w	#$8,d0
	add.w	-$C(a6),d0
	move.w	d0,-$12(a6)
	move.l	-$A(a6),d0
	asr.l	#$8,d0
	move.w	d0,-$10(a6)
	tst.w	d6
	blt.s	loc_11FDB6
	cmpi.w	#$80,d6
	blt.s	loc_11FDC2
loc_11FDB6:
	cmpi.w	#$100,d6
	blt.s	loc_11FDCA
	cmpi.w	#$180,d6
	bge.s	loc_11FDCA
loc_11FDC2:
	ori.w	#$1,$4(a4)
	bra.s	loc_11FDD0
loc_11FDCA:
	andi.w	#$FFFE,$4(a4)
loc_11FDD0:
	move.w	#$100,d0
	and.w	$98(a3),d0
	beq.s	loc_11FE44
	move.w	-$12(a6),d4
	sub.w	(a4),d4
	move.w	-$10(a6),d5
	sub.w	$2(a4),d5
	tst.w	d4
	bne.s	loc_11FDF0
	tst.w	d5
	beq.s	loc_11FE4E
loc_11FDF0:
	cmpi.w	#$FFFB,d4
	slt.b	d3
	neg.b	d3
	beq.s	loc_11FDFE
	moveq	#-$5,d0
	bra.s	loc_11FE00
loc_11FDFE:
	move.w	d4,d0
loc_11FE00:
	move.w	d0,d4
	cmpi.w	#$5,d4
	slt.b	d3
	neg.b	d3
	beq.s	loc_11FE10
	move.w	d4,d0
	bra.s	loc_11FE12
loc_11FE10:
	moveq	#$5,d0
loc_11FE12:
	move.w	d0,d4
	cmpi.w	#$FFFB,d5
	slt.b	d3
	neg.b	d3
	beq.s	loc_11FE22
	moveq	#-$5,d0
	bra.s	loc_11FE24
loc_11FE22:
	move.w	d5,d0
loc_11FE24:
	move.w	d0,d5
	cmpi.w	#$5,d5
	slt.b	d3
	neg.b	d3
	beq.s	loc_11FE34
	move.w	d5,d0
	bra.s	loc_11FE36
loc_11FE34:
	moveq	#$5,d0
loc_11FE36:
	move.w	d0,d5
	add.w	d4,(a4)
	add.w	d5,$2(a4)
	clr.b	-$5(a6)
	bra.s	loc_11FE4E
loc_11FE44:
	move.w	-$12(a6),(a4)
	move.w	-$10(a6),$2(a4)
loc_11FE4E:
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$6,a4
	addi.w	#$20,d6
	move.w	-$4(a6),d0
	ext.l	d0
	sub.l	d0,-$A(a6)
loc_11FE62:
	moveq	#$0,d0
	move.w	d7,d0
	move.w	-$14(a6),d1
	ext.l	d1
	cmp.l	d0,d1
	bgt.w	loc_11FD20
	tst.b	-$5(a6)
	beq.s	loc_11FE7E
	andi.w	#$FEFF,$98(a3)
loc_11FE7E:
	move.w	#$100,d0
	and.w	$98(a3),d0
	bne.s	loc_11FEC6
	move.w	#$FF,d0
	and.w	$AA(a3),d0
	add.w	d0,$A6(a3)
	move.w	#$200,d0
	and.w	$98(a3),d0
	beq.s	loc_11FEB8
	cmpi.w	#$2800,$A8(a3)
	bge.s	loc_11FEB2
	addi.w	#$40,$A8(a3)
	addq.w	#$1,$AA(a3)
	bra.s	loc_11FEB8
loc_11FEB2:
	andi.w	#$FDFF,$98(a3)
loc_11FEB8:
	cmpi.w	#$100,$A6(a3)
	ble.s	loc_11FEC6
	subi.w	#$100,$A6(a3)
loc_11FEC6:
	move.w	$E(a6),d0
	subq.w	#$1,$E(a6)
	tst.w	$E(a6)
	bgt.w	loc_11FD0A
	move.b	-$D(a6),d0
	movem.l	-$30(a6),d3-d7/a3-a4
	unlk	a6
	rts
