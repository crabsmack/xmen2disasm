; ---------------------------------------------------------------------------
; CapedAcolyte_ClassInit - vtable +$5E: per-level class setup for CAPEDACOLYTE (load its resources)
; In:  8(a6) = this, $C(a6) = class index
; Out: none
; Evidence: class descriptor CAPEDACOLYTE slot +$5E (tools/classes.py); TAS frames 10312-10312 (1 active)
; ---------------------------------------------------------------------------
CapedAcolyte_ClassInit:
	link.w	a6,#$0
	unlk	a6
	rts
