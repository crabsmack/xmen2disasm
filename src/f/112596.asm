; ---------------------------------------------------------------------------
; Deathbird_OutsideActiveWindow - Deathbird: is the active object out of range and due to deactivate (class slot 15, +$42)
; In:  8(a6) = this
; Out: d0.b = 1 to deactivate
; Evidence: method 15 of class descriptor $111162 (name string "DEATHBIRD", parent ACTOR)
; ---------------------------------------------------------------------------
Deathbird_OutsideActiveWindow:
	link.w	a6,#$0
	moveq	#$0,d0
	unlk	a6
	rts
