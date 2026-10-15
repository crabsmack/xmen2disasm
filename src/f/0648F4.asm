; ---------------------------------------------------------------------------
; PlayerSelect_CharSpriteDef_Wolverine - PlayerSelect_CharSpriteDef case 5 (Wolverine)
; In:  none
; Out: a4 = sprite def
; Evidence: Sw_06489A entry 5: sub_197C22
; ---------------------------------------------------------------------------
PlayerSelect_CharSpriteDef_Wolverine:
	jsr	$442A(a5)	; -> sub_197C22
	movea.l	d0,a4
	bra.s	$64908
