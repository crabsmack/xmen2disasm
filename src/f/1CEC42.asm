; ---------------------------------------------------------------------------
; Magneto_Reset - MAGNETO slot +$6A: empty Reset
; In:  none
; Out: none
; Evidence: bare link/unlk/rts; called by Magneto_Init
; ---------------------------------------------------------------------------
Magneto_Reset:
	link.w	a6,#$0
	unlk	a6
	rts
