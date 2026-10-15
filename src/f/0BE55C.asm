; ---------------------------------------------------------------------------
; Barbarian_Nop6A - vtable +$6A: empty hook for BARBARIAN
; In:  8(a6) = this
; Out: none
; Evidence: slot +$6A of the BARBARIAN descriptor $0BE74E; TAS frames 27879-32204 (4 frames active)
; ---------------------------------------------------------------------------
Barbarian_Nop6A:
	link.w	a6,#$0
	unlk	a6
	rts
