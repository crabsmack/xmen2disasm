; ---------------------------------------------------------------------------
; SpaceB1_CyclePalettes_SetA - case of SpaceB1_CyclePalettes (first cycle): set colour $E4E, then advance
; In:  a4 = palette base
; Out: -
; Evidence: switch target from Sw_1073A8
; ---------------------------------------------------------------------------
SpaceB1_CyclePalettes_SetA:
	move.w	#$E4E,$18(a4)
	bra.s	SpaceB1_CyclePalettes_NextA
loc_107408:
	move.w	#$C2C,$18(a4)
	bra.s	SpaceB1_CyclePalettes_NextA
loc_107410:
	move.w	#$A0A,$18(a4)
	bra.s	SpaceB1_CyclePalettes_NextA
loc_107418:
	move.w	#$808,$18(a4)
	bra.s	SpaceB1_CyclePalettes_NextA
loc_107420:
	move.w	#$606,$18(a4)
	bra.s	SpaceB1_CyclePalettes_NextA
loc_107428:
	move.w	#$404,$18(a4)
	bra.s	SpaceB1_CyclePalettes_NextA
loc_107430:
	move.w	#$202,$18(a4)
	bra.s	SpaceB1_CyclePalettes_NextA
loc_107438:
	clr.w	$18(a4)
	bra.s	SpaceB1_CyclePalettes_NextA
loc_10743E:
	move.w	#$202,$18(a4)
	bra.s	SpaceB1_CyclePalettes_NextA
loc_107446:
	move.w	#$404,$18(a4)
	bra.s	SpaceB1_CyclePalettes_NextA
loc_10744E:
	move.w	#$606,$18(a4)
	bra.s	SpaceB1_CyclePalettes_NextA
loc_107456:
	move.w	#$808,$18(a4)
	bra.s	SpaceB1_CyclePalettes_NextA
loc_10745E:
	move.w	#$A0A,$18(a4)
	bra.s	SpaceB1_CyclePalettes_NextA
loc_107466:
	move.w	#$C2C,$18(a4)
