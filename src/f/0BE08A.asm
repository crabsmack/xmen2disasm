; ---------------------------------------------------------------------------
; sub_0BE08A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0BE08A:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$A0(a4),d0
	ext.l	d0
	move.l	$C(a4),d1
	asr.l	#$8,d1
	sub.l	d1,d0
	moveq	#$A,d1
	cmp.l	d0,d1
	ble.s	loc_0BE0BA
	clr.w	$6C(a4)
	lea.l	sub_0BE0C2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BE0BA:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
