; ---------------------------------------------------------------------------
; SentinelsA1_CallEmptyStub - SentinelsA1: call the empty stub (before and after loading)
; In:  none
; Out: none
; Evidence: only calls SentinelsA1_EmptyStub; called twice by SentinelsA1_RunScene
; ---------------------------------------------------------------------------
SentinelsA1_CallEmptyStub:
	link.w	a6,#$0
	jsr	SentinelsA1_EmptyStub(pc)
	unlk	a6
	rts
