; ---------------------------------------------------------------------------
; Magneto_AirAttackUp - MAGNETO slot +$BA: Up+B in the air: shoot up / up-left / up-right
; In:  8(a6) = player
; Out: none
; Evidence: +$BC = 6 (Right), 3 (Left), else 5/4 by facing; Magneto_StartAirShot
; ---------------------------------------------------------------------------
Magneto_AirAttackUp:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CE07E
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CE086
loc_1CE07E:
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CE086:
	beq.s	loc_1CE096
	andi.b	#$EF,$2E(a4)
	move.w	#$6,$BC(a4)
	bra.s	loc_1CE0D8
loc_1CE096:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CE0AA
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CE0B2
loc_1CE0AA:
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CE0B2:
	beq.s	loc_1CE0C2
	ori.b	#$10,$2E(a4)
	move.w	#$3,$BC(a4)
	bra.s	loc_1CE0D8
loc_1CE0C2:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_1CE0D2
	move.w	#$5,$BC(a4)
	bra.s	loc_1CE0D8
loc_1CE0D2:
	move.w	#$4,$BC(a4)
loc_1CE0D8:
	lea.l	Magneto_StartAirShot(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Magneto_StartAirShot(pc)
	addq.w	#$4,a7
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
