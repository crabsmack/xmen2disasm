; ---------------------------------------------------------------------------
; sub_160C3E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_160C3E:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$10,d0
	and.w	$4A(a4),d0
	bne.w	loc_160CFC
	moveq	#$8,d0
	and.w	$4A(a4),d0
	bne.s	loc_160C7E
	move.w	$5C(a4),d0
	ext.l	d0
	move.w	$5E(a4),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	tst.w	d7
	bge.s	loc_160C78
	clr.w	d7
	moveq	#$0,d0
	move.l	d0,$18(a4)
loc_160C78:
	move.w	d7,$5C(a4)
	bra.s	loc_160CFC
loc_160C7E:
	moveq	#$2,d0
	and.w	$4A(a4),d0
	bne.s	loc_160CFC
	tst.w	$5C(a4)
	blt.s	loc_160CFC
	move.l	#$98967F,d7
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_160CAE
	move.l	-$174C(a5),d7
loc_160CAE:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_160CDA
	cmp.l	-$183C(a5),d7
	slt.b	d3
	neg.b	d3
	beq.s	loc_160CD4
	move.l	d7,d0
	bra.s	loc_160CD8
loc_160CD4:
	move.l	-$183C(a5),d0
loc_160CD8:
	move.l	d0,d7
loc_160CDA:
	move.l	d7,d5
	asr.l	#$8,d5
	move.w	d5,d6
	sub.w	$32(a4),d6
	move.w	d6,d7
	sub.w	$62(a4),d7
	move.w	$60(a4),d0
	add.w	d0,$5C(a4)
	cmp.w	$5C(a4),d7
	bge.s	loc_160CFC
	move.w	d7,$5C(a4)
loc_160CFC:
	movem.l	-$14(a6),d3/d5-d7/a4
	unlk	a6
	rts
