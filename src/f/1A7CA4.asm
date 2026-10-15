; ---------------------------------------------------------------------------
; Nightcrawler_Reset - NIGHTCRAWLER slot +$6A: empty Reset
; In:  none
; Out: none
; Evidence: bare link/unlk/rts; called by Nightcrawler_Init
; ---------------------------------------------------------------------------
Nightcrawler_Reset:
	link.w	a6,#$0
	unlk	a6
	rts
