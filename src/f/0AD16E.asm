; ---------------------------------------------------------------------------
; SavageA2_EmptyStub2 - empty function (SavageA2 scene setup stub)
; Out: none
; Evidence: called once from SavageA2_RunScene; TAS 30859
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageA2_EmptyStub2:
	link.w	a6,#$0
	unlk	a6
	rts
