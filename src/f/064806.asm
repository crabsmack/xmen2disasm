; ---------------------------------------------------------------------------
; PlayerSelect_LoadCharFrame_Beast - PlayerSelect_LoadCharFrame case 0 (Beast)
; In:  a3 = cursor
; Out: none
; Evidence: Sw_0647D0 entry 0: Beast_SelectSpriteDef / Beast_SelectFrame
; ---------------------------------------------------------------------------
PlayerSelect_LoadCharFrame_Beast:
	jsr	$432A(a5)	; -> Beast_SelectSpriteDef
	movea.l	d0,a4
	jsr	$4332(a5)	; -> Beast_SelectFrame
	move.w	d0,d7
	bra.s	$64870
