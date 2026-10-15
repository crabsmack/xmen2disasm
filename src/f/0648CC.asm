; ---------------------------------------------------------------------------
; PlayerSelect_CharSpriteDef_Beast - PlayerSelect_CharSpriteDef case 0 (Beast)
; In:  none
; Out: a4 = sprite def
; Evidence: Sw_06489A entry 0: Beast_SelectSpriteDef
; ---------------------------------------------------------------------------
PlayerSelect_CharSpriteDef_Beast:
	jsr	$432A(a5)	; -> Beast_SelectSpriteDef
	movea.l	d0,a4
	bra.s	$64908
