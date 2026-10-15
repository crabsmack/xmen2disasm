; ---------------------------------------------------------------------------
; ApocBomb_NopStatic - empty non-virtual helper called from APOCBOMB's ClassInit and Nop6A
; In:  none
; Out: none
; Evidence: body is link/unlk/rts
; ---------------------------------------------------------------------------
ApocBomb_NopStatic:
	link.w	a6,#$0
	unlk	a6
	rts
