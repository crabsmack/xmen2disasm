; ---------------------------------------------------------------------------
; FireWall_ClassInit - FireWall: per-class hook run at level start before the spawn pass (static, class slot 22, +$5E; ClassList_InitAll)
; In:  8(a6) = 0  $C(a6) = class index in the level class list
; Out: none
; Evidence: method 22 of class descriptor $134214 (name string "FIREWALL", parent ACTOR)
; ---------------------------------------------------------------------------
FireWall_ClassInit:
	link.w	a6,#$0
	jsr	sub_13420C(pc)
	unlk	a6
	rts
