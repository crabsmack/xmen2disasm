; ---------------------------------------------------------------------------
; Tusk_StateReturnStart - TUSK: walk back towards home at 900
; In:  8(a6) = this
; Out: d0 = 0
; Evidence: max speed +$22 = |vx|; next Tusk_StateReturnHome
; ---------------------------------------------------------------------------
Tusk_StateReturnStart:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_05CA66
	move.l	#$FFFFFC7C,d0
	bra.s	loc_05CA6C
loc_05CA66:
	move.l	#$384,d0
loc_05CA6C:
	neg.w	d0
	move.w	d0,$16(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_05CA80
	move.w	$16(a4),d0
	ext.l	d0
	bra.s	loc_05CA88
loc_05CA80:
	move.w	$16(a4),d0
	ext.l	d0
	neg.l	d0
loc_05CA88:
	move.w	d0,$22(a4)
	lea.l	Tusk_StateReturnHome(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
