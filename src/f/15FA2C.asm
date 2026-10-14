; ---------------------------------------------------------------------------
; sub_15FA2C	[jt 2083]
; ---------------------------------------------------------------------------
sub_15FA2C:
	link.w	a6,#$0
	move.l	d2,-(a7)
	movea.l	$8(a6),a1
	movea.l	$C(a6),a0
	move.l	$14(a6),d2
	subq.w	#$1,d2
	move.l	$18(a6),d1
	asl.l	#$1,d1
loc_15FA46:
	move.l	a1,d0
	lsl.l	#$2,d0
	lsr.w	#$2,d0
	swap	d0
	bset	#$1E,d0
	andi.l	#$7FFF0003,d0
	move.l	d0,($C00004).l
	adda.l	d1,a1
	move.l	$10(a6),d0
	subq.w	#$1,d0
loc_15FA66:
	move.w	(a0)+,($C00000).l
	dbra	d0,loc_15FA66
	dbra	d2,loc_15FA46
	move.l	(a7)+,d2
	unlk	a6
	rts
