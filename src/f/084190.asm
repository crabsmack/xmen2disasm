; ---------------------------------------------------------------------------
; SmallBrood_GetSize - vtable +$06: return sizeof(SMALLBROOD) = $B4 bytes
; In:  none
; Out: d0 = $B4
; Evidence: slot +$6 of the SMALLBROOD descriptor $0840FE; never runs in the corpus
; ---------------------------------------------------------------------------
SmallBrood_GetSize:
	link.w	a6,#$0
	move.l	#$B4,d0
	unlk	a6
	rts
