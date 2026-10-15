; ---------------------------------------------------------------------------
; CloneA2_CallEmptyStubs - first step of CloneA2_RunScene: call the three empty stubs
; In:  none
; Out: none
; Evidence: calls CloneA2_EmptyStub3/2/1, all empty; TAS frame 47751
; ---------------------------------------------------------------------------
CloneA2_CallEmptyStubs:
	link.w	a6,#$0
	jsr	CloneA2_EmptyStub3(pc)
	jsr	CloneA2_EmptyStub2(pc)
	jsr	CloneA2_EmptyStub1(pc)
	unlk	a6
	rts
