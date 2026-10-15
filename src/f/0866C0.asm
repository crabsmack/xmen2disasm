; ---------------------------------------------------------------------------
; BroodBoss_GetSize - vtable +$06: return sizeof(BROODBOSS) = $A6 bytes
; In:  none
; Out: d0 = $A6
; Evidence: slot +$6 of the BROODBOSS descriptor $088D6E; never runs in the corpus
; ---------------------------------------------------------------------------
BroodBoss_GetSize:
	link.w	a6,#$0
	move.l	#$A6,d0
	unlk	a6
	rts
