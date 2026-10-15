; ---------------------------------------------------------------------------
; BaniMazaA1_EmptyStub - empty stub, first call of BaniMazaA1_RunScene
; In:  none
; Out: none
; Evidence: body is link/unlk/rts
; ---------------------------------------------------------------------------
BaniMazaA1_EmptyStub:
	link.w	a6,#$0
	unlk	a6
	rts
