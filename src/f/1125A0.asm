; ---------------------------------------------------------------------------
; Deathbird_Reset - does nothing: calls the four empty Deathbird_EmptyStub1-4 (class slot 25, +$6A Reset; Deathbird_Init calls it on this)
; In:  8(a6) = this
; Out: none
; Evidence: all four stubs are link/unlk/rts; method 25 of class descriptor $111162 (name string "DEATHBIRD", parent ACTOR)
; ---------------------------------------------------------------------------
Deathbird_Reset:
	link.w	a6,#$0
	jsr	Deathbird_EmptyStub1(pc)
	jsr	Deathbird_EmptyStub2(pc)
	jsr	Deathbird_EmptyStub3(pc)
	jsr	Deathbird_EmptyStub4(pc)
	unlk	a6
	rts
