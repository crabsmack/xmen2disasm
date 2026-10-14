; ---------------------------------------------------------------------------
; sub_160550
; ---------------------------------------------------------------------------
sub_160550:
	move.l	($0).w,d0
	ori.l	#$FFFF0000,d0
	movea.l	d0,a0
	moveq	#$0,d1
	sub.w	d0,d1
	moveq	#$0,d0
	btst	#$1,d1
	beq.s	loc_16056A
	move.w	d0,(a0)+
loc_16056A:
	lsr.w	#$2,d1
	move.w	d1,d2
	lsr.w	#$3,d1
	bra.s	loc_160582
loc_160572:
	move.l	d0,(a0)+
	move.l	d0,(a0)+
	move.l	d0,(a0)+
	move.l	d0,(a0)+
	move.l	d0,(a0)+
	move.l	d0,(a0)+
	move.l	d0,(a0)+
	move.l	d0,(a0)+
loc_160582:
	dbra	d1,loc_160572
	andi.w	#$7,d2
	bra.s	loc_16058E
loc_16058C:
	move.l	d0,(a0)+
loc_16058E:
	dbra	d2,loc_16058C
	rts
