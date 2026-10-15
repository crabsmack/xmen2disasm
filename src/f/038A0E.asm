; ---------------------------------------------------------------------------
; loc_038A0E	[runtime: executed in tas]
; ---------------------------------------------------------------------------
loc_038A0E:
	move.w	#$E0,-$3962(a5)
	bra.s	loc_038A4C
loc_038A16:
	move.w	#$C0,-$3962(a5)
	bra.s	loc_038A4C
loc_038A1E:
	move.w	#$A0,-$3962(a5)
	bra.s	loc_038A4C
loc_038A26:
	move.w	#$80,-$3962(a5)
	bra.s	loc_038A4C
loc_038A2E:
	move.w	#$A0,-$3962(a5)
	bra.s	loc_038A4C
loc_038A36:
	move.w	#$C0,-$3962(a5)
	bra.s	loc_038A4C
loc_038A3E:
	move.w	#$E0,-$3962(a5)
	bra.s	loc_038A4C
loc_038A46:
	move.w	#$C0,-$3962(a5)
loc_038A4C:
	tst.b	g_PalFadeActive(a5)
	seq.b	d3
	neg.b	d3
	move.b	d3,g_PalBaseDirty(a5)
