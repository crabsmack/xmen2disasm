; ---------------------------------------------------------------------------
; Deathbird_EmptyStub1 - Deathbird: empty function (part of Deathbird_Reset)
; In:  none
; Out: none
; Evidence: body is link/unlk/rts
; ---------------------------------------------------------------------------
Deathbird_EmptyStub1:
	link.w	a6,#$0
	unlk	a6
	rts
