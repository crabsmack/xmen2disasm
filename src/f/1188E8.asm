; ---------------------------------------------------------------------------
; sub_1188E8	[jt 1478]
; ---------------------------------------------------------------------------
sub_1188E8:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$2E62(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$20(a4)
	clr.l	$8C(a4)
	move.w	#$1000,$90(a4)
	moveq	#$0,d0
	move.l	d0,$92(a4)
	move.l	d0,$96(a4)
	move.l	d0,$9A(a4)
	andi.w	#$BFFF,$4(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
