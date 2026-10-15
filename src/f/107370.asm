; ---------------------------------------------------------------------------
; SpaceB1_EmptyStub - SpaceB1: empty function
; In:  none
; Out: none
; Evidence: body is link/unlk/rts
; ---------------------------------------------------------------------------
SpaceB1_EmptyStub:
	link.w	a6,#$0
	unlk	a6
	rts
