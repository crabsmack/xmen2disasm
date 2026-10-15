; ---------------------------------------------------------------------------
; Cyclops_DrawBeam_None - Cyclops_DrawBeam exit when no beam is active: clear the flicker request
; In:  none
; Out: none
; Evidence: $FFE993 = 0; $FFE98E = $FF if $FFE98F still set
; ---------------------------------------------------------------------------
Cyclops_DrawBeam_None:
	sf.b	d0
	move.b	d0,g_SprFlickerNew+$3(a5)
	tst.b	g_SprFlickerOn(a5)
	beq.s	loc_1E18F8
	st.b	g_SprFlickerPending(a5)
	bra.s	loc_1E18F8
