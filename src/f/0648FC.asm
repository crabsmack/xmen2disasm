; ---------------------------------------------------------------------------
; PlayerSelect_CharSpriteDef_Magneto - PlayerSelect_CharSpriteDef case 6 (Magneto)
; In:  none
; Out: a4 = sprite def
; Evidence: Sw_06489A entry 6: sub_1CEC28
; ---------------------------------------------------------------------------
PlayerSelect_CharSpriteDef_Magneto:
	jsr	$4842(a5)	; -> sub_1CEC28
	movea.l	d0,a4
	bra.s	$64908
