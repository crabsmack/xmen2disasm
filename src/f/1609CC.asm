; ---------------------------------------------------------------------------
; sub_1609CC	[jt 2100]
; ---------------------------------------------------------------------------
sub_1609CC:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	sub_16103C(pc),a0
	move.l	a0,$8(a4)
	lea.l	sub_160B0E(pc),a0
	move.l	a0,$10(a4)
	move.w	$E(a6),$3C(a4)
	move.w	$12(a6),$40(a4)
	move.w	$16(a6),$3E(a4)
	move.w	$1A(a6),$42(a4)
	move.w	#$40,$62(a4)
	move.w	#$E0,$64(a4)
	moveq	#$0,d0
	move.l	d0,$24(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
