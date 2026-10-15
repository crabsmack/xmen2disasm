; ---------------------------------------------------------------------------
; HoloBolt_SizeOf - HoloBolt: return the object size in bytes (class slot 0, +$06)
; In:  none
; Out: d0 = object size in bytes
; Evidence: method 0 of class descriptor $0E83AC (name string "HOLOBOLT", parent ACTOR)
; ---------------------------------------------------------------------------
HoloBolt_SizeOf:
	link.w	a6,#$0
	move.l	#$8C,d0
	unlk	a6
	rts
