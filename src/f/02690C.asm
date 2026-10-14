; ---------------------------------------------------------------------------
; sub_02690C	[jt 165]
; ---------------------------------------------------------------------------
sub_02690C:
	link.w	a6,#$FFFC
	movem.l	d3-d7/a3-a4,-(a7)
	moveq	#$0,d0
	movea.l	d0,a3
	move.l	#$7FFFFFFF,-$4(a6)
	move.w	$A(a6),d1
	ext.l	d1
	move.l	d1,d6
	lsl.l	#$5,d6
	moveq	#$2,d7
	movea.l	-$34A6(a5),a0
	movea.l	$8(a0),a4
	bra.s	loc_026996
loc_026936:
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_026988
	lea.l	$582(a5),a0
	move.l	(a4),d0
	cmp.l	$2(a0),d0
	bne.s	loc_026988
	tst.w	$8C(a4)
	bne.s	loc_026988
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.l	d6,d5
	sub.l	d0,d5
	tst.l	d5
	sge.b	d3
	neg.b	d3
	beq.s	loc_026976
	move.l	d5,d0
	bra.s	loc_02697A
loc_026976:
	move.l	d5,d0
	neg.l	d0
loc_02697A:
	move.l	d0,d4
	cmp.l	-$4(a6),d4
	bge.s	loc_026988
	move.l	d4,-$4(a6)
	movea.l	a4,a3
loc_026988:
	addq.l	#$1,d7
	movea.l	-$34A6(a5),a0
	move.l	d7,d0
	asl.l	#$2,d0
	movea.l	(a0,d0.l),a4
loc_026996:
	move.w	-$13F2(a5),d0
	ext.l	d0
	cmp.l	d7,d0
	bgt.s	loc_026936
	move.l	a3,d0
	beq.s	loc_0269C4
	movea.l	a3,a4
	pea.l	($DE).w
	jsr	$5222(a5)	; -> sub_1FE5A2
	pea.l	($DE).w
	jsr	$521A(a5)	; -> sub_1FE584
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$6E(a0),a1
	jsr	(a1)
	lea.l	$C(a7),a7
loc_0269C4:
	movem.l	-$20(a6),d3-d7/a3-a4
	unlk	a6
	rts
