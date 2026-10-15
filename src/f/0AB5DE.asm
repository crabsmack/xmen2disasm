; ---------------------------------------------------------------------------
; FloatBubble_SetDirection_Left - FloatBubble_SetDirection case 6: left (accel -8/0)
; Evidence: switch target
; Found: static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)
; ---------------------------------------------------------------------------
FloatBubble_SetDirection_Left:
	move.w	#$FFF8,$1E(a4)
	clr.w	$20(a4)
	tst.w	$16(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_0AB5FA
	move.w	$16(a4),d0
	ext.l	d0
	bra.s	loc_0AB602
loc_0AB5FA:
	move.w	$16(a4),d0
	ext.l	d0
	neg.l	d0
loc_0AB602:
	neg.l	d0
	move.w	d0,$16(a4)
	clr.w	$18(a4)
	bra.w	FloatBubble_SetDirection_Done
loc_0AB610:
	move.w	#$FFF8,$1E(a4)
	move.w	#$8,$20(a4)
	tst.w	$16(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_0AB62E
	move.w	$16(a4),d0
	ext.l	d0
	bra.s	loc_0AB636
loc_0AB62E:
	move.w	$16(a4),d0
	ext.l	d0
	neg.l	d0
loc_0AB636:
	neg.l	d0
	move.w	d0,$16(a4)
	tst.w	$18(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_0AB64E
	move.w	$18(a4),d0
	ext.l	d0
	bra.s	loc_0AB656
loc_0AB64E:
	move.w	$18(a4),d0
	ext.l	d0
	neg.l	d0
loc_0AB656:
	move.w	d0,$18(a4)
	bra.w	FloatBubble_SetDirection_Done
