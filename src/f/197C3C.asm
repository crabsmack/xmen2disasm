; ---------------------------------------------------------------------------
; Wolverine_Reset - WOLVERINE slot +$6A: empty Reset
; In:  none
; Out: none
; Evidence: bare link/unlk/rts; called by Wolverine_Init
; ---------------------------------------------------------------------------
Wolverine_Reset:
	link.w	a6,#$0
	unlk	a6
	rts
