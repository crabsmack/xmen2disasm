; ---------------------------------------------------------------------------
; FloatBubbleExplode_GetSize - vtable +$06: return sizeof(FLOATBUBBLEEXPLODE) = $90 bytes
; In:  none
; Out: d0 = $90
; Evidence: slot +$6 of the FLOATBUBBLEEXPLODE descriptor $0AC1B8; never runs in the corpus
; ---------------------------------------------------------------------------
FloatBubbleExplode_GetSize:
	link.w	a6,#$0
	move.l	#$90,d0
	unlk	a6
	rts
