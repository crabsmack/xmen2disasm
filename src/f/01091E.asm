; ---------------------------------------------------------------------------
; sub_01091E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_01091E:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	move.w	$E(a6),d7
	movea.l	$8(a6),a4
	move.l	$8(a4),d6
	asr.l	#$8,d6
	clr.b	$A8(a4)
	cmp.w	d6,d7
	beq.s	loc_010958
	move.w	d7,$A4(a4)
	clr.b	$A6(a4)
	cmp.w	d6,d7
	ble.s	loc_010950
	move.w	#$60,$1E(a4)
	bra.s	loc_010964
loc_010950:
	move.w	#$FFA0,$1E(a4)
	bra.s	loc_010964
loc_010958:
	move.b	#$1,$A6(a4)
	move.w	#$9,$6E(a4)
loc_010964:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
