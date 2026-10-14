; ---------------------------------------------------------------------------
; sub_097AA2	[jt 760]
; ---------------------------------------------------------------------------
sub_097AA2:
	link.w	a6,#$FFFE
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> sub_1F694A
	movea.l	d0,a3
	move.l	$8(a3),d0
	asr.l	#$8,d0
	move.w	d0,-$2(a6)
	move.l	$8(a4),d7
	asr.l	#$8,d7
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	addq.w	#$4,a7
	bne.w	loc_097B88
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.w	loc_097B88
	move.l	-$1750(a5),d0
	asr.l	#$8,d0
	move.w	d0,d4
	sub.w	d7,d4
	tst.w	d4
	sge.b	d3
	neg.b	d3
	beq.s	loc_097B14
	ext.l	d4
	move.l	d4,d0
	bra.s	loc_097B1A
loc_097B14:
	ext.l	d4
	move.l	d4,d0
	neg.l	d0
loc_097B1A:
	move.w	d0,d4
	move.l	-$1840(a5),d0
	asr.l	#$8,d0
	move.w	d0,d5
	sub.w	d7,d5
	tst.w	d5
	sge.b	d3
	neg.b	d3
	beq.s	loc_097B34
	ext.l	d5
	move.l	d5,d0
	bra.s	loc_097B3A
loc_097B34:
	ext.l	d5
	move.l	d5,d0
	neg.l	d0
loc_097B3A:
	move.w	d0,d5
	cmp.w	$B4(a4),d4
	bge.s	loc_097B88
	cmp.w	$B4(a4),d5
	bge.s	loc_097B88
	move.l	-$1750(a5),d0
	cmp.l	$8(a4),d0
	bge.s	loc_097B66
	move.l	-$1840(a5),d0
	cmp.l	$8(a4),d0
	bge.s	loc_097B66
	ori.b	#$10,$2E(a4)
	bra.w	loc_097C0E
loc_097B66:
	move.l	-$1750(a5),d0
	cmp.l	$8(a4),d0
	ble.w	loc_097C0E
	move.l	-$1840(a5),d0
	cmp.l	$8(a4),d0
	ble.w	loc_097C0E
	andi.b	#$EF,$2E(a4)
	bra.w	loc_097C0E
loc_097B88:
	cmp.w	-$2(a6),d7
	bge.s	loc_097B98
	move.w	-$2(a6),d6
	sub.w	$B4(a4),d6
	bra.s	loc_097BA0
loc_097B98:
	move.w	$B4(a4),d6
	add.w	-$2(a6),d6
loc_097BA0:
	ext.l	d6
	ext.l	d7
	move.l	d6,d0
	sub.l	d7,d0
	sge.b	d3
	neg.b	d3
	beq.s	loc_097BB8
	ext.l	d6
	ext.l	d7
	move.l	d6,d0
	sub.l	d7,d0
	bra.s	loc_097BC2
loc_097BB8:
	ext.l	d6
	ext.l	d7
	move.l	d6,d0
	sub.l	d7,d0
	neg.l	d0
loc_097BC2:
	moveq	#$A,d1
	cmp.l	d0,d1
	bgt.s	loc_097C0E
	cmp.w	d7,d6
	bge.s	loc_097BDC
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_097BDC
	ori.b	#$10,$2E(a4)
	bra.s	loc_097BEE
loc_097BDC:
	cmp.w	d7,d6
	ble.s	loc_097BEE
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_097BEE
	andi.b	#$EF,$2E(a4)
loc_097BEE:
	move.l	a4,-(a7)
	jsr	sub_097904(pc)
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_097C0E
	clr.w	$6C(a4)
	lea.l	sub_097AA2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_097C70
loc_097C0E:
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	movea.l	$A8(a4),a0
	movea.l	a0,a1
	adda.w	$4(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> sub_1F6296
	tst.l	$98(a4)
	addq.w	#$8,a7
	bne.s	loc_097C42
	move.l	$64(a4),$5C(a4)
	move.w	#$A,$6C(a4)
	bra.s	loc_097C70
loc_097C42:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_097C56
	clr.w	$96(a4)
loc_097C56:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$A,$6C(a4)
loc_097C70:
	movem.l	-$1E(a6),d3-d7/a3-a4
	unlk	a6
	rts
