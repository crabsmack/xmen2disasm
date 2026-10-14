; ---------------------------------------------------------------------------
; sub_134FF2	[link-after-rts]
; ---------------------------------------------------------------------------
sub_134FF2:
	link.w	a6,#$FFFE
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.l	d0,d4
	moveq	#$38,d0
	sub.l	d0,d4
	ext.l	d4
	move.l	d4,d1
	moveq	#$70,d2
	add.l	d2,d1
	move.w	d1,-$2(a6)
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> sub_1F694A
	movea.l	d0,a3
	tst.b	$A7(a4)
	addq.w	#$4,a7
	beq.s	loc_135034
	move.l	$8(a4),d5
	asr.l	#$8,d5
	move.w	d5,d6
	add.w	#$E8,d6
	bra.s	loc_135040
loc_135034:
	move.l	$8(a4),d6
	asr.l	#$8,d6
	move.w	d6,d5
	sub.w	#$E8,d5
loc_135040:
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	bge.s	loc_135052
	ori.b	#$10,$2E(a4)
	bra.s	loc_135058
loc_135052:
	andi.b	#$EF,$2E(a4)
loc_135058:
	moveq	#$0,d7
loc_13505A:
	tst.l	d7
	seq.b	d3
	neg.b	d3
	beq.s	loc_13506A
	lea.l	-$1758(a5),a3
	move.l	a3,d0
	bra.s	loc_135070
loc_13506A:
	lea.l	-$1848(a5),a3
	move.l	a3,d0
loc_135070:
	movea.l	d0,a0
	move.w	$4(a0),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_1350EA
	cmp.w	$52(a3),d5
	bgt.s	loc_1350EA
	cmp.w	$4E(a3),d6
	blt.s	loc_1350EA
	cmp.w	$50(a3),d4
	bgt.s	loc_1350EA
	move.w	-$2(a6),d0
	cmp.w	$4C(a3),d0
	blt.s	loc_1350EA
	tst.l	$8E(a4)
	bne.s	loc_1350BA
	move.l	$64(a4),$5C(a4)
	move.w	#$1E,$6C(a4)
	bra.s	loc_1350F4
loc_1350BA:
	addq.w	#$1,$8C(a4)
	movea.l	$8E(a4),a0
	move.w	$8C(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_1350CE
	clr.w	$8C(a4)
loc_1350CE:
	movea.l	$8E(a4),a0
	addq.l	#$2,a0
	move.w	$8C(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$1E,$6C(a4)
	bra.s	loc_1350F4
loc_1350EA:
	addq.l	#$1,d7
	moveq	#$2,d0
	cmp.l	d7,d0
	bgt.w	loc_13505A
loc_1350F4:
	movem.l	-$1E(a6),d3-d7/a3-a4
	unlk	a6
	rts
