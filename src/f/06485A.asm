; ---------------------------------------------------------------------------
; PlayerSelect_LoadCharFrame_Magneto - PlayerSelect_LoadCharFrame case 6 (Magneto)
; In:  a3 = cursor
; Out: none
; Evidence: Sw_0647D0 entry 6: sub_1CEC28
; ---------------------------------------------------------------------------
PlayerSelect_LoadCharFrame_Magneto:
	jsr	$4842(a5)	; -> sub_1CEC28
	movea.l	d0,a4
	jsr	$484A(a5)	; -> sub_1CEC38
	move.w	d0,d7
	bra.s	$64870
