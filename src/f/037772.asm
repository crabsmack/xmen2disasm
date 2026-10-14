; ---------------------------------------------------------------------------
; sub_037772	[link-after-rts]
; ---------------------------------------------------------------------------
sub_037772:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d0
	asr.l	#$8,d0
	sub.l	#$7C0,d0
	move.l	$C(a4),d1
	asr.l	#$8,d1
	sub.l	#$100,d1
	add.l	d0,d1
	moveq	#$10,d0
	cmp.l	d1,d0
	ble.s	loc_0377CE
	andi.b	#$F3,$9B(a4)
	ori.b	#$2,$9B(a4)
	move.w	#$7A0,$A6(a4)
	move.w	#$864,$A8(a4)
	lea.l	sub_0377D6(pc),a0
	move.l	a0,$90(a4)
	clr.w	$6C(a4)
	lea.l	sub_0377D6(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0377CE:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
