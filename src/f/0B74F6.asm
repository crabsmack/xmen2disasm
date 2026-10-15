; ---------------------------------------------------------------------------
; ChildShip_StateKnockbackSlow - CHILDSHIP state: decelerate until the knockback stops or the timer runs out
; In:  8(a6) = this
; Out: d0
; Evidence: next ChildShip_StateReturnY; TAS 33417-33423
; Found: link-after-rts
; ---------------------------------------------------------------------------
ChildShip_StateKnockbackSlow:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.b	$90(a4),d0
	tst.l	d0
	bls.s	loc_0B753A
	tst.w	$16(a4)
	ble.s	loc_0B7516
	tst.w	$1E(a4)
	bgt.s	loc_0B753A
loc_0B7516:
	tst.w	$16(a4)
	bge.s	loc_0B7522
	tst.w	$1E(a4)
	blt.s	loc_0B753A
loc_0B7522:
	tst.w	$18(a4)
	ble.s	loc_0B752E
	tst.w	$20(a4)
	bgt.s	loc_0B753A
loc_0B752E:
	tst.w	$18(a4)
	bge.s	loc_0B7552
	tst.w	$20(a4)
	bge.s	loc_0B7552
loc_0B753A:
	clr.l	$1E(a4)
	clr.w	$6C(a4)
	lea.l	ChildShip_StateReturnY(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0B7574
loc_0B7552:
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_0B755C
	moveq	#$2,d0
	bra.s	loc_0B755E
loc_0B755C:
	moveq	#$1,d0
loc_0B755E:
	sub.b	d0,$90(a4)
	clr.w	$6C(a4)
	lea.l	ChildShip_StateKnockbackSlow(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0B7574:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
