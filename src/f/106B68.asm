; ---------------------------------------------------------------------------
; Platform1_SizeOf - Platform1: return the object size in bytes (class slot 0, +$06)
; In:  none
; Out: d0 = object size in bytes
; Evidence: method 0 of class descriptor $1072E8 (name string "PLATFORM1", parent SYNCHRONIZEDACTOR)
; ---------------------------------------------------------------------------
Platform1_SizeOf:
	link.w	a6,#$0
	move.l	#$96,d0
	unlk	a6
	rts
