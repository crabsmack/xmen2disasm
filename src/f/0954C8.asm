; ---------------------------------------------------------------------------
; XClone_Deactivate - vtable +$46: kill the attached child object (+$9C), then the parent Deactivate
; ---------------------------------------------------------------------------
XClone_Deactivate:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$9C(a4)
	beq.s	loc_0954EE
	movea.l	$9C(a4),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	moveq	#$0,d0
	move.l	d0,$9C(a4)
	addq.w	#$4,a7
loc_0954EE:
	move.l	a4,-(a7)
	lea.l	$1902(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$46(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
