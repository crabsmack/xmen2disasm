; ---------------------------------------------------------------------------
; loc_118A74	[static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)]
; ---------------------------------------------------------------------------
loc_118A74:
	clr.l	$16(a4)
	bra.w	$118C3E
loc_118A7C:
	move.w	d6,$16(a4)
	move.w	d7,$18(a4)
	bra.w	$118C3E
