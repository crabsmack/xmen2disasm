; ---------------------------------------------------------------------------
; SwampFly_GetSize - vtable +$06: return sizeof(SWAMPFLY) = $B4 bytes
; In:  none
; Out: d0 = $B4
; Evidence: slot +$6 of the SWAMPFLY descriptor $0C0CEA; never runs in the corpus
; ---------------------------------------------------------------------------
SwampFly_GetSize:
	link.w	a6,#$0
	move.l	#$B4,d0
	unlk	a6
	rts
