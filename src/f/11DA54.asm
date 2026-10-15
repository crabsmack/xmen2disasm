; ---------------------------------------------------------------------------
; FloatBio_GetSize - return sizeof(FLOATBIO object) = $C0 bytes (class slot 0, +$06)
; In:  none
; Out: d0 = $C0
; Evidence: method 0 of class descriptor $11BA14 (name string "FLOATBIO", parent BABYBIO)
; ---------------------------------------------------------------------------
FloatBio_GetSize:
	link.w	a6,#$0
	move.l	#$C0,d0
	unlk	a6
	rts
