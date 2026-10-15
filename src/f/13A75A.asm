; ---------------------------------------------------------------------------
; Mine_Nop6A - Mine: no-op override of virtual slot 25 (+$6A)
; In:  none (unused)
; Out: none
; Evidence: method 25 of class descriptor $13AF1A (name string "MINE", parent ACTOR)
; ---------------------------------------------------------------------------
Mine_Nop6A:
	link.w	a6,#$0
	unlk	a6
	rts
