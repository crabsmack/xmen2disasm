; ---------------------------------------------------------------------------
; Elevator_Toggle - Elevator: reverse direction (acceleration -$40/+$40) unless the 26-frame cooldown runs
; In:  8(a6) = this
; Out: none
; Evidence: method 3 of ELEVATOR; called through vtable +$12 by SpaceElev_SwitchTileHit
; ---------------------------------------------------------------------------
Elevator_Toggle:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$12(a4)
	bgt.s	loc_10B6B4
	move.w	#$1A,$12(a4)
	tst.b	$10(a4)
	seq.b	d3
	neg.b	d3
	move.b	d3,$10(a4)
	tst.b	$11(a4)
	beq.s	loc_10B6A0
	clr.b	$11(a4)
loc_10B6A0:
	tst.b	$10(a4)
	beq.s	loc_10B6AE
	move.w	#$40,$A(a4)
	bra.s	loc_10B6B4
loc_10B6AE:
	move.w	#$FFC0,$A(a4)
loc_10B6B4:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
