; ---------------------------------------------------------------------------
; LaserCannon_ClassInit - empty: returns at once (this class's override of: per-class hook run at level start before the spawn pass (static, class slot 22, +$5E; ClassList_InitAll))
; In:  8(a6) = 0  $C(a6) = class index in the level class list
; Out: none
; Evidence: method 22 of class descriptor $1386B4 (name string "LASERCANNON", parent XNPC)
; ---------------------------------------------------------------------------
LaserCannon_ClassInit:
	link.w	a6,#$0
	unlk	a6
	rts
