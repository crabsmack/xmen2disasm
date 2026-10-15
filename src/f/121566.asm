; ---------------------------------------------------------------------------
; BioSentinel_EmptyStub - BIOSENTINEL: empty function (ClassInit body)
; In:  none
; Out: none
; Evidence: called by BioSentinel_ClassInit
; ---------------------------------------------------------------------------
BioSentinel_EmptyStub:
	link.w	a6,#$0
	unlk	a6
	rts
