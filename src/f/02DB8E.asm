; ---------------------------------------------------------------------------
; loc_02DB8E	[static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)]
; ---------------------------------------------------------------------------
loc_02DB8E:
	move.l	a4,-(a7)
	jsr	$3ADA(a5)	; -> sub_13E30E
	addq.w	#$4,a7
	bra.s	loc_02DBC6
