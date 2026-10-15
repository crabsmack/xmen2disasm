; ---------------------------------------------------------------------------
; AvalonA2_EmptyStub2 - empty stub called by AvalonA2_CallEmptyStubs
; In:  none
; Out: none
; Evidence: body is link/unlk/rts
; ---------------------------------------------------------------------------
AvalonA2_EmptyStub2:
	link.w	a6,#$0
	unlk	a6
	rts
