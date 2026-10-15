; ---------------------------------------------------------------------------
; XPlayer_Steer - set horizontal acceleration and max speed toward a side without turning the sprite
; In:  8(a6) = player, $C(a6) = word max speed, $10(a6) = word acceleration, $14(a6) = byte 1 right / 0 left
; Out: none
; Evidence: like XPlayer_SteerFacing minus the facing bit; used by XPlayer_StateFloatFall
; ---------------------------------------------------------------------------
XPlayer_Steer:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	move.b	$17(a6),d6
	move.w	$12(a6),d7
	movea.l	$8(a6),a4
	tst.b	d6
	beq.s	loc_1F253E
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_1F2544
loc_1F253E:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_1F2544:
	move.w	d0,$1E(a4)
	move.w	$E(a6),$22(a4)
	tst.b	d6
	beq.s	loc_1F255E
	tst.w	$16(a4)
	bge.s	loc_1F2568
	clr.w	$16(a4)
	bra.s	loc_1F2568
loc_1F255E:
	tst.w	$16(a4)
	ble.s	loc_1F2568
	clr.w	$16(a4)
loc_1F2568:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
