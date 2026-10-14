; ---------------------------------------------------------------------------
; sub_05ACAE	[link-after-rts]
; ---------------------------------------------------------------------------
sub_05ACAE:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	lea.l	$C32(a5),a0
	movea.l	$2(a0),a3
	addq.w	#$4,a3
	lea.l	-$3920(a5),a4
	moveq	#$0,d7
	moveq	#$10,d3
loc_05ACC8:
	move.w	(a3)+,(a4)+
	move.l	d7,d0
	addq.l	#$1,d7
	cmp.l	d7,d3
	bgt.s	loc_05ACC8
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
