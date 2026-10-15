; ---------------------------------------------------------------------------
; FloatBubbleExplode_StateEnd - FLOATBUBBLEEXPLODE state: remove itself (slot +$52)
; In:  8(a6) = this
; Out: none
; Evidence: TAS 31639
; Found: link-after-rts
; ---------------------------------------------------------------------------
FloatBubbleExplode_StateEnd:
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
