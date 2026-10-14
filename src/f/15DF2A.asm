; ---------------------------------------------------------------------------
; sub_15DF2A	[jt 2056]
; ---------------------------------------------------------------------------
sub_15DF2A:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$C(a6),a3
	jsr	sub_15DEEE(pc)
	movea.l	d0,a4
	move.l	a4,d0
	beq.s	loc_15DF5A
	tst.l	(a3)
	beq.s	loc_15DF4A
	movea.l	(a3),a0
	move.l	a4,$4(a0)
loc_15DF4A:
	move.l	(a3),(a4)
	moveq	#$0,d0
	move.l	d0,$4(a4)
	move.l	a4,(a3)
	move.l	$8(a6),$8(a4)
loc_15DF5A:
	move.l	a4,d0
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
