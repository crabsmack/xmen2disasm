; ---------------------------------------------------------------------------
; BaniMazaB2_SetParallax - install the BaniMazaB2 parallax descriptor
; In:  none
; Out: none
; Evidence: Scroll_SetParallax(jt $5A882); called by BaniMazaB2_RunScene
; ---------------------------------------------------------------------------
BaniMazaB2_SetParallax:
	link.w	a6,#$0
	lea.l	$C9A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$5102(a5)	; -> Scroll_SetParallax
	unlk	a6
	rts
