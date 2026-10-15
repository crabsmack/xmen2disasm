; ---------------------------------------------------------------------------
; AvalonA4_EmptyStub2 - empty stub called by AvalonA4_RunScene
; In:  none
; Out: none
; Evidence: body is link/unlk/rts
; ---------------------------------------------------------------------------
AvalonA4_EmptyStub2:
	link.w	a6,#$0
	unlk	a6
	rts
