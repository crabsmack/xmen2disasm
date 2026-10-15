; ---------------------------------------------------------------------------
; Scroll_SetParallax_Gradient - Scroll_SetParallax band type 1: per-line speed step interpolating from the band's start to end factor
; In:  a4 = band record {byte type, byte, word lines, word start, word end}, d7 = band index
; Out: none
; Evidence: target of Sw_1FDAEC entry 1: (end*$1000 - start*$1000) >> 8 / (lines - 1) via Math_MulFix8 / Math_LDivS
; ---------------------------------------------------------------------------
Scroll_SetParallax_Gradient:
	move.w	$4(a4),d5
	move.l	a4,-$6(a6)
	movea.l	a4,a0
	move.w	$6(a0),d6
	move.w	$2(a0),d4
	subq.w	#$1,d4
	ext.l	d6
	move.l	d6,-(a7)
	pea.l	($1000).w
	jsr	$4E3A(a5)	; -> Math_MulFix8
	move.l	d0,-$A(a6)
	ext.l	d5
	move.l	d5,-(a7)
	pea.l	($1000).w
	jsr	$4E3A(a5)	; -> Math_MulFix8
	move.l	-$A(a6),d1
	sub.l	d0,d1
	ext.l	d4
	move.l	d1,d0
	move.l	d4,d1
	jsr	$3FA2(a5)	; -> Math_LDivS
	move.l	d7,d1
	asl.w	#$2,d1
	move.l	d0,(a3,d1.w)
	lea.l	$10(a7),a7
	bra.s	$1FDBE6
