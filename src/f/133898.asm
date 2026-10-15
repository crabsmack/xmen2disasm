; ---------------------------------------------------------------------------
; BrainRocket_Deactivate - deactivate for good with Actor_DeactivateFree (ACTOR Deactivate, clear flags, free the timer, release the spawn record) (BRAINROCKET override of slot 16, +$46)
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
