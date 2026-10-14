; ---------------------------------------------------------------------------
; sub_13463C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_13463C:
	link.w	a6,#$0
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> sub_1F694A
	movea.l	d0,a3
	move.l	$8(a3),d0
	asr.l	#$8,d0
	move.w	$9A(a4),d4
	add.w	d0,d4
	move.w	$9C(a4),d5
	add.w	$54(a3),d5
	move.w	$1E(a4),$16(a4)
	move.w	$20(a4),$18(a4)
	clr.l	$1E(a4)
	addq.w	#$4,a7
loc_134676:
	tst.l	$A2(a4)
	beq.w	loc_1346FE
	tst.b	$A6(a4)
	beq.s	loc_134694
	movea.l	$A2(a4),a0
	move.w	(a0),d0
	ext.l	d0
	lsl.l	#$8,d0
	add.w	d0,$16(a4)
	bra.s	loc_1346A2
loc_134694:
	movea.l	$A2(a4),a0
	move.w	(a0),d0
	ext.l	d0
	lsl.l	#$8,d0
	sub.w	d0,$16(a4)
loc_1346A2:
	movea.l	$A2(a4),a0
	move.w	$2(a0),d0
	ext.l	d0
	lsl.l	#$8,d0
	add.w	d0,$18(a4)
	addq.l	#$4,$A2(a4)
	moveq	#$1,d3
	movea.l	$A2(a4),a0
	cmpi.w	#$100,(a0)
	bgt.s	loc_1346D0
	movea.l	$A2(a4),a0
	cmpi.w	#$100,$2(a0)
	bgt.s	loc_1346D0
	moveq	#$0,d3
loc_1346D0:
	tst.b	d3
	beq.s	loc_1346D8
	moveq	#$1,d0
	bra.s	loc_1346DA
loc_1346D8:
	moveq	#$0,d0
loc_1346DA:
	beq.s	loc_1346FE
	movea.l	$A2(a4),a0
	cmpi.w	#$3E9,(a0)
	bne.s	loc_1346F8
	movea.l	$A2(a4),a0
	move.w	$2(a0),d0
	ext.l	d0
	asl.l	#$2,d0
	sub.l	d0,$A2(a4)
	bra.s	loc_1346FE
loc_1346F8:
	moveq	#$0,d0
	move.l	d0,$A2(a4)
loc_1346FE:
	ext.l	d4
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.l	d4,d1
	sub.l	d0,d1
	move.l	d1,d6
	asr.l	#$1,d6
	ext.l	d5
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.l	d5,d1
	sub.l	d0,d1
	move.l	d1,d7
	asr.l	#$1,d7
	tst.w	d6
	bne.s	loc_134726
	tst.w	d7
	beq.s	loc_134770
loc_134726:
	tst.w	d6
	sge.b	d3
	neg.b	d3
	beq.s	loc_134734
	ext.l	d6
	move.l	d6,d0
	bra.s	loc_13473A
loc_134734:
	ext.l	d6
	move.l	d6,d0
	neg.l	d0
loc_13473A:
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_134748
	ext.l	d7
	move.l	d7,d1
	bra.s	loc_13474E
loc_134748:
	ext.l	d7
	move.l	d7,d1
	neg.l	d1
loc_13474E:
	add.l	d0,d1
	moveq	#$4,d0
	cmp.l	d1,d0
	bge.s	loc_13475C
	asr.w	#$1,d6
	asr.w	#$1,d7
	bra.s	loc_134726
loc_13475C:
	ext.l	d6
	move.l	d6,d0
	lsl.l	#$8,d0
	add.w	d0,$1E(a4)
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$8,d0
	add.w	d0,$20(a4)
loc_134770:
	move.w	$E(a6),d0
	subq.w	#$1,$E(a6)
	tst.w	$E(a6)
	bgt.w	loc_134676
	moveq	#$0,d0
	movem.l	-$1C(a6),d3-d7/a3-a4
	unlk	a6
	rts
