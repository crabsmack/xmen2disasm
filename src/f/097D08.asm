; ---------------------------------------------------------------------------
; sub_097D08	[jt 762]
; ---------------------------------------------------------------------------
sub_097D08:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	sub_097904(pc)
	tst.l	$98(a4)
	addq.w	#$4,a7
	bne.s	loc_097D2C
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_097D58
loc_097D2C:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_097D40
	clr.w	$96(a4)
loc_097D40:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_097D58:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
