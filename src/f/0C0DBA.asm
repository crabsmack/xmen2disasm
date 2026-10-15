; ---------------------------------------------------------------------------
; SavageJungle_EmptyStub - empty function (first setup step of the Savage jungle scenes)
; Out: none
; Evidence: called from SavageC1_RunScene and SavageB1_RunScene
; ---------------------------------------------------------------------------
SavageJungle_EmptyStub:
	link.w	a6,#$0
	unlk	a6
	rts
