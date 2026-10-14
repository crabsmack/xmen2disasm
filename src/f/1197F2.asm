; ---------------------------------------------------------------------------
; sub_1197F2	[jt 1494]
; ---------------------------------------------------------------------------
sub_1197F2:
	link.w	a6,#$FFFC
	movem.l	d3/d5-d7/a3-a4,-(a7)
	move.b	$13(a6),d5
	movea.l	$8(a6),a0
	move.l	a0,-$4(a6)
	movea.l	$6(a0),a1
	jsr	(a1)
	move.w	d0,d6
	tst.l	-$1CA2(a5)
	bne.s	loc_119844
	pea.l	$119892(pc)
	move.w	d6,d0
	ext.l	d0
	asl.l	#$2,d0
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> sub_1FA8DC
	move.l	d0,-$1CA2(a5)
	clr.w	d7
	movea.l	-$1CA2(a5),a4
	moveq	#$4,d3
	addq.w	#$8,a7
	bra.s	loc_119840
loc_119834:
	movea.l	a4,a3
	clr.b	$38(a3)
	move.w	d7,d0
	addq.w	#$1,d7
	adda.w	d6,a4
loc_119840:
	cmp.w	d7,d3
	bgt.s	loc_119834
loc_119844:
	clr.w	d7
	movea.l	-$1CA2(a5),a4
	bra.s	loc_119880
loc_11984C:
	movea.l	a4,a3
	moveq	#$0,d0
	move.b	$38(a3),d0
	moveq	#$1,d1
	and.b	d0,d1
	bne.s	loc_11987A
	move.l	-$4(a6),(a3)
	moveq	#$0,d0
	move.b	d5,d0
	move.l	d0,-(a7)
	move.l	$C(a6),-(a7)
	move.l	a3,-(a7)
	movea.l	(a3),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	move.l	a3,d0
	lea.l	$C(a7),a7
	bra.s	loc_119888
loc_11987A:
	move.w	d7,d0
	addq.w	#$1,d7
	adda.w	d6,a4
loc_119880:
	cmpi.w	#$4,d7
	blt.s	loc_11984C
	moveq	#$0,d0
loc_119888:
	movem.l	-$1C(a6),d3/d5-d7/a3-a4
	unlk	a6
	rts
