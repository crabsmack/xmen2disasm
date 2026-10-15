; ---------------------------------------------------------------------------
; CloneA1_EmptyStub - empty stub, first call of CloneA1_RunScene
; In:  none
; Out: none
; Evidence: body is link/unlk/rts
; ---------------------------------------------------------------------------
CloneA1_EmptyStub:
	link.w	a6,#$0
	unlk	a6
	rts
