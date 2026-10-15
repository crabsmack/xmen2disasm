; ---------------------------------------------------------------------------
; loc_02CF34	[static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)]
; ---------------------------------------------------------------------------
loc_02CF34:
	addq.b	#$1,$A9(a4)
	move.b	$A9(a4),d0
	subq.b	#$1,d0
	bcs.w	loc_02CFE8
	cmpi.b	#$5,d0
	bhi.w	loc_02CFE8
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_02CF34(pc,d1.w),d1
	jmp	Sw_02CF34-2(pc,d1.w)
