; ---------------------------------------------------------------------------
; BroodBossParts_GetSize - vtable +$06: return sizeof(BROODBOSSPARTS) = $90 bytes
; In:  none
; Out: d0 = $90
; Evidence: slot +$6 of the BROODBOSSPARTS descriptor $088B9E; never runs in the corpus
; ---------------------------------------------------------------------------
BroodBossParts_GetSize:
	link.w	a6,#$0
	move.l	#$90,d0
	unlk	a6
	rts
