; ---------------------------------------------------------------------------
; CoreElevator_ClassInit - CoreElevator: per-class hook run at level start before the spawn pass (static, class slot 22, +$5E; sub_1FA7E8)
; In:  8(a6) = 0  $C(a6) = class index in the level class list
; Out: none
; Evidence: method 22 of class descriptor $0EC98E (name string "COREELEVATOR", parent ACTOR)
; ---------------------------------------------------------------------------
CoreElevator_ClassInit:
	link.w	a6,#$0
	jsr	sub_0EC51E(pc)
	unlk	a6
	rts
