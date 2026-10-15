; ---------------------------------------------------------------------------
; Hornet_Reset - HORNET vtable +$6A Reset: does nothing (only calls the empty sub_1364C2, which Hornet_ClassInit also calls)
; In:  8(a6) = this (unused)
; Out: none
; Evidence: method 25 of class descriptor $137252 (HORNET, parent XNPC); sub_1364C2 is link/unlk/rts
; ---------------------------------------------------------------------------
Hornet_Reset:
	link.w	a6,#$0
	jsr	Hornet_NopStatic(pc)
	unlk	a6
	rts
