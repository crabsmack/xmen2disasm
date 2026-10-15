; ---------------------------------------------------------------------------
; Platform1_StateStart - Platform1 first state: bind its floor segment (+$8C) and enter the mode's state (Shuttle, Ride or Switched)
; In:  8(a6) = this
; Out: d0
; Evidence: segment record $FFCE2E + (+$7A)*$14; set as +$5C/+$64 by Platform1_Init
; ---------------------------------------------------------------------------
Platform1_StateStart:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.b	$7A(a4),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_Segs(a5),a0
	lea.l	(a0,d0.w),a3
	move.l	a3,d0
	beq.s	loc_107286
	move.l	a3,$8C(a4)
	move.b	$42(a4),$2(a3)
loc_107286:
	moveq	#$3,d0
	and.w	$90(a4),d0
	beq.s	loc_107298
	subq.w	#$1,d0
	beq.s	loc_1072B2
	subq.w	#$1,d0
	beq.s	loc_1072C6
	bra.s	loc_1072DE
loc_107298:
	move.w	$94(a4),$16(a4)
	clr.w	$6C(a4)
	lea.l	Platform1_StateShuttle(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1072DE
loc_1072B2:
	clr.w	$6C(a4)
	lea.l	Platform1_StateRide(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1072DE
loc_1072C6:
	move.w	$94(a4),$92(a4)
	clr.w	$6C(a4)
	lea.l	Platform1_StateSwitched(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1072DE:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
