; ---------------------------------------------------------------------------
; PlayerSelect_CharSpriteDef_Psylocke - PlayerSelect_CharSpriteDef case 4 (Psylocke)
; In:  none
; Out: a4 = sprite def
; Evidence: Sw_06489A entry 4: sub_1BA006
; ---------------------------------------------------------------------------
PlayerSelect_CharSpriteDef_Psylocke:
	jsr	$463A(a5)	; -> sub_1BA006
	movea.l	d0,a4
	bra.s	$64908
