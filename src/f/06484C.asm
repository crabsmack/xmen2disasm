; ---------------------------------------------------------------------------
; PlayerSelect_LoadCharFrame_Wolverine - PlayerSelect_LoadCharFrame case 5 (Wolverine)
; In:  a3 = cursor
; Out: none
; Evidence: Sw_0647D0 entry 5: Wolverine_SelectSpriteDef
; ---------------------------------------------------------------------------
PlayerSelect_LoadCharFrame_Wolverine:
	jsr	$442A(a5)	; -> Wolverine_SelectSpriteDef
	movea.l	d0,a4
	jsr	$4432(a5)	; -> Wolverine_SelectFrame
	move.w	d0,d7
	bra.s	$64870
