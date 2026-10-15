; ---------------------------------------------------------------------------
; XNpc_GetSize - return sizeof(XNPC object) = $94 bytes (class slot 0, +$06)
; In:  none
; Out: d0 = $94
; Evidence: method 0 of class descriptor $113A88 (name string "XNPC", parent ACTOR)
; ---------------------------------------------------------------------------
XNpc_GetSize:
	link.w	a6,#$0
	move.l	#$94,d0
	unlk	a6
	rts
