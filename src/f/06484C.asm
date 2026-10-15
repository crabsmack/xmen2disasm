; ---------------------------------------------------------------------------
; PlayerSelect_LoadCharFrame_Wolverine - PlayerSelect_LoadCharFrame case 5 (Wolverine)
; In:  a3 = cursor
; Out: none
; Evidence: Sw_0647D0 entry 5: sub_197C22
; ---------------------------------------------------------------------------
PlayerSelect_LoadCharFrame_Wolverine:
	jsr	$442A(a5)	; -> sub_197C22
	movea.l	d0,a4
	jsr	$4432(a5)	; -> sub_197C32
	move.w	d0,d7
	bra.s	$64870
