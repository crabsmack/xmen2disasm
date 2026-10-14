; ---------------------------------------------------------------------------
; sub_04B654	[link-after-rts]
; ---------------------------------------------------------------------------
sub_04B654:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$C(a4)
	bge.s	loc_04B6DA
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	move.l	#$F600,$8(a4)
	move.l	#$FFFFEC00,$C(a4)
	move.w	#$B4,$8E(a4)
	moveq	#$0,d0
	move.l	d0,$44(a4)
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	tst.l	$A4(a4)
	addq.w	#$8,a7
	bne.s	loc_04B6AE
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_04B6DA
loc_04B6AE:
	addq.w	#$1,$A2(a4)
	movea.l	$A4(a4),a0
	move.w	$A2(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_04B6C2
	clr.w	$A2(a4)
loc_04B6C2:
	movea.l	$A4(a4),a0
	addq.l	#$2,a0
	move.w	$A2(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_04B6DA:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
