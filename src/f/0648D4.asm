; ---------------------------------------------------------------------------
; PlayerSelect_CharSpriteDef_Cyclops - PlayerSelect_CharSpriteDef cases 1-2 (Cyclops, Gambit)
; In:  none
; Out: a4 = sprite def
; Evidence: Sw_06489A entries 1, 2: sub_1E3C5A, sub_1D0744
; ---------------------------------------------------------------------------
PlayerSelect_CharSpriteDef_Cyclops:
	jsr	$4B32(a5)	; -> sub_1E3C5A
	movea.l	d0,a4
	bra.s	$64908
loc_0648DC:
	jsr	$4992(a5)	; -> sub_1D0744
	movea.l	d0,a4
	bra.s	$64908
