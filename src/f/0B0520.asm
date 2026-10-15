; ---------------------------------------------------------------------------
; SavageA3_EmptyStub1 - empty function (first SavageA3 setup stub)
; Out: none
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageA3_EmptyStub1:
	link.w	a6,#$0
	unlk	a6
	rts
