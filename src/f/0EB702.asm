; ---------------------------------------------------------------------------
; CoreShields_StateActive - CoreShields main state: fire a CoreZap when the cooldown (+$9A) allows; when all 8 shield bytes (+$92..) are set go to StateAllDown
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: CoreShields_FireZap(this, -$200), cooldown 20; TAS 7858-9082
; ---------------------------------------------------------------------------
CoreShields_StateActive:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$1,d6
	tst.w	$9A(a4)
	bgt.s	loc_0EB748
	move.b	$90(a4),d0
	ext.w	d0
	lea.l	$92(a4),a0
	tst.b	(a0,d0.w)
	beq.s	loc_0EB748
	tst.b	$91(a4)
	bne.s	loc_0EB748
	moveq	#$1,d0
	cmp.w	$6E(a4),d0
	blt.s	loc_0EB748
	move.l	#$FFFFFE00,-(a7)
	move.l	a4,-(a7)
	jsr	CoreShields_FireZap(pc)
	move.w	#$14,$9A(a4)
	addq.w	#$8,a7
loc_0EB748:
	lea.l	$92(a4),a3
	clr.w	d7
	moveq	#$8,d3
loc_0EB750:
	tst.b	(a3)
	bne.s	loc_0EB758
	clr.b	d6
	bra.s	loc_0EB762
loc_0EB758:
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$1,a3
	cmp.w	d7,d3
	bgt.s	loc_0EB750
loc_0EB762:
	tst.b	d6
	beq.s	loc_0EB77A
	clr.w	$6C(a4)
	lea.l	CoreShields_StateAllDown(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0EB78C
loc_0EB77A:
	clr.w	$6C(a4)
	lea.l	CoreShields_StateActive(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0EB78C:
	movem.l	-$14(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
