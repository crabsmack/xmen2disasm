; ---------------------------------------------------------------------------
; Deathbird_Reset - Deathbird: per-class reset hook (class slot 25, +$6A); some Inits call it on this, some LevelInit hooks share its body
; In:  8(a6) = this (0 when reached from LevelInit)
; Out: none
; Evidence: method 25 of class descriptor $111162 (name string "DEATHBIRD", parent ACTOR)
; ---------------------------------------------------------------------------
Deathbird_Reset:
	link.w	a6,#$0
	jsr	sub_1111E2(pc)
	jsr	sub_111588(pc)
	jsr	sub_111790(pc)
	jsr	sub_111798(pc)
	unlk	a6
	rts
