; ---------------------------------------------------------------------------
; BigAcolyte_ClassInit - vtable +$5E: per-level class setup for BIGACOLYTE (load its resources)
; In:  8(a6) = this, $C(a6) = class index
; Out: none
; Evidence: class descriptor BIGACOLYTE slot +$5E (tools/classes.py); TAS frames 11766-11766 (1 active)
; ---------------------------------------------------------------------------
BigAcolyte_ClassInit:
	link.w	a6,#$0
	jsr	BigAcolyte_NopStatic(pc)
	unlk	a6
	rts
