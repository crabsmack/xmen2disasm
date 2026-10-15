; ---------------------------------------------------------------------------
; PlayerSelect_CharFrameNum_Psylocke - PlayerSelect_CharFrameNum case 4 (Psylocke)
; In:  none
; Out: d7 = frame
; Evidence: Sw_064912 entry 4: sub_1BA016
; ---------------------------------------------------------------------------
PlayerSelect_CharFrameNum_Psylocke:
	jsr	$4642(a5)	; -> sub_1BA016
	move.w	d0,d7
	bra.s	$64980
