; ---------------------------------------------------------------------------
; SentinelsB2_EmptyStub - SentinelsB2: empty function
; In:  none
; Out: none
; Evidence: body is link/unlk/rts
; ---------------------------------------------------------------------------
SentinelsB2_EmptyStub:
	link.w	a6,#$0
	unlk	a6
	rts
