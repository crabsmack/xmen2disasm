; ---------------------------------------------------------------------------
; BasicBioSentinel_GetSize - return sizeof(BASICBIOSENTINEL object) = $96 bytes (class slot 0, +$06)
; In:  none
; Out: d0 = $96
; Evidence: method 0 of class descriptor $123562 (name string "BASICBIOSENTINEL", parent BIONPC)
; ---------------------------------------------------------------------------
BasicBioSentinel_GetSize:
	link.w	a6,#$0
	move.l	#$96,d0
	unlk	a6
	rts
