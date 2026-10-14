; ---------------------------------------------------------------------------
; sub_11C576	[jt 1568]
; ---------------------------------------------------------------------------
sub_11C576:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$A8(a4)
	beq.s	loc_11C59C
	movea.l	$A8(a4),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	moveq	#$0,d0
	move.l	d0,$A8(a4)
	addq.w	#$4,a7
loc_11C59C:
	move.l	a4,-(a7)
	lea.l	$308A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$46(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
