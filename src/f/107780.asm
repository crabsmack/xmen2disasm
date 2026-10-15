; ---------------------------------------------------------------------------
; SpaceB1_CallEmptyStub - SpaceB1: call the empty stub
; In:  none
; Out: none
; Evidence: called twice by SpaceB1_RunScene
; ---------------------------------------------------------------------------
SpaceB1_CallEmptyStub:
	link.w	a6,#$0
	jsr	SpaceB1_EmptyStub(pc)
	unlk	a6
	rts
