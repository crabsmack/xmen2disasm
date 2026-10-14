; ---------------------------------------------------------------------------
; sub_0EC534	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0EC534:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$C(a6),a4
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0EC568
	movea.l	$8(a6),a0
	move.l	$C(a4),d0
	cmp.l	$C(a0),d0
	ble.s	loc_0EC568
	moveq	#$1,d0
	bra.s	loc_0EC56A
loc_0EC568:
	moveq	#$0,d0
loc_0EC56A:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
