; ---------------------------------------------------------------------------
; Math_MulFix8 - multiply two unsigned words and drop 8 fraction bits
; In:  8(a6) = word a   $C(a6) = word b
; Out: d0 = long: (a * b) >> 8
; Evidence: mulu.w then lsr.l #8; Scroll_SetParallax scales band values by $1000 with it
; ---------------------------------------------------------------------------
Math_MulFix8:
	link.w	a6,#$0
	move.w	$E(a6),d0
	mulu.w	$A(a6),d0
	lsr.l	#$8,d0
	unlk	a6
	rts
