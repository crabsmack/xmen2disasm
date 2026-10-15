; ---------------------------------------------------------------------------
; loc_1CF3C0	[static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)]
; ---------------------------------------------------------------------------
loc_1CF3C0:
	moveq	#$19,d6
	bra.s	loc_1CF3E2
loc_1CF3C4:
	moveq	#$28,d7
	bra.s	loc_1CF3E2
loc_1CF3C8:
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.s	loc_1CF3D8
	moveq	#$7F,d6
	moveq	#$20,d7
	bra.s	loc_1CF3E2
loc_1CF3D8:
	moveq	#$F,d6
	moveq	#$10,d7
	bra.s	loc_1CF3E2
loc_1CF3DE:
	moveq	#$22,d7
	moveq	#$1A,d6
