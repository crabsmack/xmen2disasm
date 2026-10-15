; ---------------------------------------------------------------------------
; PlayerSelect_CharSpriteDef_Nightcrawler - PlayerSelect_CharSpriteDef case 3 (Nightcrawler)
; In:  none
; Out: a4 = sprite def
; Evidence: Sw_06489A entry 3: Nightcrawler_SelectSpriteDef
; ---------------------------------------------------------------------------
PlayerSelect_CharSpriteDef_Nightcrawler:
	jsr	$453A(a5)	; -> Nightcrawler_SelectSpriteDef
	movea.l	d0,a4
	bra.s	$64908
