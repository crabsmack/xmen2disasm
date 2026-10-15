; ---------------------------------------------------------------------------
; BabyMoleMan_GetSize - BabyMoleMan: return the object size in bytes (class slot 0, +$06)
; In:  none
; Out: d0 = object size in bytes
; Evidence: method 0 of class descriptor $11B986 (name string "BABYMOLEMAN", parent BABYBIO)
; ---------------------------------------------------------------------------
BabyMoleMan_GetSize:
	link.w	a6,#$0
	move.l	#$BC,d0
	unlk	a6
	rts
