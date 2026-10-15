; ---------------------------------------------------------------------------
; SavageA3_EmptyStub2 - empty function (SavageA3 scene setup stub)
; Out: none
; Evidence: called once from SavageA3_RunScene; TAS 32160
; ---------------------------------------------------------------------------
SavageA3_EmptyStub2:
	link.w	a6,#$0
	unlk	a6
	rts
