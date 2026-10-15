; ---------------------------------------------------------------------------
; loc_143136	[static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)]
; ---------------------------------------------------------------------------
loc_143136:
	move.w	#$FFD5,-$4(a6)
	move.w	#$FFE5,-$2(a6)
	move.w	#$FD70,d4
	move.w	#$FD70,d5
	moveq	#-$A,d6
	moveq	#-$A,d7
	bra.w	loc_1431D6
