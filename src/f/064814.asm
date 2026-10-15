; ---------------------------------------------------------------------------
; PlayerSelect_LoadCharFrame_Cyclops - PlayerSelect_LoadCharFrame cases 1-2 (Cyclops, Gambit)
; In:  a3 = cursor
; Out: none
; Evidence: Sw_0647D0 entries 1 and 2: Cyclops_SelectSpriteDef, Gambit_SelectSpriteDef
; ---------------------------------------------------------------------------
PlayerSelect_LoadCharFrame_Cyclops:
	jsr	$4B32(a5)	; -> Cyclops_SelectSpriteDef
	movea.l	d0,a4
	jsr	$4B3A(a5)	; -> Cyclops_SelectFrame
	move.w	d0,d7
	bra.s	$64870
loc_064822:
	jsr	$4992(a5)	; -> Gambit_SelectSpriteDef
	movea.l	d0,a4
	jsr	$499A(a5)	; -> Gambit_SelectFrame
	move.w	d0,d7
	bra.s	$64870
