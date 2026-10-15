; ---------------------------------------------------------------------------
; Deathbird_GetSize - return sizeof(DEATHBIRD object) = $B6 bytes (class slot 0, +$06)
; In:  none
; Out: d0 = $B6
; Evidence: method 0 of class descriptor $111162 (name string "DEATHBIRD", parent ACTOR)
; ---------------------------------------------------------------------------
Deathbird_GetSize:
	link.w	a6,#$0
	move.l	#$B6,d0
	unlk	a6
	rts
