; ---------------------------------------------------------------------------
; LaserCannon_GetSize - return sizeof(LASERCANNON object) = $A4 bytes (class slot 0, +$06)
; In:  none
; Out: d0 = $A4
; Evidence: method 0 of class descriptor $1386B4 (name string "LASERCANNON", parent XNPC)
; ---------------------------------------------------------------------------
LaserCannon_GetSize:
	link.w	a6,#$0
	move.l	#$A4,d0
	unlk	a6
	rts
