; ---------------------------------------------------------------------------
; SwampPlatform_Nop6A - vtable +$6A: empty hook for SWAMPPLATFORM
; In:  8(a6) = this
; Out: none
; Evidence: slot +$6A of the SWAMPPLATFORM descriptor $0C005A; never runs in the corpus
; ---------------------------------------------------------------------------
SwampPlatform_Nop6A:
	link.w	a6,#$0
	unlk	a6
	rts
