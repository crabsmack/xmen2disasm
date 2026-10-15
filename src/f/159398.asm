; ---------------------------------------------------------------------------
; loc_159398	[static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)]
; ---------------------------------------------------------------------------
loc_159398:
	move.w	#$FFEC,(a4)
	move.w	#$FFEE,(a3)
	movea.l	$14(a6),a0
	move.l	#$10E00,(a0)
	movea.l	$18(a6),a0
	move.b	#$B,(a0)
	bra.w	loc_1594B6
