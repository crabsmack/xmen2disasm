; ---------------------------------------------------------------------------
; BaniMazaA2_NopStatic - empty helper called by BaniMazaA2_CallEmptyStub
; In:  none
; Out: none
; Evidence: body is link/unlk/rts
; ---------------------------------------------------------------------------
BaniMazaA2_NopStatic:
	link.w	a6,#$0
	unlk	a6
	rts
