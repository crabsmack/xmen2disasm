; ---------------------------------------------------------------------------
; sub_0473D4	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0473D4:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	-$3B14(a5),a4
	clr.w	d7
loc_0473E2:
	move.l	a4,-(a7)
	lea.l	$86(a4),a4
	jsr	sub_0472E0(pc)
	addq.w	#$4,a7
	move.w	d7,d0
	addq.w	#$1,d7
	cmpi.w	#$4,d7
	blt.s	loc_0473E2
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
