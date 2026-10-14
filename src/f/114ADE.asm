; ---------------------------------------------------------------------------
; sub_114ADE	[jt 1415]
; ---------------------------------------------------------------------------
sub_114ADE:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$2BDA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	moveq	#$0,d0
	move.w	$94(a4),d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	moveq	#$0,d1
	or.w	d0,d1
	move.w	d1,$94(a4)
	ori.w	#$100,$6(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
