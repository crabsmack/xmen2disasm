; ---------------------------------------------------------------------------
; BioBalls_GetSize - return sizeof(BIOBALLS object) = $AC bytes (class slot 0, +$06)
; In:  none
; Out: d0 = $AC
; Evidence: method 0 of class descriptor $1203AC (name string "BIOBALLS", parent ACTOR)
; ---------------------------------------------------------------------------
BioBalls_GetSize:
	link.w	a6,#$0
	move.l	#$AC,d0
	unlk	a6
	rts
