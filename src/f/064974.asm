; ---------------------------------------------------------------------------
; PlayerSelect_CharFrameNum_Magneto - PlayerSelect_CharFrameNum case 6 (Magneto)
; In:  none
; Out: d7 = frame
; Evidence: Sw_064912 entry 6: sub_1CEC38
; ---------------------------------------------------------------------------
PlayerSelect_CharFrameNum_Magneto:
	jsr	$484A(a5)	; -> sub_1CEC38
	move.w	d0,d7
	bra.s	$64980
