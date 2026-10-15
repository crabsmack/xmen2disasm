; ---------------------------------------------------------------------------
; XPlayer_SteerFacing - set horizontal acceleration and max speed toward a side and face that way (air steering)
; In:  8(a6) = player, $C(a6) = word max speed (+$22), $10(a6) = word acceleration, $14(a6) = byte 1 right / 0 left
; Out: none
; Evidence: +$1E = +/-accel, +$2E bit 4 = facing left, cancels velocity pointing the other way; used by XPlayer_AirSteer and XPlayer_StateDoubleJump
; ---------------------------------------------------------------------------
XPlayer_SteerFacing:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	move.b	$17(a6),d6
	move.w	$12(a6),d7
	movea.l	$8(a6),a4
	tst.b	d6
	beq.s	loc_1F1390
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_1F1396
loc_1F1390:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_1F1396:
	move.w	d0,$1E(a4)
	move.w	$E(a6),$22(a4)
	tst.b	d6
	beq.s	loc_1F13B6
	andi.b	#$EF,$2E(a4)
	tst.w	$16(a4)
	bge.s	loc_1F13C6
	clr.w	$16(a4)
	bra.s	loc_1F13C6
loc_1F13B6:
	ori.b	#$10,$2E(a4)
	tst.w	$16(a4)
	ble.s	loc_1F13C6
	clr.w	$16(a4)
loc_1F13C6:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
