; ---------------------------------------------------------------------------
; LineSegKiller_Draw - LineSegKiller: position/draw the object's sprite relative to the camera (class slot 5, +$1A)
; In:  8(a6) = this
; Out: none
; Evidence: method 5 of class descriptor $1389CA (name string "LINESEGKILLER", parent ACTOR)
; ---------------------------------------------------------------------------
LineSegKiller_Draw:
	link.w	a6,#$0
	unlk	a6
	rts
