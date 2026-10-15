; ---------------------------------------------------------------------------
; Ninja_ClassInit - Ninja: per-class hook run at level start before the spawn pass (static, class slot 22, +$5E; ClassList_InitAll)
; In:  8(a6) = 0  $C(a6) = class index in the level class list
; Out: none
; Evidence: method 22 of class descriptor $13D7FE (name string "NINJA", parent BIONPC)
; ---------------------------------------------------------------------------
Ninja_ClassInit:
	link.w	a6,#$0
	jsr	sub_13D7F6(pc)
	unlk	a6
	rts
