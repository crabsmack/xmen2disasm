; ---------------------------------------------------------------------------
; Deathbird_OutsideActiveWindow - always returns 0: the Deathbird never deactivates when off screen (class slot 15, +$42)
; In:  8(a6) = this
; Out: d0.b = 0
; Evidence: body = moveq #0,d0; method 15 of class descriptor $111162 (name string "DEATHBIRD", parent ACTOR)
; ---------------------------------------------------------------------------
Deathbird_OutsideActiveWindow:
	link.w	a6,#$0
	moveq	#$0,d0
	unlk	a6
	rts
