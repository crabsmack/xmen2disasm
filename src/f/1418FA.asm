; ---------------------------------------------------------------------------
; sub_1418FA	[jt 1913]
; ---------------------------------------------------------------------------
sub_1418FA:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
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
	moveq	#$1,d0
	cmp.w	$E(a6),d0
	bge.s	loc_141956
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
loc_141956:
	move.l	$8(a4),d7
	asr.l	#$8,d7
	cmp.w	$9A(a4),d7
	bge.s	loc_141978
	move.w	$9A(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	clr.w	$1E(a4)
	clr.w	$16(a4)
	bra.s	loc_141992
loc_141978:
	cmp.w	$9C(a4),d7
	ble.s	loc_141992
	move.w	$9C(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	clr.w	$1E(a4)
	clr.w	$16(a4)
loc_141992:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
