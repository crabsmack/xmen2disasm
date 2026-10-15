; ---------------------------------------------------------------------------
; ICandy_Nop1E - ICandy: empty virtual method 6 (+$1E)
; In:  none
; Out: none
; Evidence: method 6 of ICANDY; body is link/unlk/rts
; ---------------------------------------------------------------------------
ICandy_Nop1E:
	link.w	a6,#$0
	unlk	a6
	rts
