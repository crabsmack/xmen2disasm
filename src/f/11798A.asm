; ---------------------------------------------------------------------------
; sub_11798A	[jt 1439]
; ---------------------------------------------------------------------------
sub_11798A:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$C(a6),a4
	move.l	a4,-(a7)
	move.l	$8(a6),-(a7)
	lea.l	$2D9A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$6E(a0),a1
	jsr	(a1)
	moveq	#$3,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$6E(a0),a1
	jsr	(a1)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
