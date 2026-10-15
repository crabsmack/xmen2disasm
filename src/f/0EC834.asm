; ---------------------------------------------------------------------------
; CoreElevator_ClassInit - does nothing: only calls the empty CoreElevator_EmptyStub (this class's override of: per-class hook run at level start before the spawn pass (static, class slot 22, +$5E; ClassList_InitAll))
; In:  8(a6) = 0  $C(a6) = class index in the level class list
; Out: none
; Evidence: method 22 of class descriptor $0EC98E (name string "COREELEVATOR", parent ACTOR)
; ---------------------------------------------------------------------------
CoreElevator_ClassInit:
	link.w	a6,#$0
	jsr	CoreElevator_EmptyStub(pc)
	unlk	a6
	rts
