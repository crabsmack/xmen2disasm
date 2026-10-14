; ---------------------------------------------------------------------------
; sub_0BE04E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0BE04E:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	cmpi.w	#$4B0,$18(a4)
	ble.s	loc_0BE082
	moveq	#$15,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_0BE08A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BE082:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
