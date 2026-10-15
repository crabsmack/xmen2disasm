; ---------------------------------------------------------------------------
; BaniMazaA1_FrameHook_PulseColor - BaniMazaA1_FrameHook switch cases: colour 15 = $E0/$C0/$A0/$80...
; In:  none
; Out: none
; Evidence: targets of Sw_0389B6
; ---------------------------------------------------------------------------
BaniMazaA1_FrameHook_PulseColor:
	move.w	#$E0,g_PalBase+$1E(a5)
	bra.s	loc_038A4C
loc_038A16:
	move.w	#$C0,g_PalBase+$1E(a5)
	bra.s	loc_038A4C
loc_038A1E:
	move.w	#$A0,g_PalBase+$1E(a5)
	bra.s	loc_038A4C
loc_038A26:
	move.w	#$80,g_PalBase+$1E(a5)
	bra.s	loc_038A4C
loc_038A2E:
	move.w	#$A0,g_PalBase+$1E(a5)
	bra.s	loc_038A4C
loc_038A36:
	move.w	#$C0,g_PalBase+$1E(a5)
	bra.s	loc_038A4C
loc_038A3E:
	move.w	#$E0,g_PalBase+$1E(a5)
	bra.s	loc_038A4C
loc_038A46:
	move.w	#$C0,g_PalBase+$1E(a5)
loc_038A4C:
	tst.b	g_PalFadeActive(a5)
	seq.b	d3
	neg.b	d3
	move.b	d3,g_PalBaseDirty(a5)
