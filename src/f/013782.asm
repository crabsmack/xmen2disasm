; ---------------------------------------------------------------------------
; CapedAcolyte_OnHurt_KnockRight - CapedAcolyte_OnHurt switch case 10: knock to the right (+$16 = $30C)
; In:  a4 = this
; Out: none
; Evidence: switch case target
; ---------------------------------------------------------------------------
CapedAcolyte_OnHurt_KnockRight:
	move.w	#$30C,$16(a4)
