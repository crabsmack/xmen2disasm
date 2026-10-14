; ---------------------------------------------------------------------------
; sub_133B74	[jt 1726]
; ---------------------------------------------------------------------------
sub_133B74:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$3622(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	lea.l	sub_133BB2(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
