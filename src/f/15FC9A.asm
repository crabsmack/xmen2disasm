; ---------------------------------------------------------------------------
; sub_15FC9A
; ---------------------------------------------------------------------------
sub_15FC9A:
	moveq	#$0,d0
	movea.l	$4(a7),a0
	move.l	$C(a7),d1
	lsr.w	#$4,d1
loc_15FCA6:
	move.w	d0,(a0)+
	dbra	d1,loc_15FCA6
	movea.l	$4(a7),a0
	movea.l	$8(a7),a1
	move.l	$C(a7),d2
	move.w	$12(a7),d1
	move.l	d3,-(a7)
	bra.s	loc_15FCD0
loc_15FCC0:
	move.w	(a1)+,d0
	and.w	d1,d0
	beq.s	loc_15FCD0
	moveq	#$7,d3
	and.w	d0,d3
	lsr.w	#$3,d0
	bset	d3,(a0,d0.w)
loc_15FCD0:
	dbra	d2,loc_15FCC0
	move.l	(a7)+,d3
	rts
