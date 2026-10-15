; ---------------------------------------------------------------------------
; sub_1352D4	[jt 1774]
; ---------------------------------------------------------------------------
sub_1352D4:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> Player_Nearest
	movea.l	d0,a3
	move.l	$8(a4),d0
	cmp.l	$8(a3),d0
	sgt.b	d3
	neg.b	d3
	move.b	d3,d7
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	addq.w	#$4,a7
	bge.s	loc_13530A
	ori.b	#$10,$2E(a4)
	bra.s	loc_135310
loc_13530A:
	andi.b	#$EF,$2E(a4)
loc_135310:
	andi.w	#$FFFC,$B0(a4)
	tst.b	d7
	beq.s	loc_135334
	tst.b	$A7(a4)
	bne.s	loc_13534E
	clr.w	$6C(a4)
	lea.l	sub_1351EA(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_135360
loc_135334:
	tst.b	$A7(a4)
	beq.s	loc_13534E
	clr.w	$6C(a4)
	lea.l	sub_1351EA(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_135360
loc_13534E:
	clr.w	$6C(a4)
	lea.l	sub_1352D4(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_135360:
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
