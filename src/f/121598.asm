; ---------------------------------------------------------------------------
; BigBio_GetSize - return sizeof(BIGBIO object) = $BA bytes (class slot 0, +$06)
; In:  none
; Out: d0 = $BA
; Evidence: method 0 of class descriptor $123684 (name string "BIGBIO", parent BASICBIOSENTINEL)
; ---------------------------------------------------------------------------
BigBio_GetSize:
	link.w	a6,#$0
	move.l	#$BA,d0
	unlk	a6
	rts
