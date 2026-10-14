; ---------------------------------------------------------------------------
; sub_05C1B2	[link-after-rts]
; ---------------------------------------------------------------------------
sub_05C1B2:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$C(a6),a4
	moveq	#$0,d3
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_05C1E8
	movea.l	$8(a6),a0
	move.l	$76(a4),d0
	cmp.l	$94(a0),d0
	bne.s	loc_05C1E8
	moveq	#$1,d3
loc_05C1E8:
	move.b	d3,d0
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
