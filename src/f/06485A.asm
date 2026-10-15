; ---------------------------------------------------------------------------
; PlayerSelect_LoadCharFrame_Magneto - PlayerSelect_LoadCharFrame case 6 (Magneto)
; In:  a3 = cursor
; Out: none
; Evidence: Sw_0647D0 entry 6: Magneto_SelectSpriteDef
; ---------------------------------------------------------------------------
PlayerSelect_LoadCharFrame_Magneto:
	jsr	$4842(a5)	; -> Magneto_SelectSpriteDef
	movea.l	d0,a4
	jsr	$484A(a5)	; -> Magneto_SelectFrame
	move.w	d0,d7
	bra.s	$64870
