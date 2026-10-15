; ---------------------------------------------------------------------------
; Barrier_GetSize - vtable +$06: return sizeof(BARRIER) = $98 bytes
; In:  none
; Out: d0 = $98
; Evidence: slot +$6 of the BARRIER descriptor $0DCAAA; never runs in the corpus
; ---------------------------------------------------------------------------
Barrier_GetSize:
	link.w	a6,#$0
	move.l	#$98,d0
	unlk	a6
	rts
