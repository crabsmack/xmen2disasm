; ---------------------------------------------------------------------------
; SentinelsB1_EmptyStub - SentinelsB1: empty function
; In:  none
; Out: none
; Evidence: body is link/unlk/rts; called by SentinelsB1_InstallHooks
; ---------------------------------------------------------------------------
SentinelsB1_EmptyStub:
	link.w	a6,#$0
	unlk	a6
	rts
