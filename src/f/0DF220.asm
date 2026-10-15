; ---------------------------------------------------------------------------
; SentinelElevator_Nop6A - vtable +$6A: empty hook for SENTINELELEVATOR
; In:  8(a6) = this
; Out: none
; Evidence: slot +$6A of the SENTINELELEVATOR descriptor $0DF556; never runs in the corpus
; ---------------------------------------------------------------------------
SentinelElevator_Nop6A:
	link.w	a6,#$0
	unlk	a6
	rts
