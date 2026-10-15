; ---------------------------------------------------------------------------
; HornetBullet_Reset - HornetBullet: per-class reset hook (class slot 25, +$6A); some Inits call it on this, some LevelInit hooks share its body
; In:  8(a6) = this (0 when reached from ClassInit)
; Out: none
; Evidence: method 25 of class descriptor $137708 (name string "HORNETBULLET", parent ACTOR)
; ---------------------------------------------------------------------------
HornetBullet_Reset:
	link.w	a6,#$0
	jsr	sub_13734E(pc)
	unlk	a6
	rts
