; ---------------------------------------------------------------------------
; PlayerSelect_CharFrameNum_Nightcrawler - PlayerSelect_CharFrameNum case 3 (Nightcrawler)
; In:  none
; Out: d7 = frame
; Evidence: Sw_064912 entry 3: Nightcrawler_SelectFrame
; ---------------------------------------------------------------------------
PlayerSelect_CharFrameNum_Nightcrawler:
	jsr	$4542(a5)	; -> Nightcrawler_SelectFrame
	move.w	d0,d7
	bra.s	$64980
