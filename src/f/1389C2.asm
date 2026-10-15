; ---------------------------------------------------------------------------
; LineSegKiller_NopStatic - empty non-virtual helper called from LINESEGKILLER's ClassInit
; In:  none
; Out: none
; Evidence: body is link/unlk/rts; caller LineSegKiller_ClassInit
; ---------------------------------------------------------------------------
LineSegKiller_NopStatic:
	link.w	a6,#$0
	unlk	a6
	rts
