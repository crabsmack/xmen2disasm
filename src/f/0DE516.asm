; ---------------------------------------------------------------------------
; SentinelDoor_GetSize - vtable +$06: return sizeof(SENTINELDOOR) = $98 bytes
; In:  none
; Out: d0 = $98
; Evidence: slot +$6 of the SENTINELDOOR descriptor $0DE9A0; never runs in the corpus
; ---------------------------------------------------------------------------
SentinelDoor_GetSize:
	link.w	a6,#$0
	move.l	#$98,d0
	unlk	a6
	rts
