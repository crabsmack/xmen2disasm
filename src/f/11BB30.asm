; ---------------------------------------------------------------------------
; BioFlame_SizeOf - BioFlame: return the object size in bytes (class slot 0, +$06)
; In:  none
; Out: d0 = object size in bytes
; Evidence: method 0 of class descriptor $11B6D4 (name string "BIOFLAME", parent ACTOR)
; ---------------------------------------------------------------------------
BioFlame_SizeOf:
	link.w	a6,#$0
	move.l	#$9A,d0
	unlk	a6
	rts
