; ---------------------------------------------------------------------------
; ToxicCan_GetSize - TOXICCAN slot +$06: return sizeof = $92
; In:  none
; Out: d0 = $92
; Evidence: TOXICCAN descriptor $144D90
; ---------------------------------------------------------------------------
ToxicCan_GetSize:
	link.w	a6,#$0
	move.l	#$92,d0
	unlk	a6
	rts
