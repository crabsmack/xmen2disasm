; ---------------------------------------------------------------------------
; FireWall_Reset - FireWall: per-class reset hook (class slot 25, +$6A); some Inits call it on this, some LevelInit hooks share its body
; In:  8(a6) = this (0 when reached from ClassInit)
; Out: none
; Evidence: method 25 of class descriptor $134214 (name string "FIREWALL", parent ACTOR)
; ---------------------------------------------------------------------------
FireWall_Reset:
	link.w	a6,#$0
	jsr	sub_13420C(pc)
	unlk	a6
	rts
