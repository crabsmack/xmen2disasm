; ---------------------------------------------------------------------------
; CoreZap_GetSize - return sizeof(COREZAP object) = $8C bytes (class slot 0, +$06)
; In:  none
; Out: d0 = $8C
; Evidence: method 0 of class descriptor $0ECA12 (name string "COREZAP", parent ACTOR)
; ---------------------------------------------------------------------------
CoreZap_GetSize:
	link.w	a6,#$0
	move.l	#$8C,d0
	unlk	a6
	rts
