; ---------------------------------------------------------------------------
; PlayerSelect_CharFrameNum_Beast - PlayerSelect_CharFrameNum case 0 (Beast)
; In:  none
; Out: d7 = frame
; Evidence: Sw_064912 entry 0: Beast_SelectFrame
; ---------------------------------------------------------------------------
PlayerSelect_CharFrameNum_Beast:
	jsr	$4332(a5)	; -> Beast_SelectFrame
	move.w	d0,d7
	bra.s	$64980
