; ---------------------------------------------------------------------------
; FlyBrood_GetSize - return sizeof(FLYBROOD object) = $B2 bytes (class slot 0, +$06)
; In:  none
; Out: d0 = $B2
; Evidence: method 0 of class descriptor $134518 (name string "FLYBROOD", parent ACTOR)
; ---------------------------------------------------------------------------
FlyBrood_GetSize:
	link.w	a6,#$0
	move.l	#$B2,d0
	unlk	a6
	rts
