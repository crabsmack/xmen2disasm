; ---------------------------------------------------------------------------
; Wolverine_GetSize - WOLVERINE slot +$06: return sizeof(Wolverine object) = $C6
; In:  none
; Out: d0 = $C6
; Evidence: WOLVERINE descriptor $11369A; XCLIMBER $C2 + claw-phase byte +$C2 and heal timer +$C4
; ---------------------------------------------------------------------------
Wolverine_GetSize:
	link.w	a6,#$0
	move.l	#$C6,d0
	unlk	a6
	rts
