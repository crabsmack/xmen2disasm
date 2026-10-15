; ---------------------------------------------------------------------------
; SiberiaB1_EmptyStub - SiberiaB1: empty function
; In:  none
; Out: none
; Evidence: body is link/unlk/rts
; ---------------------------------------------------------------------------
SiberiaB1_EmptyStub:
	link.w	a6,#$0
	unlk	a6
	rts
