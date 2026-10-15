; ---------------------------------------------------------------------------
; CloneA2_EmptyStub2 - empty function (CloneA2 scene start stub)
; Out: none
; Evidence: callers CloneA2_CallEmptyStubs and CloneA2_InitCamera; TAS frames 47751/47901
; ---------------------------------------------------------------------------
CloneA2_EmptyStub2:
	link.w	a6,#$0
	unlk	a6
	rts
