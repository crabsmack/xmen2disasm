; ---------------------------------------------------------------------------
; loc_142F2A	[static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)]
; ---------------------------------------------------------------------------
loc_142F2A:
	ori.b	#$20,$E(a3)
	move.b	#$4,$F(a3)
	bra.s	loc_142F70
