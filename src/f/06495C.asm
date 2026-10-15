; ---------------------------------------------------------------------------
; PlayerSelect_CharFrameNum_Nightcrawler - PlayerSelect_CharFrameNum case 3 (Nightcrawler)
; In:  none
; Out: d7 = frame
; Evidence: Sw_064912 entry 3: sub_1A7CBC
; ---------------------------------------------------------------------------
PlayerSelect_CharFrameNum_Nightcrawler:
	jsr	$4542(a5)	; -> sub_1A7CBC
	move.w	d0,d7
	bra.s	$64980
