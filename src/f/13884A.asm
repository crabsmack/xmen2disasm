; ---------------------------------------------------------------------------
; LineSegKiller_GetSize - LineSegKiller: return the object size in bytes (class slot 0, +$06)
; In:  none
; Out: d0 = object size in bytes
; Evidence: method 0 of class descriptor $1389CA (name string "LINESEGKILLER", parent ACTOR)
; ---------------------------------------------------------------------------
LineSegKiller_GetSize:
	link.w	a6,#$0
	move.l	#$92,d0
	unlk	a6
	rts
