; ---------------------------------------------------------------------------
; Hologram_StateDone - Hologram final state: does nothing
; In:  none
; Out: none
; Evidence: body is link/unlk/rts
; ---------------------------------------------------------------------------
Hologram_StateDone:
	link.w	a6,#$0
	unlk	a6
	rts
