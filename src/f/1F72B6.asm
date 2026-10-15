; ---------------------------------------------------------------------------
; loc_1F72B6	[static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)]
; ---------------------------------------------------------------------------
loc_1F72B6:
	move.w	$C(a3),d0
	ext.l	d0
	move.l	$8(a4),d1
	asr.l	#$8,d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,$72(a4)
	bra.s	loc_1F72F6
loc_1F72CC:
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	$A(a3),d1
	ext.l	d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,$72(a4)
	bra.s	loc_1F72F6
loc_1F72E2:
	move.w	$E(a3),d0
	ext.l	d0
	move.l	$C(a4),d1
	asr.l	#$8,d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,$72(a4)
