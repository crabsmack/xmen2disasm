; ---------------------------------------------------------------------------
; LaserCannon_Nop6A - LaserCannon: no-op override of virtual slot 25 (+$6A)
; In:  none (unused)
; Out: none
; Evidence: method 25 of class descriptor $1386B4 (name string "LASERCANNON", parent XNPC)
; ---------------------------------------------------------------------------
LaserCannon_Nop6A:
	link.w	a6,#$0
	unlk	a6
	rts
