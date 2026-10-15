; ---------------------------------------------------------------------------
; SpaceA1_EmptyStub1 - SpaceA1 elevator stage: empty hook
; In:  none
; Out: none
; Evidence: body is link/unlk/rts; only caller SpaceA1_CallEmptyStub
; ---------------------------------------------------------------------------
SpaceA1_EmptyStub1:
	link.w	a6,#$0
	unlk	a6
	rts
