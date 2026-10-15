; ---------------------------------------------------------------------------
; FloatBubble_SetDirection_DownRight - FloatBubble_SetDirection case 3: down-right (accel +8/+8)
; Evidence: switch target
; Found: static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)
; ---------------------------------------------------------------------------
FloatBubble_SetDirection_DownRight:
	move.w	#$8,$1E(a4)
	move.w	#$8,$20(a4)
	tst.w	$16(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_0AB6AC
	move.w	$16(a4),d0
	ext.l	d0
	bra.s	loc_0AB6B4
loc_0AB6AC:
	move.w	$16(a4),d0
	ext.l	d0
	neg.l	d0
loc_0AB6B4:
	move.w	d0,$16(a4)
	tst.w	$18(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_0AB6CA
	move.w	$18(a4),d0
	ext.l	d0
	bra.s	loc_0AB6D2
loc_0AB6CA:
	move.w	$18(a4),d0
	ext.l	d0
	neg.l	d0
loc_0AB6D2:
	move.w	d0,$18(a4)
	bra.s	FloatBubble_SetDirection_Done
