; ---------------------------------------------------------------------------
; sub_1F3CE4	[jt 2466]
; ---------------------------------------------------------------------------
sub_1F3CE4:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$2B92(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	moveq	#$0,d0
	move.l	d0,$BC(a4)
	clr.w	$C0(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
