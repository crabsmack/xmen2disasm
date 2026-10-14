; ---------------------------------------------------------------------------
; sub_094752	[jt 687]
; ---------------------------------------------------------------------------
sub_094752:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$8E(a4)
	bne.s	loc_094770
	move.l	$64(a4),$5C(a4)
	move.w	#$3C,$6C(a4)
	bra.s	loc_09479E
loc_094770:
	addq.w	#$1,$8C(a4)
	movea.l	$8E(a4),a0
	move.w	$8C(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_094784
	clr.w	$8C(a4)
loc_094784:
	movea.l	$8E(a4),a0
	addq.l	#$2,a0
	move.w	$8C(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$3C,$6C(a4)
loc_09479E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
