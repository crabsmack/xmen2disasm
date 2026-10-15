; ---------------------------------------------------------------------------
; CloneA2_EmptyStub3 - empty function (CloneA2 scene start stub)
; Out: none
; Evidence: only caller CloneA2_CallEmptyStubs; TAS frame 47751
; ---------------------------------------------------------------------------
CloneA2_EmptyStub3:
	link.w	a6,#$0
	unlk	a6
	rts
