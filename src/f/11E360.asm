; ---------------------------------------------------------------------------
; BioBullet_SizeOf - BioBullet: return the object size in bytes (class slot 0, +$06)
; In:  none
; Out: d0 = object size in bytes
; Evidence: method 0 of class descriptor $11E6EC (name string "BIOBULLET", parent ACTOR)
; ---------------------------------------------------------------------------
BioBullet_SizeOf:
	link.w	a6,#$0
	move.l	#$8C,d0
	unlk	a6
	rts
