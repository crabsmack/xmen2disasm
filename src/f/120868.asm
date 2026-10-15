; ---------------------------------------------------------------------------
; BasicBioSentinel_SizeOf - BasicBioSentinel: return the object size in bytes (class slot 0, +$06)
; In:  none
; Out: d0 = object size in bytes
; Evidence: method 0 of class descriptor $123562 (name string "BASICBIOSENTINEL", parent BIONPC)
; ---------------------------------------------------------------------------
BasicBioSentinel_SizeOf:
	link.w	a6,#$0
	move.l	#$96,d0
	unlk	a6
	rts
