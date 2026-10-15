; ---------------------------------------------------------------------------
; CoreShields_GetSize - return sizeof(CORESHIELDS object) = $9C bytes (class slot 0, +$06)
; In:  none
; Out: d0 = $9C
; Evidence: method 0 of class descriptor $0EBE7E (name string "CORESHIELDS", parent ACTOR)
; ---------------------------------------------------------------------------
CoreShields_GetSize:
	link.w	a6,#$0
	move.l	#$9C,d0
	unlk	a6
	rts
