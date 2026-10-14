; ---------------------------------------------------------------------------
; sub_117A70	[jt 1444]
; ---------------------------------------------------------------------------
sub_117A70:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$2DAA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	lea.l	$2CA2(a5),a0
	movea.l	$2(a0),a0
	move.l	a0,$44(a4)
	move.b	$7(a0),$2F(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
