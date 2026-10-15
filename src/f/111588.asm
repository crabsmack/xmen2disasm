; ---------------------------------------------------------------------------
; Deathbird_EmptyStub2 - Deathbird: empty function (part of Deathbird_Reset)
; In:  none
; Out: none
; Evidence: body is link/unlk/rts
; ---------------------------------------------------------------------------
Deathbird_EmptyStub2:
	link.w	a6,#$0
	unlk	a6
	rts
