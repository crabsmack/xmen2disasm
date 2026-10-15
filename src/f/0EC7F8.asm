; ---------------------------------------------------------------------------
; CoreElevator_Reset - CoreElevator: per-class reset hook (class slot 25, +$6A); some Inits call it on this, some LevelInit hooks share its body
; In:  8(a6) = this (0 when reached from LevelInit)
; Out: none
; Evidence: method 25 of class descriptor $0EC98E (name string "COREELEVATOR", parent ACTOR)
; ---------------------------------------------------------------------------
CoreElevator_Reset:
	link.w	a6,#$0
	jsr	sub_0EC51E(pc)
	unlk	a6
	rts
