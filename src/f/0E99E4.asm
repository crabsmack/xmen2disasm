; ---------------------------------------------------------------------------
; Hologram_EmptyStub - Hologram: empty function (Reset body)
; In:  none
; Out: none
; Evidence: called by Hologram_Reset; body is link/unlk/rts
; ---------------------------------------------------------------------------
Hologram_EmptyStub:
	link.w	a6,#$0
	unlk	a6
	rts
