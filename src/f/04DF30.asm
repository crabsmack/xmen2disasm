; ---------------------------------------------------------------------------
; ApocBomb_Nop6A - vtable +$6A: empty hook for APOCBOMB (only calls ApocBomb_NopStatic)
; In:  8(a6) = this
; Out: none
; Evidence: class descriptor APOCBOMB slot +$6A; jt 363
; ---------------------------------------------------------------------------
ApocBomb_Nop6A:
	link.w	a6,#$0
	jsr	ApocBomb_NopStatic(pc)
	unlk	a6
	rts
