; ---------------------------------------------------------------------------
; Ninja_Reset - Ninja: per-class reset hook (class slot 25, +$6A); some Inits call it on this, some LevelInit hooks share its body
; In:  8(a6) = this (0 when reached from LevelInit)
; Out: none
; Evidence: method 25 of class descriptor $13D7FE (name string "NINJA", parent BIONPC)
; ---------------------------------------------------------------------------
Ninja_Reset:
	link.w	a6,#$0
	jsr	sub_13D7F6(pc)
	unlk	a6
	rts
