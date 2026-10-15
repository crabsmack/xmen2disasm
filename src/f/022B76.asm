; ---------------------------------------------------------------------------
; AvalonA2_EmptyStub3 - empty stub called by AvalonA2_RunScene
; In:  none
; Out: none
; Evidence: body is link/unlk/rts
; ---------------------------------------------------------------------------
AvalonA2_EmptyStub3:
	link.w	a6,#$0
	unlk	a6
	rts
