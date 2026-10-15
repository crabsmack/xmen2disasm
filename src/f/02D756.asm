; ---------------------------------------------------------------------------
; Exodus_NopStatic - empty non-virtual helper called from EXODUS's ClassInit
; In:  none
; Out: none
; Evidence: body is link/unlk/rts
; ---------------------------------------------------------------------------
Exodus_NopStatic:
	link.w	a6,#$0
	unlk	a6
	rts
