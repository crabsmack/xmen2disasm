; ---------------------------------------------------------------------------
; Hologram_ClassInit - Hologram: per-class hook run at level start before the spawn pass (static, class slot 22, +$5E; sub_1FA7E8)
; In:  8(a6) = 0  $C(a6) = class index in the level class list
; Out: none
; Evidence: method 22 of class descriptor $0EAE16 (name string "HOLOGRAM", parent ACTOR)
; ---------------------------------------------------------------------------
Hologram_ClassInit:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	jsr	Hologram_Reset(pc)
	unlk	a6
	rts
