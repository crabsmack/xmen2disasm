; ---------------------------------------------------------------------------
; CoreElevator_Reset - does nothing: only calls the empty CoreElevator_EmptyStub (this class's override of: per-class reset hook (class slot 25, +$6A); some Inits call it on this, some LevelInit hooks share its body)
; In:  8(a6) = this (0 when reached from ClassInit)
; Out: none
; Evidence: method 25 of class descriptor $0EC98E (name string "COREELEVATOR", parent ACTOR)
; ---------------------------------------------------------------------------
CoreElevator_Reset:
	link.w	a6,#$0
	jsr	CoreElevator_EmptyStub(pc)
	unlk	a6
	rts
