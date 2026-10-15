; ---------------------------------------------------------------------------
; PlayerSelect_LoadCharFrame_Psylocke - PlayerSelect_LoadCharFrame case 4 (Psylocke)
; In:  a3 = cursor
; Out: none
; Evidence: Sw_0647D0 entry 4: Psylocke_SelectSpriteDef
; ---------------------------------------------------------------------------
PlayerSelect_LoadCharFrame_Psylocke:
	jsr	$463A(a5)	; -> Psylocke_SelectSpriteDef
	movea.l	d0,a4
	jsr	$4642(a5)	; -> Psylocke_SelectFrame
	move.w	d0,d7
	bra.s	$64870
