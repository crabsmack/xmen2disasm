; ---------------------------------------------------------------------------
; PlayerSelect_CharSpriteDef_Wolverine - PlayerSelect_CharSpriteDef case 5 (Wolverine)
; In:  none
; Out: a4 = sprite def
; Evidence: Sw_06489A entry 5: Wolverine_SelectSpriteDef
; ---------------------------------------------------------------------------
PlayerSelect_CharSpriteDef_Wolverine:
	jsr	$442A(a5)	; -> Wolverine_SelectSpriteDef
	movea.l	d0,a4
	bra.s	$64908
