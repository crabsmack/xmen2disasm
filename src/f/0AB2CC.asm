; ---------------------------------------------------------------------------
; sub_0AB2CC	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0AB2CC:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$6E(a4)
	bne.s	loc_0AB304
	move.w	-$38BC(a5),d0
	cmp.w	-$3490(a5),d0
	ble.s	loc_0AB304
	move.w	-$3490(a5),d0
	ext.l	d0
	add.l	#$E0,d0
	move.w	-$38BC(a5),d1
	ext.l	d1
	cmp.l	d1,d0
	ble.s	loc_0AB304
	move.l	a4,-(a7)
	jsr	sub_0AB1EE(pc)
	addq.w	#$4,a7
loc_0AB304:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
