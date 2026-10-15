; ---------------------------------------------------------------------------
; AvalonA2_EmptyStub1 - empty stub, first of the three called by AvalonA2_CallEmptyStubs
; In:  none
; Out: none
; Evidence: body is link/unlk/rts
; ---------------------------------------------------------------------------
AvalonA2_EmptyStub1:
	link.w	a6,#$0
	unlk	a6
	rts
