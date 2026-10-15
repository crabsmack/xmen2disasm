; ---------------------------------------------------------------------------
; BioSentinel_GetSize - return sizeof(BIOSENTINEL object) = $A8 bytes (class slot 0, +$06)
; In:  none
; Out: d0 = $A8
; Evidence: method 0 of class descriptor $1235F6 (name string "BIOSENTINEL", parent BASICBIOSENTINEL)
; ---------------------------------------------------------------------------
BioSentinel_GetSize:
	link.w	a6,#$0
	move.l	#$A8,d0
	unlk	a6
	rts
