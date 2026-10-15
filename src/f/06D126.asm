; ---------------------------------------------------------------------------
; Brood_Script - BROOD AI script entries: jmp Brood_ActCharge, jmp Brood_ActShoot
; In:  a4 = this
; Out: none
; Evidence: jmp thunk table
; ---------------------------------------------------------------------------
Brood_Script:
	jmp	$1072(a5)	; -> Brood_ActCharge
loc_06D12A:
	jmp	$106A(a5)	; -> Brood_ActShoot
