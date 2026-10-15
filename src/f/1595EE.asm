; ---------------------------------------------------------------------------
; sub_1595EE	[jt 1989]
; ---------------------------------------------------------------------------
sub_1595EE:
	link.w	a6,#$FFE2
	movem.l	d3-d7/a4,-(a7)
	move.b	$13(a6),d6
	move.b	$17(a6),d7
	beq.s	loc_159608
	move.l	#$100,d0
	bra.s	loc_15960E
loc_159608:
	move.l	#$400,d0
loc_15960E:
	move.w	d0,-$1A(a6)
	tst.b	d7
	beq.s	loc_15961E
	move.l	#$100,d0
	bra.s	loc_159620
loc_15961E:
	moveq	#$60,d0
loc_159620:
	move.w	d0,-$18(a6)
	moveq	#$0,d0
	move.l	d0,-$14(a6)
	moveq	#$0,d4
	tst.b	$23(a6)
	beq.s	loc_159652
	pea.l	-$15(a6)
	pea.l	-$14(a6)
	pea.l	-$1C(a6)
	pea.l	-$1E(a6)
	ext.w	d6
	ext.l	d6
	move.l	d6,-(a7)
	jsr	sub_159354(pc)
	lea.l	$14(a7),a7
	bra.s	loc_159696
loc_159652:
	tst.b	$1B(a6)
	beq.s	loc_159678
	pea.l	-$15(a6)
	pea.l	-$14(a6)
	pea.l	-$1C(a6)
	pea.l	-$1E(a6)
	ext.w	d6
	ext.l	d6
	move.l	d6,-(a7)
	jsr	sub_1592F6(pc)
	lea.l	$14(a7),a7
	bra.s	loc_159696
loc_159678:
	pea.l	-$15(a6)
	pea.l	-$14(a6)
	pea.l	-$1C(a6)
	pea.l	-$1E(a6)
	ext.w	d6
	ext.l	d6
	move.l	d6,-(a7)
	jsr	sub_1594C0(pc)
	lea.l	$14(a7),a7
loc_159696:
	moveq	#$0,d0
	move.b	d7,d0
	move.w	d0,-$A(a6)
	moveq	#$0,d0
	move.b	$1F(a6),d0
	move.w	d0,-$8(a6)
	move.w	$26(a6),-$6(a6)
	move.w	-$1E(a6),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,d5
	add.l	$8(a6),d5
	move.w	-$1C(a6),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	$C(a6),d6
	sub.l	d0,d6
	pea.l	-$10(a6)
	move.l	d6,-(a7)
	move.l	d5,-(a7)
	lea.l	$3E6A(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$3E6A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a4
	move.l	a4,d0
	lea.l	$14(a7),a7
	beq.w	loc_1597B2
	move.w	-$1A(a6),$8C(a4)
	move.w	-$18(a6),$8E(a4)
	move.l	-$14(a6),$92(a4)
	move.l	d4,$96(a4)
	move.l	a4,-(a7)
	jsr	sub_1580B2(pc)
	tst.b	d7
	addq.w	#$4,a7
	beq.s	loc_159722
	move.b	-$15(a6),$71(a4)
	bra.s	loc_159728
loc_159722:
	move.b	#$8,$71(a4)
loc_159728:
	move.l	d5,d4
	asr.l	#$8,d4
	move.l	d6,d7
	asr.l	#$8,d7
	move.l	-$14(a6),d0
	asr.l	#$8,d0
	move.l	d0,-(a7)
	jsr	$5172(a5)	; -> Math_CosDeg
	moveq	#$B,d1
	move.l	d0,d5
	asr.l	d1,d5
	move.l	-$14(a6),d0
	asr.l	#$8,d0
	move.l	d0,-(a7)
	jsr	$517A(a5)	; -> Math_SinDeg
	neg.l	d0
	moveq	#$B,d1
	move.l	d0,d6
	asr.l	d1,d6
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	($7800).w
	tst.b	-$35CA(a5)
	seq.b	d3
	neg.b	d3
	ext.w	d3
	ext.l	d3
	move.l	d3,-(a7)
	ext.l	d7
	ext.l	d6
	move.l	d7,d1
	sub.l	d6,d1
	move.l	d1,-(a7)
	ext.l	d4
	ext.l	d5
	move.l	d4,d1
	sub.l	d5,d1
	move.l	d1,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	jsr	$3FC2(a5)	; -> sub_15CECC
	tst.b	d0
	lea.l	$20(a7),a7
	beq.s	loc_1597A0
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	moveq	#$0,d0
	addq.w	#$4,a7
	bra.s	loc_1597B4
loc_1597A0:
	moveq	#$78,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$78,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
loc_1597B2:
	move.l	a4,d0
loc_1597B4:
	movem.l	-$36(a6),d3-d7/a4
	unlk	a6
	rts
