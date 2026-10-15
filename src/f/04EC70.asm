; ---------------------------------------------------------------------------
; BeamScooter_ClassInit - vtable +$5E: per-level class setup for BEAMSCOOTER (load its resources)
; In:  8(a6) = this, $C(a6) = class index
; Out: none
; Evidence: class descriptor BEAMSCOOTER slot +$5E (tools/classes.py); TAS frames 24086-24086 (1 active)
; ---------------------------------------------------------------------------
BeamScooter_ClassInit:
	link.w	a6,#$0
	jsr	BeamScooter_NopStatic(pc)
	unlk	a6
	rts
