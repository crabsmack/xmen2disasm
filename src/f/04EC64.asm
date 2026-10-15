; ---------------------------------------------------------------------------
; BeamScooter_Nop6A - vtable +$6A: empty hook for BEAMSCOOTER (only calls BeamScooter_NopStatic)
; In:  8(a6) = this (BEAMSCOOTER object)
; Out: none
; Evidence: class descriptor BEAMSCOOTER slot +$6A (tools/classes.py); not reached by the TAS
; ---------------------------------------------------------------------------
BeamScooter_Nop6A:
	link.w	a6,#$0
	jsr	BeamScooter_NopStatic(pc)
	unlk	a6
	rts
