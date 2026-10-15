; ---------------------------------------------------------------------------
; BioBullet_GetSize - return sizeof(BIOBULLET object) = $8C bytes (class slot 0, +$06)
; In:  none
; Out: d0 = $8C
; Evidence: method 0 of class descriptor $11E6EC (name string "BIOBULLET", parent ACTOR)
; ---------------------------------------------------------------------------
BioBullet_GetSize:
	link.w	a6,#$0
	move.l	#$8C,d0
	unlk	a6
	rts
