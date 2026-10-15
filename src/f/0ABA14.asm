; ---------------------------------------------------------------------------
; FloatBubble_StateWobble3 - FLOATBUBBLE wobble: frame 8 for 10 frames
; In:  8(a6) = this
; Out: d0
; Found: link-after-rts
; ---------------------------------------------------------------------------
FloatBubble_StateWobble3:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$8,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	move.w	#$A,$6C(a4)
	lea.l	FloatBubble_StateWobble1(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
