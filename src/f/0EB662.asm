; ---------------------------------------------------------------------------
; CoreShields_SizeOf - CoreShields: return the object size in bytes (class slot 0, +$06)
; In:  none
; Out: d0 = object size in bytes
; Evidence: method 0 of class descriptor $0EBE7E (name string "CORESHIELDS", parent ACTOR)
; ---------------------------------------------------------------------------
CoreShields_SizeOf:
	link.w	a6,#$0
	move.l	#$9C,d0
	unlk	a6
	rts
