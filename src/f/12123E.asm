; ---------------------------------------------------------------------------
; sub_12123E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_12123E:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> sub_1F694A
	movea.l	d0,a3
	move.l	$8(a3),d0
	sub.l	$8(a4),d0
	move.l	d0,d6
	asr.l	#$8,d6
	move.w	$4C(a3),d0
	ext.l	d0
	move.w	$50(a3),d1
	ext.l	d1
	add.l	d0,d1
	lsl.l	#$7,d1
	move.w	$4C(a4),d0
	ext.l	d0
	move.w	$50(a4),d2
	ext.l	d2
	add.l	d0,d2
	lsl.l	#$7,d2
	sub.l	d2,d1
	move.l	d1,d7
	asr.l	#$8,d7
	tst.w	d6
	sge.b	d3
	neg.b	d3
	beq.s	loc_121292
	ext.l	d6
	move.l	d6,d0
	bra.s	loc_121298
loc_121292:
	ext.l	d6
	move.l	d6,d0
	neg.l	d0
loc_121298:
	moveq	#$46,d1
	cmp.l	d0,d1
	addq.w	#$4,a7
	ble.s	loc_121302
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_1212AE
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_1212B4
loc_1212AE:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_1212B4:
	moveq	#$28,d1
	cmp.l	d0,d1
	ble.s	loc_121302
	clr.w	$1E(a4)
	clr.w	$16(a4)
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	bge.s	loc_1212D4
	ori.b	#$10,$2E(a4)
	bra.s	loc_1212DA
loc_1212D4:
	andi.b	#$EF,$2E(a4)
loc_1212DA:
	lea.l	$342A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	addq.w	#$8,a7
	move.w	#$FF,$6C(a4)
	lea.l	sub_1210CE(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1213FE
loc_121302:
	tst.w	$6E(a4)
	bne.w	loc_12139C
	move.w	$4C(a3),d0
	ext.l	d0
	move.w	$50(a3),d1
	ext.l	d1
	add.l	d0,d1
	lsl.l	#$7,d1
	move.w	$4C(a4),d0
	ext.l	d0
	move.w	$50(a4),d2
	ext.l	d2
	add.l	d0,d2
	lsl.l	#$7,d2
	move.l	d1,d6
	sub.l	d2,d6
	move.w	$A0(a4),$A2(a4)
	clr.w	$1E(a4)
	clr.w	$16(a4)
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	bge.s	loc_12134E
	ori.b	#$10,$2E(a4)
	bra.s	loc_121354
loc_12134E:
	andi.b	#$EF,$2E(a4)
loc_121354:
	cmpi.l	#$FFFFE200,d6
	bge.s	loc_121370
	lea.l	sub_121062(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_121062(pc)
	addq.w	#$4,a7
	bra.w	loc_1213FE
loc_121370:
	cmpi.l	#$500,d6
	ble.s	loc_12138A
	lea.l	sub_121098(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_121098(pc)
	addq.w	#$4,a7
	bra.s	loc_1213FE
loc_12138A:
	lea.l	sub_12102C(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_12102C(pc)
	addq.w	#$4,a7
	bra.s	loc_1213FE
loc_12139C:
	moveq	#$14,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E62(a5)	; -> sub_1F638A
	tst.b	d0
	addq.w	#$8,a7
	beq.s	loc_1213C0
	clr.w	$6C(a4)
	lea.l	sub_12123E(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1213FE
loc_1213C0:
	lea.l	$340A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> sub_1F6296
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_1213E0
	move.w	$A4(a4),d0
	ext.l	d0
	neg.l	d0
	bra.s	loc_1213E6
loc_1213E0:
	move.w	$A4(a4),d0
	ext.l	d0
loc_1213E6:
	move.w	d0,$16(a4)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_12110E(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1213FE:
	movem.l	-$14(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
