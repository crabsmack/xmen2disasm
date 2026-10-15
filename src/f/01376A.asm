; ---------------------------------------------------------------------------
; CapedAcolyte_OnHurt_KnockY - CapedAcolyte_OnHurt switch cases 12/11/9: set vertical or leftward knockback velocity
; In:  a4 = this
; Out: none
; Evidence: +$18 = -$30C / +$30C, +$16 = -$30C
; ---------------------------------------------------------------------------
CapedAcolyte_OnHurt_KnockY:
	move.w	#$FCF4,$18(a4)
	bra.s	CapedAcolyte_OnHurt_SetDecel
loc_013772:
	move.w	#$30C,$18(a4)
	bra.s	CapedAcolyte_OnHurt_SetDecel
loc_01377A:
	move.w	#$FCF4,$16(a4)
	bra.s	CapedAcolyte_OnHurt_SetDecel
