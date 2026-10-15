; ---------------------------------------------------------------------------
; PlayerSelect_CharSpriteDef_Cyclops - PlayerSelect_CharSpriteDef cases 1-2 (Cyclops, Gambit)
; In:  none
; Out: a4 = sprite def
; Evidence: Sw_06489A entries 1, 2: Cyclops_SelectSpriteDef, Gambit_SelectSpriteDef
; ---------------------------------------------------------------------------
PlayerSelect_CharSpriteDef_Cyclops:
	jsr	$4B32(a5)	; -> Cyclops_SelectSpriteDef
	movea.l	d0,a4
	bra.s	$64908
loc_0648DC:
	jsr	$4992(a5)	; -> Gambit_SelectSpriteDef
	movea.l	d0,a4
	bra.s	$64908
