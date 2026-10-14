; ---------------------------------------------------------------------------
; sub_1597BE	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1597BE:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$10(a6),a3
	movea.l	$C(a6),a4
	move.b	$B(a6),d7
	move.b	d7,d0
	subq.b	#$2,d0
	beq.s	loc_1597DE
	subq.b	#$5,d0
	beq.s	loc_1597F2
	bra.s	loc_159802
loc_1597DE:
	move.w	#$FFB4,(a4)
	move.w	#$2C,(a3)
	movea.l	$14(a6),a0
	move.l	#$B400,(a0)
	bra.s	loc_159802
loc_1597F2:
	move.w	#$4C,(a4)
	move.w	#$2C,(a3)
	movea.l	$14(a6),a0
	moveq	#$0,d0
	move.l	d0,(a0)
loc_159802:
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
