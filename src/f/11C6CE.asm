; ---------------------------------------------------------------------------
; sub_11C6CE	[link-after-rts]
; ---------------------------------------------------------------------------
sub_11C6CE:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	tst.l	$98(a4)
	bne.s	loc_11C6F8
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_11C714
loc_11C6F8:
	clr.w	$96(a4)
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_11C714:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
