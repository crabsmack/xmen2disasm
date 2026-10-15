; ---------------------------------------------------------------------------
; loc_1F6F92	[static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)]
; ---------------------------------------------------------------------------
loc_1F6F92:
	move.w	$4(a3),d0
	muls.w	$16(a4),d0
	neg.l	d0
	move.l	d0,d6
	asr.l	#$8,d6
	move.w	$16(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,d7
	bra.s	loc_1F6FDA
loc_1F6FAC:
	move.w	$16(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,d6
	move.w	$4(a3),d0
	muls.w	$18(a4),d0
	move.l	d0,d7
	asr.l	#$8,d7
	bra.s	loc_1F6FDA
loc_1F6FC4:
	move.w	$16(a4),d6
	move.w	$4(a3),d0
	muls.w	$18(a4),d0
	move.l	d0,d7
	asr.l	#$8,d7
	bra.s	loc_1F6FDA
