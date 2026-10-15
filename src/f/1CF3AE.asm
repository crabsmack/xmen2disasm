; ---------------------------------------------------------------------------
; Gambit_PointNearBody_Type0 - Gambit_PointNearBody switch case: card type 0 (horizontal): 50 px wide margin on the ground, 32 airborne
; In:  a4 = player, d4/d5 = y/x
; Out: d0 = 1 inside
; Evidence: branch target of the type switch in Gambit_PointNearBody
; ---------------------------------------------------------------------------
Gambit_PointNearBody_Type0:
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.s	loc_1CF3BC
	moveq	#$32,d7
	bra.s	Gambit_PointNearBody_Test
loc_1CF3BC:
	moveq	#$20,d7
	bra.s	Gambit_PointNearBody_Test
