; ---------------------------------------------------------------------------
; BroodBossDamage_Draw - empty: returns at once (this class's override of: draw a BROODBOSSDAMAGE)
; In:  8(a6) = this
; Evidence: slot +$1A of the BROODBOSSDAMAGE descriptor $088CF0; TAS frames 49417-50570 (580 frames active)
; ---------------------------------------------------------------------------
BroodBossDamage_Draw:
	link.w	a6,#$0
	unlk	a6
	rts
