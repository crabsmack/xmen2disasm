; ---------------------------------------------------------------------------
; loc_05DF06	[static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)]
; ---------------------------------------------------------------------------
loc_05DF06:
	lea.l	sub_05D11C(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	bra.w	$5E044
