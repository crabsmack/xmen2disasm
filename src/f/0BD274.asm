; ---------------------------------------------------------------------------
; SavageBio_NopStatic - empty non-virtual helper (called from SavageBioBase_ClassInit and SavageMediumBio_Init)
; Out: none
; ---------------------------------------------------------------------------
SavageBio_NopStatic:
	link.w	a6,#$0
	unlk	a6
	rts
