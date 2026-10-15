; ---------------------------------------------------------------------------
; Hologram_GetSize - return sizeof(HOLOGRAM object) = $A6 bytes (class slot 0, +$06)
; In:  none
; Out: d0 = $A6
; Evidence: method 0 of class descriptor $0EAE16 (name string "HOLOGRAM", parent ACTOR)
; ---------------------------------------------------------------------------
Hologram_GetSize:
	link.w	a6,#$0
	move.l	#$A6,d0
	unlk	a6
	rts
