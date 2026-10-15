; ---------------------------------------------------------------------------
; Hornet_NopStatic - empty non-virtual helper called from HORNET's ClassInit and Reset
; In:  none
; Out: none
; Evidence: body is link/unlk/rts; callers Hornet_ClassInit, Hornet_Reset
; ---------------------------------------------------------------------------
Hornet_NopStatic:
	link.w	a6,#$0
	unlk	a6
	rts
