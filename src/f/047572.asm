; ---------------------------------------------------------------------------
; BaniMazaA2_AnimatePalettes_case3 - BaniMazaA2_AnimatePalettes case 3: band table jt $972
; In:  none
; Out: a4 = table
; Evidence: target of Sw_04744E
; ---------------------------------------------------------------------------
BaniMazaA2_AnimatePalettes_case3:
	lea.l	$972(a5),a0
	movea.l	$2(a0),a4
	bra.s	$4758E
