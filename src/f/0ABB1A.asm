; ---------------------------------------------------------------------------
; FloatBubble_StateBurst - FLOATBUBBLE state: burst into a FLOATBUBBLEEXPLODE and remove itself
; In:  8(a6) = this
; Out: none
; Evidence: FloatBubbleExplode_Spawn(x, y), slot +$52; set by FloatBubble_TakeDamage/Attack; TAS 31607
; Found: link-after-rts
; ---------------------------------------------------------------------------
FloatBubble_StateBurst:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a4),-(a7)
	move.l	$8(a4),-(a7)
	jsr	$1B8A(a5)	; -> FloatBubbleExplode_Spawn
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
