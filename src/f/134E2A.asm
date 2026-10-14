; ---------------------------------------------------------------------------
; sub_134E2A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_134E2A:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$8E(a4)
	bne.s	loc_134E46
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_134E62
loc_134E46:
	clr.w	$8C(a4)
	movea.l	$8E(a4),a0
	addq.l	#$2,a0
	move.w	$8C(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_134E62:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
