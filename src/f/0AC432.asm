; ---------------------------------------------------------------------------
; PerimeterDoor_GetSize - vtable +$06: return sizeof(PERIMETERDOOR) = $92 bytes
; In:  none
; Out: d0 = $92
; Evidence: slot +$6 of the PERIMETERDOOR descriptor $0AC3B2; never runs in the corpus
; ---------------------------------------------------------------------------
PerimeterDoor_GetSize:
	link.w	a6,#$0
	move.l	#$92,d0
	unlk	a6
	rts
