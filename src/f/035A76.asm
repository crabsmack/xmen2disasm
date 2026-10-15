; ---------------------------------------------------------------------------
; AvalonA4_EmptyStub1 - empty stub, first call of AvalonA4_RunScene
; In:  none
; Out: none
; Evidence: body is link/unlk/rts
; ---------------------------------------------------------------------------
AvalonA4_EmptyStub1:
	link.w	a6,#$0
	unlk	a6
	rts
