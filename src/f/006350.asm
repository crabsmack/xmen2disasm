; ---------------------------------------------------------------------------
; loc_006350	[static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)]
; ---------------------------------------------------------------------------
loc_006350:
	jsr	Player2_SetBeast(pc)
	bra.s	$6372
loc_006356:
	jsr	Player2_SetCyclops(pc)
	bra.s	$6372
loc_00635C:
	jsr	Player2_SetGambit(pc)
	bra.s	$6372
loc_006362:
	jsr	Player2_SetNightcrawler(pc)
	bra.s	$6372
