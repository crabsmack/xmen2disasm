; ---------------------------------------------------------------------------
; PlayerSelect_LoadCharFrame_Psylocke - PlayerSelect_LoadCharFrame case 4 (Psylocke)
; In:  a3 = cursor
; Out: none
; Evidence: Sw_0647D0 entry 4: sub_1BA006
; ---------------------------------------------------------------------------
PlayerSelect_LoadCharFrame_Psylocke:
	jsr	$463A(a5)	; -> sub_1BA006
	movea.l	d0,a4
	jsr	$4642(a5)	; -> sub_1BA016
	move.w	d0,d7
	bra.s	$64870
