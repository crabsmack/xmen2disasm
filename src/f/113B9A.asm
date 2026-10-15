; ---------------------------------------------------------------------------
; XNpc_SizeOf - XNpc: return the object size in bytes (class slot 0, +$06)
; In:  none
; Out: d0 = object size in bytes
; Evidence: method 0 of class descriptor $113A88 (name string "XNPC", parent ACTOR)
; ---------------------------------------------------------------------------
XNpc_SizeOf:
	link.w	a6,#$0
	move.l	#$94,d0
	unlk	a6
	rts
