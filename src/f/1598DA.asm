; ---------------------------------------------------------------------------
; loc_1598DA	[static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)]
; ---------------------------------------------------------------------------
loc_1598DA:
	move.w	#$45,(a4)
	move.w	#$1,(a3)
	movea.l	$14(a6),a0
	move.l	#$13B00,(a0)
