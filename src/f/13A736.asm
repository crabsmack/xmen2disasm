; ---------------------------------------------------------------------------
; Mine_SizeOf - Mine: return the object size in bytes (class slot 0, +$06)
; In:  none
; Out: d0 = object size in bytes
; Evidence: method 0 of class descriptor $13AF1A (name string "MINE", parent ACTOR)
; ---------------------------------------------------------------------------
Mine_SizeOf:
	link.w	a6,#$0
	move.l	#$92,d0
	unlk	a6
	rts
