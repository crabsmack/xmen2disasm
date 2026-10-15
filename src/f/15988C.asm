; ---------------------------------------------------------------------------
; loc_15988C	[static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)]
; ---------------------------------------------------------------------------
loc_15988C:
	move.w	#$FFF0,(a4)
	move.w	#$79,(a3)
	movea.l	$14(a6),a0
	move.l	#$5A00,(a0)
	bra.s	loc_1598EC
loc_1598A0:
	move.w	#$10,(a4)
	move.w	#$79,(a3)
	movea.l	$14(a6),a0
	move.l	#$5A00,(a0)
	bra.s	loc_1598EC
loc_1598B4:
	move.w	#$3D,(a4)
	move.w	#$67,(a3)
	movea.l	$14(a6),a0
	move.l	#$2D00,(a0)
	bra.s	loc_1598EC
