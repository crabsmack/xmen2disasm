; ---------------------------------------------------------------------------
; sub_0BE594	[jt 1050]
; ---------------------------------------------------------------------------
sub_0BE594:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	move.w	$E(a6),d7
	movea.l	$8(a6),a4
loc_0BE5A4:
	move.w	$16(a4),d0
	ext.l	d0
	add.l	d0,$8(a4)
	move.w	$18(a4),d0
	ext.l	d0
	add.l	d0,$C(a4)
	move.w	$1E(a4),d0
	add.w	d0,$16(a4)
	move.w	$20(a4),d0
	add.w	d0,$18(a4)
	subq.w	#$1,d7
	bne.s	loc_0BE5A4
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
