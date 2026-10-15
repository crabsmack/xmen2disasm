; ---------------------------------------------------------------------------
; Cyclops_ResetBeamFlicker - clear the beam's V-blank sprite-link flicker state
; In:  none
; Out: none
; Evidence: clears word $FFE98E and longs $FFE990/$FFE994 (-$1872/-$1870/-$186C); called by Cyclops_ResetBeams
; ---------------------------------------------------------------------------
Cyclops_ResetBeamFlicker:
	moveq	#$0,d0
	move.w	d0,g_SprFlickerPending(a5)
	move.l	d0,g_SprFlickerCur(a5)
	move.l	d0,g_SprFlickerNew(a5)
	rts
