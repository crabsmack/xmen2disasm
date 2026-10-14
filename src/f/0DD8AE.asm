; ---------------------------------------------------------------------------
; sub_0DD8AE	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0DD8AE:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$8C(a3),a4
	move.w	(a4),d0
	btst	#$0,d0
	beq.s	loc_0DD8D8
	clr.w	$6C(a3)
	lea.l	sub_0DD8E2(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$8,d0
	and.w	$4(a3),d0
loc_0DD8D8:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
