; ---------------------------------------------------------------------------
; PlayerSelect_CharFrameNum_Cyclops - PlayerSelect_CharFrameNum cases 1-2 (Cyclops, Gambit)
; In:  none
; Out: d7 = frame
; Evidence: Sw_064912 entries 1, 2: Cyclops_SelectFrame, Gambit_SelectFrame
; ---------------------------------------------------------------------------
PlayerSelect_CharFrameNum_Cyclops:
	jsr	$4B3A(a5)	; -> Cyclops_SelectFrame
	move.w	d0,d7
	bra.s	$64980
loc_064954:
	jsr	$499A(a5)	; -> Gambit_SelectFrame
	move.w	d0,d7
	bra.s	$64980
