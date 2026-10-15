; ---------------------------------------------------------------------------
; SiberiaB1_CallEmptyStub - SiberiaB1: call the empty stub
; In:  none
; Out: none
; Evidence: called twice by SiberiaB1_RunScene
; ---------------------------------------------------------------------------
SiberiaB1_CallEmptyStub:
	link.w	a6,#$0
	jsr	SiberiaB1_EmptyStub(pc)
	unlk	a6
	rts
