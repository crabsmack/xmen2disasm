; ---------------------------------------------------------------------------
; loc_159410	[static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)]
; ---------------------------------------------------------------------------
loc_159410:
	move.w	#$FFBB,(a4)
	move.w	#$6F,(a3)
	movea.l	$14(a6),a0
	move.l	#$8700,(a0)
	movea.l	$18(a6),a0
	move.b	#$9,(a0)
	bra.w	loc_1594B6
loc_15942E:
	move.w	#$FFF0,(a4)
	move.w	#$84,(a3)
	movea.l	$14(a6),a0
	move.l	#$5A00,(a0)
	movea.l	$18(a6),a0
	move.b	#$C,(a0)
	bra.s	loc_1594B6
loc_15944A:
	move.w	#$10,(a4)
	move.w	#$84,(a3)
	movea.l	$14(a6),a0
	move.l	#$5A00,(a0)
	movea.l	$18(a6),a0
	move.b	#$C,(a0)
	bra.s	loc_1594B6
loc_159466:
	move.w	#$45,(a4)
	move.w	#$6F,(a3)
	movea.l	$14(a6),a0
	move.l	#$2D00,(a0)
	movea.l	$18(a6),a0
	move.b	#$A,(a0)
	bra.s	loc_1594B6
