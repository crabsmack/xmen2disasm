; ---------------------------------------------------------------------------
; sub_08270E	[jt 566]
; ---------------------------------------------------------------------------
sub_08270E:
	link.w	a6,#$0
	move.l	a4,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	$8(a6),-(a7)
	lea.l	$11A2(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$11A2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a4
	move.l	a4,d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
