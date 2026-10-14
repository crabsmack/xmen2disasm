; ---------------------------------------------------------------------------
; sub_1F48AA
; ---------------------------------------------------------------------------
sub_1F48AA:
	movem.l	$4(a7),a0-a1
	move.l	a0,d0
	move.l	d2,-(a7)
	move.l	$10(a7),d1
	cmpi.l	#$11,d1
	blt.s	loc_1F48EE
	move.l	a1,d2
	eor.b	d0,d2
	lsr.b	#$1,d2
	bcs.s	loc_1F48EE
	btst	#$0,d0
	beq.s	loc_1F48D2
	move.b	(a1)+,(a0)+
	subq.l	#$1,d1
loc_1F48D2:
	move.l	d1,d2
	lsr.l	#$4,d2
	subq.l	#$1,d2
loc_1F48D8:
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	subq.l	#$1,d2
	bcc.s	loc_1F48D8
	andi.l	#$F,d1
	bra.s	loc_1F48EE
loc_1F48EC:
	move.b	(a1)+,(a0)+
loc_1F48EE:
	subq.l	#$1,d1
	bcc.s	loc_1F48EC
	move.l	(a7)+,d2
	rts
