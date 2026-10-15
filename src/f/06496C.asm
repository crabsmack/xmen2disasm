; ---------------------------------------------------------------------------
; PlayerSelect_CharFrameNum_Wolverine - PlayerSelect_CharFrameNum case 5 (Wolverine)
; In:  none
; Out: d7 = frame
; Evidence: Sw_064912 entry 5: sub_197C32
; ---------------------------------------------------------------------------
PlayerSelect_CharFrameNum_Wolverine:
	jsr	$4432(a5)	; -> sub_197C32
	move.w	d0,d7
	bra.s	$64980
