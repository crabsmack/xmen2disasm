; ---------------------------------------------------------------------------
; Cyclops_ResetBeamFlicker - clear the beam's V-blank sprite-link flicker state
; In:  none
; Out: none
; Evidence: clears word $FFE98E and longs $FFE990/$FFE994 (-$1872/-$1870/-$186C); called by Cyclops_ResetBeams
; ---------------------------------------------------------------------------
Cyclops_ResetBeamFlicker:
	moveq	#$0,d0
	move.w	d0,-$1872(a5)
	move.l	d0,-$186C(a5)
	move.l	d0,-$1870(a5)
	rts
