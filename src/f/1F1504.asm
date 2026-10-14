; ---------------------------------------------------------------------------
; sub_1F1504	[jt 2426]
; ---------------------------------------------------------------------------
sub_1F1504:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$76(a4),a3
	move.l	a3,d0
	beq.s	loc_1F1530
	move.l	a3,$94(a4)
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	d0,$98(a4)
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	d0,$9A(a4)
loc_1F1530:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
