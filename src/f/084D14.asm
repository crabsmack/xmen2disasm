; ---------------------------------------------------------------------------
; sub_084D14	[link-after-rts]
; ---------------------------------------------------------------------------
sub_084D14:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$98(a4)
	bne.s	loc_084D30
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_084D5C
loc_084D30:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_084D44
	clr.w	$96(a4)
loc_084D44:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_084D5C:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
