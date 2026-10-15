; ---------------------------------------------------------------------------
; FloatBio_SizeOf - FloatBio: return the object size in bytes (class slot 0, +$06)
; In:  none
; Out: d0 = object size in bytes
; Evidence: method 0 of class descriptor $11BA14 (name string "FLOATBIO", parent BABYBIO)
; ---------------------------------------------------------------------------
FloatBio_SizeOf:
	link.w	a6,#$0
	move.l	#$C0,d0
	unlk	a6
	rts
