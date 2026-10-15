; ---------------------------------------------------------------------------
; SporeMine_GetSize - vtable +$06: return sizeof(SPOREMINE) = $92 bytes
; In:  none
; Out: d0 = $92
; Evidence: slot +$6 of the SPOREMINE descriptor $0BF580; never runs in the corpus
; ---------------------------------------------------------------------------
SporeMine_GetSize:
	link.w	a6,#$0
	move.l	#$92,d0
	unlk	a6
	rts
