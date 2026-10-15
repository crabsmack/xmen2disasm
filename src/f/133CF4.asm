; ---------------------------------------------------------------------------
; BrainRocket_EmptyStub - BRAINROCKET module: empty function
; In:  none
; Out: none
; Evidence: body is link/unlk/rts
; ---------------------------------------------------------------------------
BrainRocket_EmptyStub:
	link.w	a6,#$0
	unlk	a6
	rts
