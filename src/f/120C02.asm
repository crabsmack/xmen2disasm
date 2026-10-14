; ---------------------------------------------------------------------------
; sub_120C02	[link-after-rts]
; ---------------------------------------------------------------------------
sub_120C02:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> sub_1F694A
	movea.l	d0,a3
	move.l	$8(a3),d6
	asr.l	#$8,d6
	move.l	$C(a3),d0
	sub.l	$C(a4),d0
	move.l	d0,d6
	asr.l	#$8,d6
	move.l	$8(a3),d0
	sub.l	$8(a4),d0
	move.l	d0,d7
	asr.l	#$8,d7
	cmpi.w	#$28,d7
	addq.w	#$4,a7
	bge.w	loc_120CD4
	cmpi.w	#$FFD8,d7
	ble.w	loc_120CD4
	tst.w	d6
	ble.w	loc_120CD4
	cmpi.w	#$D2,d6
	bge.w	loc_120CD4
	pea.l	($C8).w
	move.l	$C(a4),d0
	asr.l	#$8,d0
	moveq	#$40,d1
	add.l	d1,d0
	move.l	d0,-(a7)
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.l	d0,-(a7)
	jsr	$3EFA(a5)	; -> sub_15A8FE
	movea.l	d0,a3
	clr.w	$1E(a4)
	clr.w	$16(a4)
	move.w	$A(a3),d0
	cmp.w	$E(a3),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_120C8E
	move.w	$A(a3),d0
	bra.s	loc_120C92
loc_120C8E:
	move.w	$E(a3),d0
loc_120C92:
	move.w	d0,$98(a4)
	move.l	a3,$9A(a4)
	move.l	a4,-(a7)
	jsr	$4E7A(a5)	; -> sub_1F6530
	move.w	#$28,$20(a4)
	lea.l	$343A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	ori.w	#$1000,$6(a4)
	lea.l	$18(a7),a7
	move.w	#$FF,$6C(a4)
	lea.l	sub_120D32(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_120D28
loc_120CD4:
	moveq	#$A,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E62(a5)	; -> sub_1F638A
	tst.b	d0
	addq.w	#$8,a7
	beq.s	loc_120D16
	eori.b	#$10,$2E(a4)
	clr.w	$16(a4)
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_120CFA
	moveq	#-$5,d0
	bra.s	loc_120CFC
loc_120CFA:
	moveq	#$5,d0
loc_120CFC:
	ext.w	d0
	move.w	d0,$1E(a4)
	clr.w	$6C(a4)
	lea.l	sub_120C02(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_120D28
loc_120D16:
	clr.w	$6C(a4)
	lea.l	sub_120C02(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_120D28:
	movem.l	-$14(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
