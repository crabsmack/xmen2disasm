; ---------------------------------------------------------------------------
; BrainRocket_Deactivate - BrainRocket: deactivate: release sprite/collision resources, leave object lists (class slot 16, +$46)
; In:  8(a6) = this
; Out: none
; Evidence: method 16 of class descriptor $133CFC (name string "BRAINROCKET", parent ACTOR)
; ---------------------------------------------------------------------------
BrainRocket_Deactivate:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	jsr	$4E8A(a5)	; -> Actor_DeactivateFree
	unlk	a6
	rts
