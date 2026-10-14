; ---------------------------------------------------------------------------
; sub_096DF2	[link-after-rts]
; ---------------------------------------------------------------------------
sub_096DF2:
	link.w	a6,#$FFF8
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> sub_1F694A
	move.l	d0,-$8(a6)
	movea.l	$9C(a4),a3
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	$C(a3),-(a7)
	move.l	$8(a3),-(a7)
	lea.l	$32E2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	lea.l	$32E2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	move.l	d0,-$4(a6)
	lea.l	$18(a7),a7
	beq.w	loc_096EC4
	movea.l	-$8(a6),a0
	move.l	$8(a0),d5
	move.w	$4C(a0),d0
	ext.l	d0
	move.w	$50(a0),d1
	ext.l	d1
	add.l	d0,d1
	asr.l	#$1,d1
	move.l	d1,d6
	lsl.l	#$8,d6
	move.l	d5,d4
	sub.l	$8(a3),d4
	move.l	d6,d5
	sub.l	$C(a3),d5
	tst.l	d4
	sge.b	d3
	neg.b	d3
	beq.s	loc_096E70
	move.l	d4,d0
	bra.s	loc_096E74
loc_096E70:
	move.l	d4,d0
	neg.l	d0
loc_096E74:
	tst.l	d5
	sge.b	d3
	neg.b	d3
	beq.s	loc_096E80
	move.l	d5,d1
	bra.s	loc_096E84
loc_096E80:
	move.l	d5,d1
	neg.l	d1
loc_096E84:
	add.l	d0,d1
	moveq	#$A,d0
	move.l	d1,d6
	asr.l	d0,d6
	moveq	#$7,d7
	moveq	#$0,d3
loc_096E90:
	moveq	#$1,d0
	lsl.l	d7,d0
	ext.l	d6
	move.l	d6,d1
	and.l	d0,d1
	bne.s	loc_096EA4
	move.w	d7,d0
	subq.w	#$1,d7
	cmp.w	d7,d3
	blt.s	loc_096E90
loc_096EA4:
	move.l	d4,d6
	asr.l	d7,d6
	move.l	d5,d4
	asr.l	d7,d4
	moveq	#$1,d0
	move.l	d0,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	move.l	-$4(a6),-(a7)
	jsr	$32D2(a5)	; -> sub_11E5E6
	lea.l	$10(a7),a7
loc_096EC4:
	pea.l	($F4).w
	jsr	$5222(a5)	; -> sub_1FE5A2
	pea.l	($F4).w
	jsr	$521A(a5)	; -> sub_1FE584
	subq.b	#$1,$B9(a4)
	tst.b	$B9(a4)
	addq.w	#$8,a7
	ble.s	loc_096EF6
	move.w	#$5,$6C(a4)
	lea.l	sub_096DF2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_096F34
loc_096EF6:
	tst.l	$98(a4)
	bne.s	loc_096F08
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_096F34
loc_096F08:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_096F1C
	clr.w	$96(a4)
loc_096F1C:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_096F34:
	movem.l	-$24(a6),d3-d7/a3-a4
	unlk	a6
	rts
