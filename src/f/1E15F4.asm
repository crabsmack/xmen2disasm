; ---------------------------------------------------------------------------
; Cyclops_ResetBeamFlicker - clear the beam's V-blank sprite-link flicker state
; In:  none
; Out: none
; Evidence: clears word $FFE98E and longs $FFE990/$FFE994 (-$1872/-$1870/-$186C); called by Cyclops_ResetBeams
; ---------------------------------------------------------------------------
Cyclops_ResetBeamFlicker:
	moveq	#$0,d0
	move.w	d0,g_BeamFlickerPending(a5)
	move.l	d0,g_BeamFlickerCur(a5)
	move.l	d0,g_BeamFlickerNew(a5)
	rts
