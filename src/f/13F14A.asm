; ---------------------------------------------------------------------------
; loc_13F14A	[static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)]
; ---------------------------------------------------------------------------
loc_13F14A:
	clr.w	$6C(a4)
	lea.l	sub_13F24C(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_13F1D4
loc_13F15E:
	clr.w	$6C(a4)
	lea.l	sub_13F21C(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_13F1D4
loc_13F172:
	clr.w	$6C(a4)
	lea.l	sub_13F1EC(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_13F1D4
loc_13F186:
	clr.w	$6C(a4)
	lea.l	sub_13F20C(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_13F1D4
loc_13F19A:
	clr.w	$6C(a4)
	lea.l	sub_13F1FC(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_13F1D4
