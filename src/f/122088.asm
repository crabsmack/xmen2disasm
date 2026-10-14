; ---------------------------------------------------------------------------
; sub_122088	[link-after-rts]
; ---------------------------------------------------------------------------
sub_122088:
	link.w	a6,#$FFF8
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	-$1A8C(a5),a4
	movea.l	$8(a6),a0
	movea.l	$AC(a0),a3
	moveq	#$1,d6
	moveq	#$10,d0
	and.b	$2E(a0),d0
	move.b	d0,-$5(a6)
	move.l	$8(a0),d0
	asr.l	#$8,d0
	move.w	d0,-$4(a6)
	move.l	$C(a0),d0
	asr.l	#$8,d0
	move.w	d0,-$2(a6)
	clr.w	d4
	clr.w	-$8(a6)
	moveq	#$10,d3
	bra.s	loc_122124
loc_1220C6:
	tst.b	-$5(a6)
	beq.s	loc_1220D4
	move.w	-$4(a6),d5
	sub.w	(a3),d5
	bra.s	loc_1220DA
loc_1220D4:
	move.w	(a3),d5
	add.w	-$4(a6),d5
loc_1220DA:
	move.w	d5,d7
	sub.w	(a4),d7
	move.w	$2(a3),d0
	add.w	-$2(a6),d0
	move.w	d0,$2(a4)
	cmpi.w	#$8,d7
	ble.s	loc_1220F6
	addq.w	#$8,(a4)
	clr.b	d6
	bra.s	loc_122114
loc_1220F6:
	tst.w	d7
	ble.s	loc_122100
	add.w	d7,(a4)
	clr.b	d6
	bra.s	loc_122114
loc_122100:
	cmpi.w	#$FFF8,d7
	bge.s	loc_12210C
	subq.w	#$8,(a4)
	clr.b	d6
	bra.s	loc_122114
loc_12210C:
	tst.w	d7
	bge.s	loc_122114
	add.w	d7,(a4)
	clr.b	d6
loc_122114:
	addq.w	#$8,a3
	addq.w	#$6,a4
	move.w	d4,d0
	addq.w	#$1,d4
	move.w	-$8(a6),d0
	addq.w	#$1,-$8(a6)
loc_122124:
	cmp.w	d4,d3
	bgt.s	loc_1220C6
	tst.b	d6
	beq.s	loc_1221A8
	lea.l	$347A(a5),a0
	movea.l	$2(a0),a3
	movea.l	$8(a6),a0
	andi.w	#$FFF7,$A2(a0)
	movea.l	$8(a6),a0
	tst.b	$B6(a0)
	seq.b	d3
	neg.b	d3
	move.b	d3,$B6(a0)
	movea.l	$8(a6),a0
	tst.b	$B6(a0)
	beq.s	loc_122160
	andi.b	#$EF,$2E(a0)
	bra.s	loc_12216A
loc_122160:
	movea.l	$8(a6),a0
	ori.b	#$10,$2E(a0)
loc_12216A:
	move.l	a3,-(a7)
	move.l	a0,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	pea.l	($F8).w
	jsr	$5222(a5)	; -> sub_1FE5A2
	pea.l	($F8).w
	jsr	$521A(a5)	; -> sub_1FE584
	lea.l	$10(a7),a7
	movea.l	$8(a6),a0
	move.w	#$FF,$6C(a0)
	lea.l	sub_122024(pc),a0
	movea.l	$8(a6),a1
	move.l	a0,$5C(a1)
	movea.l	$8(a6),a0
	moveq	#$8,d0
	and.w	$4(a0),d0
	bra.s	loc_1221C6
loc_1221A8:
	movea.l	$8(a6),a0
	clr.w	$6C(a0)
	lea.l	sub_122088(pc),a0
	movea.l	$8(a6),a1
	move.l	a0,$5C(a1)
	movea.l	$8(a6),a0
	moveq	#$8,d0
	and.w	$4(a0),d0
loc_1221C6:
	movem.l	-$24(a6),d3-d7/a3-a4
	unlk	a6
	rts
