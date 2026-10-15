; ---------------------------------------------------------------------------
; BigAcolyte_ClassInit - BIGACOLYTE vtable +$5E ClassInit: nothing to set up (only calls the empty BigAcolyte_NopStatic)
; In:  8(a6) = this, $C(a6) = class index (both unused)
; Out: none
; Evidence: class descriptor BIGACOLYTE slot +$5E (tools/classes.py); BigAcolyte_NopStatic is link/unlk/rts; TAS frame 11766
; ---------------------------------------------------------------------------
BigAcolyte_ClassInit:
	link.w	a6,#$0
	jsr	BigAcolyte_NopStatic(pc)
	unlk	a6
	rts
