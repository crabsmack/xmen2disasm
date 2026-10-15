; ---------------------------------------------------------------------------
; BaniMazaA2_AnimatePalettes_cases - BaniMazaA2_AnimatePalettes switch cases 0-2: pick a colour band table (jt $962/$96A/...)
; In:  none
; Out: a4 = table
; Evidence: targets of Sw_04744E
; ---------------------------------------------------------------------------
BaniMazaA2_AnimatePalettes_cases:
	lea.l	$962(a5),a0
	movea.l	$2(a0),a4
	bra.s	$4758E
loc_047568:
	lea.l	$96A(a5),a0
	movea.l	$2(a0),a4
	bra.s	$4758E
