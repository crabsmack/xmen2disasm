; ---------------------------------------------------------------------------
; loc_01376A	[static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)]
; ---------------------------------------------------------------------------
loc_01376A:
	move.w	#$FCF4,$18(a4)
	bra.s	loc_013788
loc_013772:
	move.w	#$30C,$18(a4)
	bra.s	loc_013788
loc_01377A:
	move.w	#$FCF4,$16(a4)
	bra.s	loc_013788
