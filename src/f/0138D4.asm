; ---------------------------------------------------------------------------
; CapedAcolyte_StateReturnHome - CAPEDACOLYTE: fly back vertically to its home y; when within 4 px stop and end the hurt state
; In:  8(a6) = this
; Out: none
; Evidence: home y +$A0; velocity +$18 = +/-$180; slot +$76 (CapedAcolyte_EndHurt) on arrival
; ---------------------------------------------------------------------------
CapedAcolyte_StateReturnHome:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d7
	asr.l	#$8,d7
	move.l	$A0(a4),d7
	asr.l	#$8,d7
	ext.l	d7
	move.w	$12(a4),d0
	ext.l	d0
	move.l	d7,d1
	sub.l	d0,d1
	sge.b	d3
	neg.b	d3
	beq.s	loc_01390C
	ext.l	d7
	move.w	$12(a4),d0
	ext.l	d0
	move.l	d7,d1
	sub.l	d0,d1
	bra.s	loc_01391A
loc_01390C:
	ext.l	d7
	move.w	$12(a4),d0
	ext.l	d0
	move.l	d7,d1
	sub.l	d0,d1
	neg.l	d1
loc_01391A:
	move.w	d1,d6
	cmpi.w	#$5,d6
	bge.s	loc_013948
	move.w	$12(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$A0(a4)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$76(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.s	loc_013964
loc_013948:
	cmp.w	$12(a4),d7
	slt.b	d3
	neg.b	d3
	beq.s	loc_01395A
	move.l	#$180,d0
	bra.s	loc_013960
loc_01395A:
	move.l	#$FFFFFE80,d0
loc_013960:
	move.w	d0,$18(a4)
loc_013964:
	movem.l	-$10(a6),d3/d6-d7/a4
	unlk	a6
	rts
