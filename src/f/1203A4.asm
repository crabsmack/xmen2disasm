; ---------------------------------------------------------------------------
; BioBalls_EmptyStub - BIOBALLS: empty function
; In:  none
; Out: none
; Evidence: body is link/unlk/rts; called by BioBalls_AllocBallList and others
; ---------------------------------------------------------------------------
BioBalls_EmptyStub:
	link.w	a6,#$0
	unlk	a6
	rts
