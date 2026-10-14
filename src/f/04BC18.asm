; ---------------------------------------------------------------------------
; sub_04BC18	[jt 339]
; ---------------------------------------------------------------------------
sub_04BC18:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.b	#$3,$9F(a4)
	move.b	#$4,$9E(a4)
	tst.l	$A4(a4)
	bne.s	loc_04BC40
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_04BC6C
loc_04BC40:
	addq.w	#$1,$A2(a4)
	movea.l	$A4(a4),a0
	move.w	$A2(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_04BC54
	clr.w	$A2(a4)
loc_04BC54:
	movea.l	$A4(a4),a0
	addq.l	#$2,a0
	move.w	$A2(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_04BC6C:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
