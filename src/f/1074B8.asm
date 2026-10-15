; ---------------------------------------------------------------------------
; SpaceB1_CyclePalettes_SetB - case of SpaceB1_CyclePalettes (second cycle): set colour $8E0, then advance
; In:  a4 = palette base
; Out: -
; Evidence: switch target from Sw_10746C
; ---------------------------------------------------------------------------
SpaceB1_CyclePalettes_SetB:
	move.w	#$8E0,$1E(a4)
	bra.s	SpaceB1_CyclePalettes_NextB
loc_1074C0:
	move.w	#$4A0,$1E(a4)
	bra.s	SpaceB1_CyclePalettes_NextB
loc_1074C8:
	move.w	#$80,$1E(a4)
	bra.s	SpaceB1_CyclePalettes_NextB
loc_1074D0:
	move.w	#$40,$1E(a4)
	bra.s	SpaceB1_CyclePalettes_NextB
loc_1074D8:
	clr.w	$1E(a4)
	bra.s	SpaceB1_CyclePalettes_NextB
loc_1074DE:
	move.w	#$40,$1E(a4)
	bra.s	SpaceB1_CyclePalettes_NextB
loc_1074E6:
	move.w	#$80,$1E(a4)
	bra.s	SpaceB1_CyclePalettes_NextB
loc_1074EE:
	move.w	#$4A0,$1E(a4)
