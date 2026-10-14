; ---------------------------------------------------------------------------
; sub_0B7986	[jt 936]
; ---------------------------------------------------------------------------
sub_0B7986:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$9A(a4)
	bne.s	loc_0B79A4
	move.l	$64(a4),$5C(a4)
	move.w	#$3C,$6C(a4)
	bra.s	loc_0B79D2
loc_0B79A4:
	addq.w	#$1,$98(a4)
	movea.l	$9A(a4),a0
	move.w	$98(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0B79B8
	clr.w	$98(a4)
loc_0B79B8:
	movea.l	$9A(a4),a0
	addq.l	#$2,a0
	move.w	$98(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$3C,$6C(a4)
loc_0B79D2:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
