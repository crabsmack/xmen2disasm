; ---------------------------------------------------------------------------
; Hornet_SizeOf - Hornet: return the object size in bytes (class slot 0, +$06)
; In:  none
; Out: d0 = object size in bytes
; Evidence: method 0 of class descriptor $137252 (name string "HORNET", parent XNPC)
; ---------------------------------------------------------------------------
Hornet_SizeOf:
	link.w	a6,#$0
	move.l	#$B8,d0
	unlk	a6
	rts
