; ---------------------------------------------------------------------------
; BigBio_SizeOf - BigBio: return the object size in bytes (class slot 0, +$06)
; In:  none
; Out: d0 = object size in bytes
; Evidence: method 0 of class descriptor $123684 (name string "BIGBIO", parent BASICBIOSENTINEL)
; ---------------------------------------------------------------------------
BigBio_SizeOf:
	link.w	a6,#$0
	move.l	#$BA,d0
	unlk	a6
	rts
