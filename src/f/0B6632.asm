; ---------------------------------------------------------------------------
; SavageA4_EmptyStub - empty function (SavageA4 setup stub)
; Out: none
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageA4_EmptyStub:
	link.w	a6,#$0
	unlk	a6
	rts
