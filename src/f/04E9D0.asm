; ---------------------------------------------------------------------------
; loc_04E9D0	[static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)]
; ---------------------------------------------------------------------------
loc_04E9D0:
	ori.w	#$2,$92(a4)
	move.w	#$64,$9E(a4)
	bra.s	loc_04E9EA
loc_04E9DE:
	ori.w	#$2,$92(a4)
	move.w	#$C8,$9E(a4)
