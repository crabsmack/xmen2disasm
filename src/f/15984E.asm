; ---------------------------------------------------------------------------
; loc_15984E	[static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)]
; ---------------------------------------------------------------------------
loc_15984E:
	move.w	#$FFBB,(a4)
	move.w	#$1,(a3)
	movea.l	$14(a6),a0
	move.l	#$E100,(a0)
	bra.w	loc_1598EC
