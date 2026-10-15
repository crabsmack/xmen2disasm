; ---------------------------------------------------------------------------
; BeamScooter_NopStatic - empty non-virtual helper (called from BEAMSCOOTER's ClassInit/Nop6A)
; In:  none
; Out: none
; Evidence: body is link/unlk/rts; callers are BEAMSCOOTER slot +$6A and +$5E
; ---------------------------------------------------------------------------
BeamScooter_NopStatic:
	link.w	a6,#$0
	unlk	a6
	rts
