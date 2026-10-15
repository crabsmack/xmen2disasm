; ---------------------------------------------------------------------------
; SentinelsA1_EmptyStub - SentinelsA1: empty function
; In:  none
; Out: none
; Evidence: body is link/unlk/rts
; ---------------------------------------------------------------------------
SentinelsA1_EmptyStub:
	link.w	a6,#$0
	unlk	a6
	rts
