; ---------------------------------------------------------------------------
; SpikeBall_Nop6A - vtable +$6A: empty hook for SPIKEBALL
; In:  8(a6) = this
; Out: none
; Evidence: slot +$6A of the SPIKEBALL descriptor $0BF820; TAS frames 27879-29685 (2 frames active)
; ---------------------------------------------------------------------------
SpikeBall_Nop6A:
	link.w	a6,#$0
	unlk	a6
	rts
