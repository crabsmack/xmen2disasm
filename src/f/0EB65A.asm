; ---------------------------------------------------------------------------
; CoreShields_EmptyStub - CoreShields: empty function (Reset body)
; In:  none
; Out: none
; Evidence: called by CoreShields_Reset; body is link/unlk/rts
; ---------------------------------------------------------------------------
CoreShields_EmptyStub:
	link.w	a6,#$0
	unlk	a6
	rts
