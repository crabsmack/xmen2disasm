; ---------------------------------------------------------------------------
; ICandy_Nop22 - ICandy: empty virtual method 7 (+$22)
; In:  none
; Out: none
; Evidence: method 7 of ICANDY; body is link/unlk/rts
; ---------------------------------------------------------------------------
ICandy_Nop22:
	link.w	a6,#$0
	unlk	a6
	rts
