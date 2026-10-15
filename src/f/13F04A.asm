; ---------------------------------------------------------------------------
; Pop_GetSize - return sizeof(POP object) = $8E bytes (class slot 0, +$06)
; In:  none
; Out: d0 = $8E
; Evidence: method 0 of class descriptor $13F28A (name string "POP", parent ACTOR)
; ---------------------------------------------------------------------------
Pop_GetSize:
	link.w	a6,#$0
	move.l	#$8E,d0
	unlk	a6
	rts
