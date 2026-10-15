; ---------------------------------------------------------------------------
; Hologram_SizeOf - Hologram: return the object size in bytes (class slot 0, +$06)
; In:  none
; Out: d0 = object size in bytes
; Evidence: method 0 of class descriptor $0EAE16 (name string "HOLOGRAM", parent ACTOR)
; ---------------------------------------------------------------------------
Hologram_SizeOf:
	link.w	a6,#$0
	move.l	#$A6,d0
	unlk	a6
	rts
