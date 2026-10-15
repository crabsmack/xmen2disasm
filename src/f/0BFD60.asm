; ---------------------------------------------------------------------------
; SwampPlatform_GetSize - vtable +$06: return sizeof(SWAMPPLATFORM) = $9C bytes
; In:  none
; Out: d0 = $9C
; Evidence: slot +$6 of the SWAMPPLATFORM descriptor $0C005A; never runs in the corpus
; ---------------------------------------------------------------------------
SwampPlatform_GetSize:
	link.w	a6,#$0
	move.l	#$9C,d0
	unlk	a6
	rts
