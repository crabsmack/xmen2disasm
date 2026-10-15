; ---------------------------------------------------------------------------
; SentinelsB2_EmptyStub2 - empty function (jt 1148; called from SentinelsB2_CallStubs)
; Out: none
; Evidence: TAS 9698
; Found: jt 1148
; ---------------------------------------------------------------------------
SentinelsB2_EmptyStub2:
	link.w	a6,#$0
	unlk	a6
	rts
