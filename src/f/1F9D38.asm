; ---------------------------------------------------------------------------
; Timer_Free - free a timer; it is unlinked at the end of the next Timer_RunAll pass
; In:  8(a6) = timer pointer (null ignored)
; Out: none
; Evidence: state = -1; Timer_RunAll's second loop unlinks -1 slots and sets them to -3 (free); callers then clear their stored pointer
; ---------------------------------------------------------------------------
Timer_Free:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,d0
	beq.s	loc_1F9D4A
	move.w	#$FFFF,(a4)
loc_1F9D4A:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
