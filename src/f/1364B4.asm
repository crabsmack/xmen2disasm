; ---------------------------------------------------------------------------
; Hornet_GetSize - return sizeof(HORNET object) = $B8 bytes (class slot 0, +$06)
; In:  none
; Out: d0 = $B8
; Evidence: method 0 of class descriptor $137252 (name string "HORNET", parent XNPC)
; ---------------------------------------------------------------------------
Hornet_GetSize:
	link.w	a6,#$0
	move.l	#$B8,d0
	unlk	a6
	rts
