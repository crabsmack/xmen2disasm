; ---------------------------------------------------------------------------
; CoreElevator_CarriesAllPlayers - is every live player standing on this lift's floor segment
; In:  8(a6) = this
; Out: d0 = 1 if so
; Evidence: compares segment $FFCE2E + (+$7A)*$14 with each player's +$76 segment ($FFEB1E, $FFEA2E); used by the Hologram lift states
; ---------------------------------------------------------------------------
CoreElevator_CarriesAllPlayers:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a0
	moveq	#$0,d0
	move.b	$7A(a0),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_Segs(a5),a0
	lea.l	(a0,d0.w),a4
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0EC784
	cmpa.l	g_Player1+$76(a5),a4
	beq.s	loc_0EC784
	moveq	#$0,d0
	bra.s	loc_0EC7A8
loc_0EC784:
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0EC7A6
	cmpa.l	g_Player2+$76(a5),a4
	beq.s	loc_0EC7A6
	moveq	#$0,d0
	bra.s	loc_0EC7A8
loc_0EC7A6:
	moveq	#$1,d0
loc_0EC7A8:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
