; ---------------------------------------------------------------------------
; CoreShields_ClassInit - CoreShields: per-class hook run at level start before the spawn pass (static, class slot 22, +$5E; ClassList_InitAll)
; In:  8(a6) = 0  $C(a6) = class index in the level class list
; Out: none
; Evidence: method 22 of class descriptor $0EBE7E (name string "CORESHIELDS", parent ACTOR)
; ---------------------------------------------------------------------------
CoreShields_ClassInit:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	jsr	CoreShields_Reset(pc)
	unlk	a6
	rts
