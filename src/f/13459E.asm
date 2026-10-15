; ---------------------------------------------------------------------------
; FlyBrood_EmptyStub - FLYBROOD: empty function
; In:  none
; Out: none
; Evidence: body is link/unlk/rts
; ---------------------------------------------------------------------------
FlyBrood_EmptyStub:
	link.w	a6,#$0
	unlk	a6
	rts
