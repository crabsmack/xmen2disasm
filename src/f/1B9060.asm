; ---------------------------------------------------------------------------
; Psylocke_GetSize - PSYLOCKE slot +$06: return sizeof(Psylocke object) = $DA
; In:  none
; Out: d0 = $DA
; Evidence: PSYLOCKE descriptor $11359A; XCLIMBER $C2 + effect sprite instance at +$C6
; ---------------------------------------------------------------------------
Psylocke_GetSize:
	link.w	a6,#$0
	move.l	#$DA,d0
	unlk	a6
	rts
