; ---------------------------------------------------------------------------
; sub_13709E	[jt 1792]
; ---------------------------------------------------------------------------
sub_13709E:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	lea.l	$383A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$4A(a0),a1
	jsr	(a1)
	moveq	#$10,d0
	and.w	$4(a4),d0
	addq.w	#$4,a7
	bne.s	loc_1370E0
	tst.w	$B6(a4)
	beq.s	loc_1370E0
	subq.w	#$1,$B6(a4)
	tst.w	$B6(a4)
	bgt.s	loc_1370E0
	clr.w	$B6(a4)
	ori.w	#$4,$A0(a4)
loc_1370E0:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
