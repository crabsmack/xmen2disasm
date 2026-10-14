; ---------------------------------------------------------------------------
; sub_0EA100	[jt 1256]
; ---------------------------------------------------------------------------
sub_0EA100:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	sub_0E9A5C(pc)
	tst.l	$8E(a4)
	addq.w	#$4,a7
	bne.s	loc_0EA128
	move.l	$64(a4),$5C(a4)
	move.w	#$A,$6C(a4)
	bra.s	loc_0EA156
loc_0EA128:
	addq.w	#$1,$8C(a4)
	movea.l	$8E(a4),a0
	move.w	$8C(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0EA13C
	clr.w	$8C(a4)
loc_0EA13C:
	movea.l	$8E(a4),a0
	addq.l	#$2,a0
	move.w	$8C(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$A,$6C(a4)
loc_0EA156:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
