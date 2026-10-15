; ---------------------------------------------------------------------------
; FloatBubble_SetDirection_Down - FloatBubble_SetDirection case 4: down (accel 0/+8)
; Evidence: switch target
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
FloatBubble_SetDirection_Down:
	clr.w	$1E(a4)
	move.w	#$8,$20(a4)
	clr.w	$16(a4)
	tst.w	$18(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_0AB67E
	move.w	$18(a4),d0
	ext.l	d0
	bra.s	loc_0AB686
loc_0AB67E:
	move.w	$18(a4),d0
	ext.l	d0
	neg.l	d0
loc_0AB686:
	move.w	d0,$18(a4)
	bra.w	FloatBubble_SetDirection_Done
