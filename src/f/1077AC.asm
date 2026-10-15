; ---------------------------------------------------------------------------
; Switch_GetSize - return sizeof(SWITCH object) = $8C bytes (class slot 0, +$06)
; In:  none
; Out: d0 = $8C
; Evidence: method 0 of class descriptor $107A3E (name string "SWITCH", parent ACTOR)
; ---------------------------------------------------------------------------
Switch_GetSize:
	link.w	a6,#$0
	move.l	#$8C,d0
	unlk	a6
	rts
