; ---------------------------------------------------------------------------
; BaniMazaA2_AnimatePalettes_case4 - BaniMazaA2_AnimatePalettes case 4: band table jt $97A
; In:  none
; Out: a4 = table
; Evidence: target of Sw_04744E
; ---------------------------------------------------------------------------
BaniMazaA2_AnimatePalettes_case4:
	lea.l	$97A(a5),a0
	movea.l	$2(a0),a4
	bra.s	$4758E
