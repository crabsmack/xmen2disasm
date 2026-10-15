; ---------------------------------------------------------------------------
; BioBalls_SizeOf - BioBalls: return the object size in bytes (class slot 0, +$06)
; In:  none
; Out: d0 = object size in bytes
; Evidence: method 0 of class descriptor $1203AC (name string "BIOBALLS", parent ACTOR)
; ---------------------------------------------------------------------------
BioBalls_SizeOf:
	link.w	a6,#$0
	move.l	#$AC,d0
	unlk	a6
	rts
