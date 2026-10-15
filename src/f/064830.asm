; ---------------------------------------------------------------------------
; PlayerSelect_LoadCharFrame_Nightcrawler - PlayerSelect_LoadCharFrame case 3 (Nightcrawler)
; In:  a3 = cursor
; Out: none
; Evidence: Sw_0647D0 entry 3: Nightcrawler_SelectSpriteDef
; ---------------------------------------------------------------------------
PlayerSelect_LoadCharFrame_Nightcrawler:
	jsr	$453A(a5)	; -> Nightcrawler_SelectSpriteDef
	movea.l	d0,a4
	jsr	$4542(a5)	; -> Nightcrawler_SelectFrame
	move.w	d0,d7
	bra.s	$64870
