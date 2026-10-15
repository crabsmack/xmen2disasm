; ---------------------------------------------------------------------------
; SavageC1_SetParallax - SavageC1: install its parallax descriptor $0C0D76 (Scroll_SetParallax)
; In:  none
; Out: none
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageC1_SetParallax:
	link.w	a6,#$0
	lea.l	$22F2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$5102(a5)	; -> Scroll_SetParallax
	unlk	a6
	rts
