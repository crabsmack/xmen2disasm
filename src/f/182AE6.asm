; ---------------------------------------------------------------------------
; Beast_GetSize - BEAST slot +$06: return sizeof(Beast object) = $DC
; In:  none
; Out: d0 = $DC
; Evidence: BEAST descriptor $11339A slot +$06 (XCLIMBER $C2 + shockwave fields +$C2..+$DB)
; ---------------------------------------------------------------------------
Beast_GetSize:
	link.w	a6,#$0
	move.l	#$DC,d0
	unlk	a6
	rts
