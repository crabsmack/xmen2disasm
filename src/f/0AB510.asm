; ---------------------------------------------------------------------------
; FloatBubble_GetSize - vtable +$06: return sizeof(FLOATBUBBLE) = $AA bytes
; In:  none
; Out: d0 = $AA
; Evidence: slot +$6 of the FLOATBUBBLE descriptor $0AB496; never runs in the corpus
; ---------------------------------------------------------------------------
FloatBubble_GetSize:
	link.w	a6,#$0
	move.l	#$AA,d0
	unlk	a6
	rts
