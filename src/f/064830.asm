; ---------------------------------------------------------------------------
; PlayerSelect_LoadCharFrame_Nightcrawler - PlayerSelect_LoadCharFrame case 3 (Nightcrawler)
; In:  a3 = cursor
; Out: none
; Evidence: Sw_0647D0 entry 3: sub_1A7CAC
; ---------------------------------------------------------------------------
PlayerSelect_LoadCharFrame_Nightcrawler:
	jsr	$453A(a5)	; -> sub_1A7CAC
	movea.l	d0,a4
	jsr	$4542(a5)	; -> sub_1A7CBC
	move.w	d0,d7
	bra.s	$64870
