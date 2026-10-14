; ---------------------------------------------------------------------------
; sub_135452	[jt 1775]
; ---------------------------------------------------------------------------
sub_135452:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> sub_1F694A
	movea.l	d0,a3
	move.l	$8(a4),d0
	cmp.l	$8(a3),d0
	sgt.b	d3
	neg.b	d3
	move.b	d3,d7
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	addq.w	#$4,a7
	bge.s	loc_135488
	ori.b	#$10,$2E(a4)
	bra.s	loc_13548E
loc_135488:
	andi.b	#$EF,$2E(a4)
loc_13548E:
	andi.w	#$FFFC,$B0(a4)
	tst.b	d7
	beq.s	loc_1354B2
	tst.b	$A7(a4)
	bne.s	loc_1354CC
	clr.w	$6C(a4)
	lea.l	sub_13536A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1354DE
loc_1354B2:
	tst.b	$A7(a4)
	beq.s	loc_1354CC
	clr.w	$6C(a4)
	lea.l	sub_13536A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1354DE
loc_1354CC:
	clr.w	$6C(a4)
	lea.l	sub_135452(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1354DE:
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
