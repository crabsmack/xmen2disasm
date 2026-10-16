; ---------------------------------------------------------------------------
; SavageB1_SetParallax - SavageB1: install its parallax descriptor Tbl_SavageB1Parallax (jt $22FA) (Scroll_SetParallax)
; In:  none
; Out: none
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageB1_SetParallax:
	link.w	a6,#$0
	lea.l	$22FA(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$5102(a5)	; -> Scroll_SetParallax
	unlk	a6
	rts
