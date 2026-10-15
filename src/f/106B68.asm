; ---------------------------------------------------------------------------
; Platform1_GetSize - return sizeof(PLATFORM1 object) = $96 bytes (class slot 0, +$06)
; In:  none
; Out: d0 = $96
; Evidence: method 0 of class descriptor $1072E8 (name string "PLATFORM1", parent SYNCHRONIZEDACTOR)
; ---------------------------------------------------------------------------
Platform1_GetSize:
	link.w	a6,#$0
	move.l	#$96,d0
	unlk	a6
	rts
