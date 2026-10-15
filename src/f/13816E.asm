; ---------------------------------------------------------------------------
; LaserCannon_Reset - LaserCannon: per-class reset hook (class slot 25, +$6A); some Inits call it on this, some LevelInit hooks share its body
; In:  8(a6) = this (0 when reached from LevelInit)
; Out: none
; Evidence: method 25 of class descriptor $1386B4 (name string "LASERCANNON", parent XNPC)
; ---------------------------------------------------------------------------
LaserCannon_Reset:
	link.w	a6,#$0
	unlk	a6
	rts
