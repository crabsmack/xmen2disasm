; ---------------------------------------------------------------------------
; HoloBolt_GetSize - return sizeof(HOLOBOLT object) = $8C bytes (class slot 0, +$06)
; In:  none
; Out: d0 = $8C
; Evidence: method 0 of class descriptor $0E83AC (name string "HOLOBOLT", parent ACTOR)
; ---------------------------------------------------------------------------
HoloBolt_GetSize:
	link.w	a6,#$0
	move.l	#$8C,d0
	unlk	a6
	rts
