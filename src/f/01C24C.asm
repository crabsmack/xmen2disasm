; ---------------------------------------------------------------------------
; sub_01C24C	[jt 132]
; ---------------------------------------------------------------------------
sub_01C24C:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$B4(a4),d0
	btst	#$0,d0
	beq.s	loc_01C264
	moveq	#$0,d0
	bra.s	loc_01C27A
loc_01C264:
	move.l	a4,-(a7)
	lea.l	$47A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$42(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_01C27A:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
