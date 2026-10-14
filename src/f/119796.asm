; ---------------------------------------------------------------------------
; sub_119796	[jt 1491]
; ---------------------------------------------------------------------------
sub_119796:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	move.w	$E(a6),d6
	movea.l	$8(a6),a4
	move.w	d6,$4(a4)
	clr.w	d7
	bra.s	loc_1197BC
loc_1197AE:
	ext.l	d7
	move.l	d7,d0
	add.l	d0,d0
	clr.w	$6(a4,d0.l)
	move.w	d7,d0
	addq.w	#$1,d7
loc_1197BC:
	cmp.w	d7,d6
	bgt.s	loc_1197AE
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
