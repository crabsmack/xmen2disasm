; ---------------------------------------------------------------------------
; Teleporter_Nop6A - vtable +$6A: empty hook for TELEPORTER
; In:  8(a6) = this
; Out: none
; Evidence: slot +$6A of the TELEPORTER descriptor $085380; never runs in the corpus
; ---------------------------------------------------------------------------
Teleporter_Nop6A:
	link.w	a6,#$0
	unlk	a6
	rts
