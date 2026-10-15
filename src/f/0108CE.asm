; ---------------------------------------------------------------------------
; BigAcolyte_SetTargetY - start moving a BIGACOLYTE vertically towards y (accel +/-$60), or mark it arrived
; In:  8(a6) = this, $C(a6) = word target y px
; Out: none
; Evidence: +$A2 target, +$20 vertical accel, +$A7 arrived flag (+$6E = 9 when already there); +$A8 cleared
; ---------------------------------------------------------------------------
BigAcolyte_SetTargetY:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	move.w	$E(a6),d7
	movea.l	$8(a6),a4
	move.l	$C(a4),d6
	asr.l	#$8,d6
	clr.b	$A8(a4)
	cmp.w	d6,d7
	beq.s	loc_010908
	move.w	d7,$A2(a4)
	clr.b	$A7(a4)
	cmp.w	d6,d7
	ble.s	loc_010900
	move.w	#$60,$20(a4)
	bra.s	loc_010914
loc_010900:
	move.w	#$FFA0,$20(a4)
	bra.s	loc_010914
loc_010908:
	move.b	#$1,$A7(a4)
	move.w	#$9,$6E(a4)
loc_010914:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
