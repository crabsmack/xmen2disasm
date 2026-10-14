; ---------------------------------------------------------------------------
; sub_0BDE22	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0BDE22:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$9A(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	cmp.l	$8(a4),d0
	ble.s	loc_0BDE5A
	move.w	$9A(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	clr.w	$6C(a4)
	lea.l	sub_0BDE82(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0BDE7A
loc_0BDE5A:
	move.w	$9E(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	cmp.l	$8(a4),d0
	ble.s	loc_0BDE7A
	clr.w	$6C(a4)
	lea.l	sub_0BDEF4(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BDE7A:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
