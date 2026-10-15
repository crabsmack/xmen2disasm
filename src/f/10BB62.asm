; ---------------------------------------------------------------------------
; SpaceA1_CallEmptyStub - SpaceA1 elevator stage: first init step, calls an empty hook
; In:  none
; Out: none
; Evidence: only caller SpaceA1_RunScene
; ---------------------------------------------------------------------------
SpaceA1_CallEmptyStub:
	link.w	a6,#$0
	jsr	SpaceA1_EmptyStub1(pc)
	unlk	a6
	rts
