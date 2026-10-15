; ---------------------------------------------------------------------------
; SentinelsD1_EmptyStub - empty function (SentinelsD1 light setup stub)
; Out: none
; Evidence: called from SentinelsD1_InitLight
; Found: jt 1145
; ---------------------------------------------------------------------------
SentinelsD1_EmptyStub:
	link.w	a6,#$0
	unlk	a6
	rts
