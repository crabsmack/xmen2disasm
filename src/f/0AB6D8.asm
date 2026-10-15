; ---------------------------------------------------------------------------
; FloatBubble_SetDirection_Right - FloatBubble_SetDirection case 2: right (accel +8/0)
; Evidence: switch target
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
FloatBubble_SetDirection_Right:
	move.w	#$8,$1E(a4)
	clr.w	$20(a4)
	tst.w	$16(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_0AB6F4
	move.w	$16(a4),d0
	ext.l	d0
	bra.s	loc_0AB6FC
loc_0AB6F4:
	move.w	$16(a4),d0
	ext.l	d0
	neg.l	d0
loc_0AB6FC:
	move.w	d0,$16(a4)
	clr.w	$18(a4)
	bra.s	FloatBubble_SetDirection_Done
