; ---------------------------------------------------------------------------
; loc_11C6BC	[static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)]
; ---------------------------------------------------------------------------
loc_11C6BC:
	clr.b	(a3)
	move.l	$A0(a4),d0
	asr.l	#$8,d0
