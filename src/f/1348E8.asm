; ---------------------------------------------------------------------------
; FlyBrood_Nop6A - FlyBrood: no-op override of virtual slot 25 (+$6A)
; In:  none (unused)
; Out: none
; Evidence: method 25 of class descriptor $134518 (name string "FLYBROOD", parent ACTOR)
; ---------------------------------------------------------------------------
FlyBrood_Nop6A:
	link.w	a6,#$0
	unlk	a6
	rts
