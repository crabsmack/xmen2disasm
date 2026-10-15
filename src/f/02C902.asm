; ---------------------------------------------------------------------------
; AvalonA3_EmptyStub2 - empty stub called by AvalonA3_RunScene after AvalonA3_InstallHooks
; In:  none
; Out: none
; Evidence: body is link/unlk/rts
; ---------------------------------------------------------------------------
AvalonA3_EmptyStub2:
	link.w	a6,#$0
	unlk	a6
	rts
