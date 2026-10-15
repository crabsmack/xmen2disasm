; ---------------------------------------------------------------------------
; Ninja_NopStatic - empty non-virtual helper called from NINJA's ClassInit and Reset
; In:  none
; Out: none
; Evidence: body is link/unlk/rts; callers Ninja_ClassInit, Ninja_Reset
; ---------------------------------------------------------------------------
Ninja_NopStatic:
	link.w	a6,#$0
	unlk	a6
	rts
