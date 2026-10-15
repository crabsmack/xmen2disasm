; ---------------------------------------------------------------------------
; CoreElevator_GetSize - return sizeof(COREELEVATOR object) = $94 bytes (class slot 0, +$06)
; In:  none
; Out: d0 = $94
; Evidence: method 0 of class descriptor $0EC98E (name string "COREELEVATOR", parent ACTOR)
; ---------------------------------------------------------------------------
CoreElevator_GetSize:
	link.w	a6,#$0
	move.l	#$94,d0
	unlk	a6
	rts
