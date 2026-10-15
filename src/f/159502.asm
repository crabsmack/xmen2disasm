; ---------------------------------------------------------------------------
; loc_159502	[static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)]
; ---------------------------------------------------------------------------
loc_159502:
	move.w	#$FFBB,(a4)
	move.w	#$1,(a3)
	movea.l	$14(a6),a0
	move.l	#$E100,(a0)
	movea.l	$18(a6),a0
	move.b	#$9,(a0)
	bra.w	loc_1595E4
loc_159520:
	move.w	#$FF9D,(a4)
	move.w	#$3B,(a3)
	movea.l	$14(a6),a0
	move.l	#$B400,(a0)
	movea.l	$18(a6),a0
	move.b	#$9,(a0)
	bra.w	loc_1595E4
loc_15953E:
	move.w	#$FFBB,(a4)
	move.w	#$6F,(a3)
	movea.l	$14(a6),a0
	move.l	#$8700,(a0)
	movea.l	$18(a6),a0
	move.b	#$9,(a0)
	bra.w	loc_1595E4
loc_15955C:
	move.w	#$FFF2,(a4)
	move.w	#$8F,(a3)
	movea.l	$14(a6),a0
	move.l	#$5A00,(a0)
	movea.l	$18(a6),a0
	move.b	#$9,(a0)
	bra.s	loc_1595E4
loc_159578:
	move.w	#$E,(a4)
	move.w	#$8F,(a3)
	movea.l	$14(a6),a0
	move.l	#$5A00,(a0)
	movea.l	$18(a6),a0
	move.b	#$A,(a0)
	bra.s	loc_1595E4
loc_159594:
	move.w	#$45,(a4)
	move.w	#$6F,(a3)
	movea.l	$14(a6),a0
	move.l	#$2D00,(a0)
	movea.l	$18(a6),a0
	move.b	#$A,(a0)
	bra.s	loc_1595E4
