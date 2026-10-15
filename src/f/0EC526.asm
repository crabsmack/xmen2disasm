; ---------------------------------------------------------------------------
; CoreElevator_SizeOf - CoreElevator: return the object size in bytes (class slot 0, +$06)
; In:  none
; Out: d0 = object size in bytes
; Evidence: method 0 of class descriptor $0EC98E (name string "COREELEVATOR", parent ACTOR)
; ---------------------------------------------------------------------------
CoreElevator_SizeOf:
	link.w	a6,#$0
	move.l	#$94,d0
	unlk	a6
	rts
