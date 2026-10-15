; ---------------------------------------------------------------------------
; SpikeBall_GetSize - vtable +$06: return sizeof(SPIKEBALL) = $90 bytes
; In:  none
; Out: d0 = $90
; Evidence: slot +$6 of the SPIKEBALL descriptor $0BF820; never runs in the corpus
; ---------------------------------------------------------------------------
SpikeBall_GetSize:
	link.w	a6,#$0
	move.l	#$90,d0
	unlk	a6
	rts
