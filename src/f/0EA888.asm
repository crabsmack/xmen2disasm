; ---------------------------------------------------------------------------
; Hologram_ClassInit - does nothing: only calls the empty Hologram_Reset (static, class slot 22, +$5E ClassInit)
; In:  8(a6) = 0  $C(a6) = class index in the level class list
; Out: none
; Evidence: body = jsr Hologram_Reset, which only calls Hologram_EmptyStub; method 22 of class descriptor $0EAE16 (name string "HOLOGRAM", parent ACTOR)
; ---------------------------------------------------------------------------
Hologram_ClassInit:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	jsr	Hologram_Reset(pc)
	unlk	a6
	rts
