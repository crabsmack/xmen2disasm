; ---------------------------------------------------------------------------
; sub_0BE7E8	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0BE7E8:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a3
	lea.l	$90(a3),a4
	bra.s	loc_0BE802
loc_0BE7FA:
	moveq	#$0,d0
	move.l	d0,(a4)
	lea.l	$A(a4),a4
loc_0BE802:
	lea.l	$B8(a3),a0
	cmpa.l	a4,a0
	bhi.s	loc_0BE7FA
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
