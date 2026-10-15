; ---------------------------------------------------------------------------
; Deathbird_Reset - Deathbird: per-class reset hook (class slot 25, +$6A); some Inits call it on this, some LevelInit hooks share its body
; In:  8(a6) = this (0 when reached from ClassInit)
; Out: none
; Evidence: method 25 of class descriptor $111162 (name string "DEATHBIRD", parent ACTOR)
; ---------------------------------------------------------------------------
Deathbird_Reset:
	link.w	a6,#$0
	jsr	Deathbird_EmptyStub1(pc)
	jsr	Deathbird_EmptyStub2(pc)
	jsr	Deathbird_EmptyStub3(pc)
	jsr	Deathbird_EmptyStub4(pc)
	unlk	a6
	rts
