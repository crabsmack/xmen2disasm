; ---------------------------------------------------------------------------
; BioNpc_GetSize - BioNpc: return the object size in bytes (class slot 0, +$06)
; In:  none
; Out: d0 = object size in bytes
; Evidence: method 0 of class descriptor $113B10 (name string "BIONPC", parent XNPC)
; ---------------------------------------------------------------------------
BioNpc_GetSize:
	link.w	a6,#$0
	move.l	#$96,d0
	unlk	a6
	rts
