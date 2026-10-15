; ---------------------------------------------------------------------------
; BioFlame_GetSize - return sizeof(BIOFLAME object) = $9A bytes (class slot 0, +$06)
; In:  none
; Out: d0 = $9A
; Evidence: method 0 of class descriptor $11B6D4 (name string "BIOFLAME", parent ACTOR)
; ---------------------------------------------------------------------------
BioFlame_GetSize:
	link.w	a6,#$0
	move.l	#$9A,d0
	unlk	a6
	rts
