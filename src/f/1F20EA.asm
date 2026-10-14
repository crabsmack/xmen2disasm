; ---------------------------------------------------------------------------
; sub_1F20EA	[jt 2436]
; ---------------------------------------------------------------------------
sub_1F20EA:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	ori.w	#$4000,$6(a4)
	movea.l	$8C(a4),a0
	movea.l	a0,a1
	adda.w	$42(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	lea.l	sub_1F20D8(pc),a0
	move.l	a0,$5C(a4)
	clr.w	$6C(a4)
	move.w	#$4E20,$6A(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
