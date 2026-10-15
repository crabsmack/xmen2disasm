; ---------------------------------------------------------------------------
; SyncActor_GetSize - return sizeof(SYNCHRONIZEDACTOR object) = $8C bytes (class slot 0, +$06)
; In:  none
; Out: d0 = $8C
; Evidence: method 0 of class descriptor $119ECA (name string "SYNCHRONIZEDACTOR", parent ACTOR)
; ---------------------------------------------------------------------------
SyncActor_GetSize:
	link.w	a6,#$0
	move.l	#$8C,d0
	unlk	a6
	rts
