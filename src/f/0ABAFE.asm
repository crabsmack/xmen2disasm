; ---------------------------------------------------------------------------
; FloatBubble_StatePopEnd - FLOATBUBBLE pop: remove itself (slot +$52 Kill)
; In:  8(a6) = this
; Out: none
; Found: link-after-rts
; ---------------------------------------------------------------------------
FloatBubble_StatePopEnd:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
