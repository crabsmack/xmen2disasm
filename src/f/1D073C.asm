; ---------------------------------------------------------------------------
; Gambit_Nop6A - GAMBIT slot +$6A: empty Reset override
; In:  none
; Out: none
; Evidence: single rts
; ---------------------------------------------------------------------------
Gambit_Nop6A:
	link.w	a6,#$0
	unlk	a6
	rts
