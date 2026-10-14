; ---------------------------------------------------------------------------
; sub_0AB75A	[jt 864]
; ---------------------------------------------------------------------------
sub_0AB75A:
	link.w	a6,#$FFF0
	move.l	a4,-(a7)
	move.w	$12(a6),-$A(a6)
	move.w	$16(a6),-$8(a6)
	clr.l	-$6(a6)
	move.w	$1A(a6),-$2(a6)
	pea.l	-$10(a6)
	move.l	$C(a6),-(a7)
	move.l	$8(a6),-(a7)
	lea.l	$1B12(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$1B12(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a4
	move.l	a4,d0
	movea.l	-$14(a6),a4
	unlk	a6
	rts
