; ---------------------------------------------------------------------------
; Pop_NopStatic - empty non-virtual helper called from POP's ClassInit and Reset
; In:  none
; Out: none
; Evidence: body is link/unlk/rts; callers Pop_ClassInit, Pop_Reset
; ---------------------------------------------------------------------------
Pop_NopStatic:
	link.w	a6,#$0
	unlk	a6
	rts
