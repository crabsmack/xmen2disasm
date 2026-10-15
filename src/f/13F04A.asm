; ---------------------------------------------------------------------------
; Pop_SizeOf - Pop: return the object size in bytes (class slot 0, +$06)
; In:  none
; Out: d0 = object size in bytes
; Evidence: method 0 of class descriptor $13F28A (name string "POP", parent ACTOR)
; ---------------------------------------------------------------------------
Pop_SizeOf:
	link.w	a6,#$0
	move.l	#$8E,d0
	unlk	a6
	rts
