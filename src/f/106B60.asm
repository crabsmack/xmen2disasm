; ---------------------------------------------------------------------------
; Platform1_EmptyStub - Platform1: empty function
; In:  none
; Out: none
; Evidence: body is link/unlk/rts; called by Platform1_ClassInit
; ---------------------------------------------------------------------------
Platform1_EmptyStub:
	link.w	a6,#$0
	unlk	a6
	rts
