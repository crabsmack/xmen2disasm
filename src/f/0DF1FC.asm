; ---------------------------------------------------------------------------
; SentinelElevator_GetSize - vtable +$06: return sizeof(SENTINELELEVATOR) = $9E bytes
; In:  none
; Out: d0 = $9E
; Evidence: slot +$6 of the SENTINELELEVATOR descriptor $0DF556; never runs in the corpus
; ---------------------------------------------------------------------------
SentinelElevator_GetSize:
	link.w	a6,#$0
	move.l	#$9E,d0
	unlk	a6
	rts
