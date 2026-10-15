; ---------------------------------------------------------------------------
; BrainRocket_GetSize - return sizeof(BRAINROCKET object) = $96 bytes (class slot 0, +$06)
; In:  none
; Out: d0 = $96
; Evidence: method 0 of class descriptor $133CFC (name string "BRAINROCKET", parent ACTOR)
; ---------------------------------------------------------------------------
BrainRocket_GetSize:
	link.w	a6,#$0
	move.l	#$96,d0
	unlk	a6
	rts
