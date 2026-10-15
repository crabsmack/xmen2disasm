; ---------------------------------------------------------------------------
; PlayerSelect_CharFrameNum_Psylocke - PlayerSelect_CharFrameNum case 4 (Psylocke)
; In:  none
; Out: d7 = frame
; Evidence: Sw_064912 entry 4: Psylocke_SelectFrame
; ---------------------------------------------------------------------------
PlayerSelect_CharFrameNum_Psylocke:
	jsr	$4642(a5)	; -> Psylocke_SelectFrame
	move.w	d0,d7
	bra.s	$64980
