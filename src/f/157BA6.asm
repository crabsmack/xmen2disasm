; ---------------------------------------------------------------------------
; FluxBomb_GetSize - FLUXBOMB slot +$06: return sizeof(flux bomb) = $102
; In:  none
; Out: d0 = $102
; Evidence: FLUXBOMB descriptor $159AB4 (parent RTHETAOBJECT); 16 particles x 6 bytes at +$9E, +$FE held, +$FF strong, +$100 phase, +$101 burst counter
; ---------------------------------------------------------------------------
FluxBomb_GetSize:
	link.w	a6,#$0
	move.l	#$102,d0
	unlk	a6
	rts
