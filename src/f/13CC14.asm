; ---------------------------------------------------------------------------
; Ninja_GetSize - return sizeof(NINJA object) = $A4 bytes (class slot 0, +$06)
; In:  none
; Out: d0 = $A4
; Evidence: method 0 of class descriptor $13D7FE (name string "NINJA", parent BIONPC)
; ---------------------------------------------------------------------------
Ninja_GetSize:
	link.w	a6,#$0
	move.l	#$A4,d0
	unlk	a6
	rts
