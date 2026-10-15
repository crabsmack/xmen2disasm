; ---------------------------------------------------------------------------
; SpaceA1_EmptyStub2 - SpaceA1: second empty hook
; In:  none
; Out: none
; Evidence: body is link/unlk/rts; only caller SpaceA1_InstallHooks
; ---------------------------------------------------------------------------
SpaceA1_EmptyStub2:
	link.w	a6,#$0
	unlk	a6
	rts
