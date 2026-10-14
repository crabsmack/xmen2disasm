; ---------------------------------------------------------------------------
; sub_1F45AE
; ---------------------------------------------------------------------------
sub_1F45AE:
	move.b	d1,d2
	andi.l	#$FF,d2
	swap	d2
	lsl.l	#$7,d2
	move.b	d0,d3
	andi.l	#$FF,d3
	swap	d3
	asl.l	#$1,d3
	add.l	d3,d2
	addi.l	#$40000003,d2
	move.l	d2,(a5)
loc_1F45D0:
	tst.b	(a0)
	beq.s	loc_1F45E2
	move.b	(a0)+,d2
	subi.b	#$20,d2
	andi.w	#$FF,d2
	move.w	d2,(a4)
	bra.s	loc_1F45D0
loc_1F45E2:
	rts
