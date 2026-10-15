; ---------------------------------------------------------------------------
; SentinelDoor_Nop6A - vtable +$6A: empty hook for SENTINELDOOR
; In:  8(a6) = this
; Out: none
; Evidence: slot +$6A of the SENTINELDOOR descriptor $0DE9A0; never runs in the corpus
; ---------------------------------------------------------------------------
SentinelDoor_Nop6A:
	link.w	a6,#$0
	unlk	a6
	rts
