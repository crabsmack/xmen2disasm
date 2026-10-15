; ---------------------------------------------------------------------------
; BigBio_EmptyStub - BIGBIO: empty function (ClassInit helper)
; In:  none
; Out: none
; Evidence: called by BigBio_ClassInit
; ---------------------------------------------------------------------------
BigBio_EmptyStub:
	link.w	a6,#$0
	unlk	a6
	rts
