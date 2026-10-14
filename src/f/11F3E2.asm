; ---------------------------------------------------------------------------
; sub_11F3E2	[jt 1647]
; ---------------------------------------------------------------------------
sub_11F3E2:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.b	$96(a4)
	move.l	$C(a6),$9A(a4)
	moveq	#-$F,d0
	and.w	$98(a4),d0
	moveq	#$E,d1
	and.b	$13(a6),d1
	moveq	#$0,d2
	move.b	d1,d2
	or.w	d0,d2
	move.w	d2,$98(a4)
	move.w	$16(a6),$9E(a4)
	move.w	$1A(a6),$A0(a4)
	lea.l	sub_11EFF2(pc),a0
	move.l	a0,$5C(a4)
	clr.w	$6C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
