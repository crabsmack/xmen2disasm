; ---------------------------------------------------------------------------
; BroodBossDamage_GetSize - vtable +$06: return sizeof(BROODBOSSDAMAGE) = $96 bytes
; In:  none
; Out: d0 = $96
; Evidence: slot +$6 of the BROODBOSSDAMAGE descriptor $088CF0; never runs in the corpus
; ---------------------------------------------------------------------------
BroodBossDamage_GetSize:
	link.w	a6,#$0
	move.l	#$96,d0
	unlk	a6
	rts
