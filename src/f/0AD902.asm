; ---------------------------------------------------------------------------
; SavageA2_EmptyStub1 - empty function (first SavageA2 setup stub)
; Out: none
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageA2_EmptyStub1:
	link.w	a6,#$0
	unlk	a6
	rts
