; ---------------------------------------------------------------------------
; BioSentinel_GetSize - BioSentinel: return the object size in bytes (class slot 0, +$06)
; In:  none
; Out: d0 = object size in bytes
; Evidence: method 0 of class descriptor $1235F6 (name string "BIOSENTINEL", parent BASICBIOSENTINEL)
; ---------------------------------------------------------------------------
BioSentinel_GetSize:
	link.w	a6,#$0
	move.l	#$A8,d0
	unlk	a6
	rts
