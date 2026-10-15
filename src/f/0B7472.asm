; ---------------------------------------------------------------------------
; loc_0B7472	[static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)]
; ---------------------------------------------------------------------------
loc_0B7472:
	move.w	#$FB00,$18(a4)
	bra.s	loc_0B7490
loc_0B747A:
	move.w	#$500,$18(a4)
	bra.s	loc_0B7490
