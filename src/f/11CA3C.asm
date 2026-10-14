; ---------------------------------------------------------------------------
; sub_11CA3C	[jt 1578]
; ---------------------------------------------------------------------------
sub_11CA3C:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	tst.l	$98(a4)
	bne.s	loc_11CA66
	move.l	$64(a4),$5C(a4)
	move.w	#$1E,$6C(a4)
	bra.s	loc_11CA94
loc_11CA66:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_11CA7A
	clr.w	$96(a4)
loc_11CA7A:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$1E,$6C(a4)
loc_11CA94:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
