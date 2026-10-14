; ---------------------------------------------------------------------------
; sub_0178C6	[jt 95]
; ---------------------------------------------------------------------------
sub_0178C6:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a3
	lea.l	$94(a3),a4
	move.l	$8(a3),d0
	add.l	#$300,d0
	move.l	d0,(a4)
	move.l	$C(a3),d0
	add.l	#$FFFFE000,d0
	move.l	d0,$4(a4)
	clr.l	$A(a4)
	clr.w	$8(a4)
	ori.w	#$1,$92(a3)
	andi.w	#$FFFD,$92(a3)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
