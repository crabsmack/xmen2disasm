; ---------------------------------------------------------------------------
; BanimazaDoor_NopStatic - empty non-virtual helper called from BANIMAZADOOR's ClassInit
; In:  none
; Out: none
; Evidence: body is link/unlk/rts
; ---------------------------------------------------------------------------
BanimazaDoor_NopStatic:
	link.w	a6,#$0
	unlk	a6
	rts
