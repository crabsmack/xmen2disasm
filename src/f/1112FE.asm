; ---------------------------------------------------------------------------
; Deathbird_MovePolar_Case0	[static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)]
; ---------------------------------------------------------------------------
Deathbird_MovePolar_Case0:
	movea.l	$28(a6),a0
	clr.w	(a0)
	movea.l	$2C(a6),a0
	clr.w	(a0)
	bra.w	$111510
loc_11130E:
	movea.l	$28(a6),a0
	move.w	d6,(a0)
	movea.l	$2C(a6),a0
	move.w	d7,(a0)
	bra.w	$111510
loc_11131E:
	move.l	d6,d0
	lsl.l	#$1,d0
	movea.l	$28(a6),a0
	move.w	d0,(a0)
	move.l	d7,d0
	lsl.l	#$1,d0
	movea.l	$2C(a6),a0
	move.w	d0,(a0)
	bra.w	$111510
