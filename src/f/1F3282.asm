; ---------------------------------------------------------------------------
; XPlayer_WalkAccel - set walking acceleration and max speed toward a side; face the current velocity
; In:  8(a6) = player, $C(a6) = word max speed, $10(a6) = word acceleration, $14(a6) = byte 1 right / 0 left
; Out: none
; Evidence: +$1E = +/-accel, +$22 = max; +$2E bit 4 from the sign of vx; used by XPlayer_Walk/StateWalk with char +$1C/+$1E
; ---------------------------------------------------------------------------
XPlayer_WalkAccel:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	move.w	$12(a6),d7
	movea.l	$8(a6),a4
	tst.b	$17(a6)
	beq.s	loc_1F329E
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_1F32A4
loc_1F329E:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_1F32A4:
	move.w	d0,$1E(a4)
	move.w	$E(a6),$22(a4)
	tst.w	$16(a4)
	bge.s	loc_1F32BA
	ori.b	#$10,$2E(a4)
loc_1F32BA:
	tst.w	$16(a4)
	ble.s	loc_1F32C6
	andi.b	#$EF,$2E(a4)
loc_1F32C6:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
