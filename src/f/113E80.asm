; ---------------------------------------------------------------------------
; sub_113E80	[link-after-rts]
; ---------------------------------------------------------------------------
sub_113E80:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.b	$F(a6),d0
	subq.b	#$1,d0
	beq.s	loc_113EA0
	subq.b	#$1,d0
	beq.s	loc_113EAC
	subq.b	#$2,d0
	beq.s	loc_113EB8
	subq.b	#$4,d0
	beq.s	loc_113EC4
	bra.s	loc_113ED0
loc_113EA0:
	movea.l	$8C(a4),a0
	move.b	$3(a0),d0
	ext.w	d0
	bra.s	loc_113ED2
loc_113EAC:
	movea.l	$8C(a4),a0
	move.b	$4(a0),d0
	ext.w	d0
	bra.s	loc_113ED2
loc_113EB8:
	movea.l	$8C(a4),a0
	move.b	$5(a0),d0
	ext.w	d0
	bra.s	loc_113ED2
loc_113EC4:
	movea.l	$8C(a4),a0
	move.b	$6(a0),d0
	ext.w	d0
	bra.s	loc_113ED2
loc_113ED0:
	moveq	#$0,d0
loc_113ED2:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
