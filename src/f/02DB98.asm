; ---------------------------------------------------------------------------
; loc_02DB98
; ---------------------------------------------------------------------------
loc_02DB98:
	moveq	#$A,d0
	cmp.w	$68(a4),d0
	blt.s	loc_02DBB0
	tst.b	$A4(a4)
	bne.s	loc_02DBB0
	lea.l	sub_02D372(pc),a0
	move.l	a0,$5C(a4)
	bra.s	loc_02DBC6
loc_02DBB0:
	moveq	#$14,d0
	cmp.w	$68(a4),d0
	blt.s	loc_02DBC6
	tst.b	$A3(a4)
	bne.s	loc_02DBC6
	lea.l	sub_02D336(pc),a0
	move.l	a0,$5C(a4)
loc_02DBC6:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
