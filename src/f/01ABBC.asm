; ---------------------------------------------------------------------------
; Tower_NopStatic - empty non-virtual helper called from TOWER's ClassInit
; In:  none
; Out: none
; Evidence: body is link/unlk/rts
; ---------------------------------------------------------------------------
Tower_NopStatic:
	link.w	a6,#$0
	unlk	a6
	rts
