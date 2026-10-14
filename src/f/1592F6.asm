; ---------------------------------------------------------------------------
; sub_1592F6	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1592F6:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$10(a6),a3
	movea.l	$C(a6),a4
	move.b	$B(a6),d7
	move.b	d7,d0
	subq.b	#$2,d0
	beq.s	loc_159316
	subq.b	#$5,d0
	beq.s	loc_159332
	bra.s	loc_15934A
loc_159316:
	move.w	#$FFA7,(a4)
	move.w	#$2E,(a3)
	movea.l	$14(a6),a0
	move.l	#$B400,(a0)
	movea.l	$18(a6),a0
	move.b	#$9,(a0)
	bra.s	loc_15934A
loc_159332:
	move.w	#$59,(a4)
	move.w	#$2E,(a3)
	movea.l	$14(a6),a0
	moveq	#$0,d0
	move.l	d0,(a0)
	movea.l	$18(a6),a0
	move.b	#$A,(a0)
loc_15934A:
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
