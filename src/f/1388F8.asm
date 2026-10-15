; ---------------------------------------------------------------------------
; LineSegKiller_Update - empty: returns at once (this class's override of: per-frame update: range checks, Move, run the state function at +$5C after the +$6C delay (class slot 17, +$4A))
; In:  8(a6) = this
; Out: none
; Evidence: method 17 of class descriptor $1389CA (name string "LINESEGKILLER", parent ACTOR)
; ---------------------------------------------------------------------------
LineSegKiller_Update:
	link.w	a6,#$0
	unlk	a6
	rts
