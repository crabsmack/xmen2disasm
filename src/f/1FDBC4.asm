; ---------------------------------------------------------------------------
; Scroll_SetParallax_Band2 - Scroll_SetParallax band type 2: no per-line step
; In:  a3, d7
; Out: none
; Evidence: target of Sw_1FDAEC entry 2: step = 0
; ---------------------------------------------------------------------------
Scroll_SetParallax_Band2:
	move.l	d7,d0
	asl.w	#$2,d0
	moveq	#$0,d1
	move.l	d1,(a3,d0.w)
	bra.s	$1FDBE6
