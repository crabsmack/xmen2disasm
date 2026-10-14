; ---------------------------------------------------------------------------
; sub_09B168	[jt 839]
; ---------------------------------------------------------------------------
sub_09B168:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$96(a4)
	beq.s	loc_09B18E
	movea.l	$96(a4),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	moveq	#$0,d0
	move.l	d0,$96(a4)
	addq.w	#$4,a7
loc_09B18E:
	move.l	a4,-(a7)
	lea.l	$1A7A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
