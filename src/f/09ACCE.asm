; ---------------------------------------------------------------------------
; BroodClaw_GetSize - vtable +$06: return sizeof(BROODCLAW) = $A2 bytes
; In:  none
; Out: d0 = $A2
; Evidence: slot +$6 of the BROODCLAW descriptor $09B98C; never runs in the corpus
; ---------------------------------------------------------------------------
BroodClaw_GetSize:
	link.w	a6,#$0
	move.l	#$A2,d0
	unlk	a6
	rts
