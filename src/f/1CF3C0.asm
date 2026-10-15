; ---------------------------------------------------------------------------
; Gambit_PointNearBody_Type1 - Gambit_PointNearBody switch case: card type 1 (vertical): 25 px vertical margin
; In:  a4 = player, d4/d5 = y/x, d7 = horizontal margin
; Out: d0 = 1 inside
; Evidence: branch target of the type switch in Gambit_PointNearBody
; ---------------------------------------------------------------------------
Gambit_PointNearBody_Type1:
	moveq	#$19,d6
	bra.s	Gambit_PointNearBody_Test
loc_1CF3C4:
	moveq	#$28,d7
	bra.s	Gambit_PointNearBody_Test
loc_1CF3C8:
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.s	loc_1CF3D8
	moveq	#$7F,d6
	moveq	#$20,d7
	bra.s	Gambit_PointNearBody_Test
loc_1CF3D8:
	moveq	#$F,d6
	moveq	#$10,d7
	bra.s	Gambit_PointNearBody_Test
loc_1CF3DE:
	moveq	#$22,d7
	moveq	#$1A,d6
