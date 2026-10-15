; ---------------------------------------------------------------------------
; SavageA4_CallEmptyStub - SavageA4: call the empty stub SavageA4_EmptyStub
; In:  none
; Out: none
; Evidence: called twice from SavageA4_RunScene
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageA4_CallEmptyStub:
	link.w	a6,#$0
	jsr	SavageA4_EmptyStub(pc)
	unlk	a6
	rts
