; ---------------------------------------------------------------------------
; Hologram_Reset - Hologram: per-class reset hook (class slot 25, +$6A); some Inits call it on this, some LevelInit hooks share its body
; In:  8(a6) = this (0 when reached from ClassInit)
; Out: none
; Evidence: method 25 of class descriptor $0EAE16 (name string "HOLOGRAM", parent ACTOR)
; ---------------------------------------------------------------------------
Hologram_Reset:
	link.w	a6,#$0
	jsr	sub_0E99E4(pc)
	unlk	a6
	rts
