; ---------------------------------------------------------------------------
; Mine_GetSize - return sizeof(MINE object) = $92 bytes (class slot 0, +$06)
; In:  none
; Out: d0 = $92
; Evidence: method 0 of class descriptor $13AF1A (name string "MINE", parent ACTOR)
; ---------------------------------------------------------------------------
Mine_GetSize:
	link.w	a6,#$0
	move.l	#$92,d0
	unlk	a6
	rts
