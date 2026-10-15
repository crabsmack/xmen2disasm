; ---------------------------------------------------------------------------
; FloatBubbleExplode_Spawn - create a FLOATBUBBLEEXPLODE at (x, y)
; In:  8(a6) = long x, $C(a6) = long y
; Out: none
; Evidence: Tbl_FloatBubbleExplode_vtable +$0E New; jt 877; caller FloatBubble_StateBurst
; Found: jt 877
; ---------------------------------------------------------------------------
FloatBubbleExplode_Spawn:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	$C(a6),-(a7)
	move.l	$8(a6),-(a7)
	lea.l	$1B7A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	lea.l	$1B7A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	unlk	a6
	rts
