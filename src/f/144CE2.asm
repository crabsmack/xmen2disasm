; ---------------------------------------------------------------------------
; ToxicCanDamaged_GetSize - TOXICCANDAMAGED slot +$06: return sizeof = $92
; In:  none
; Out: d0 = $92
; Evidence: TOXICCANDAMAGED descriptor $144E08 (parent TOXICCAN)
; ---------------------------------------------------------------------------
ToxicCanDamaged_GetSize:
	link.w	a6,#$0
	move.l	#$92,d0
	unlk	a6
	rts
