; ---------------------------------------------------------------------------
; PlayerSelect_CharFrameNum_Wolverine - PlayerSelect_CharFrameNum case 5 (Wolverine)
; In:  none
; Out: d7 = frame
; Evidence: Sw_064912 entry 5: Wolverine_SelectFrame
; ---------------------------------------------------------------------------
PlayerSelect_CharFrameNum_Wolverine:
	jsr	$4432(a5)	; -> Wolverine_SelectFrame
	move.w	d0,d7
	bra.s	$64980
