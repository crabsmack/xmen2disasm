; ---------------------------------------------------------------------------
; CoreElevator_EmptyStub - CoreElevator: empty function (Reset/ClassInit body)
; In:  none
; Out: none
; Evidence: called by CoreElevator_Reset and CoreElevator_ClassInit
; ---------------------------------------------------------------------------
CoreElevator_EmptyStub:
	link.w	a6,#$0
	unlk	a6
	rts
