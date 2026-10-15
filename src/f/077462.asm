; ---------------------------------------------------------------------------
; CloneA1_NopStatic - empty helper called by CloneA1_InitSprites
; In:  none
; Out: none
; Evidence: body is link/unlk/rts
; ---------------------------------------------------------------------------
CloneA1_NopStatic:
	link.w	a6,#$0
	unlk	a6
	rts
