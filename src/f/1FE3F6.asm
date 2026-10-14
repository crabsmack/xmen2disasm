; ---------------------------------------------------------------------------
; sub_1FE3F6
; ---------------------------------------------------------------------------
sub_1FE3F6:
	move.w	sr,-(a7)
	ori.w	#$700,sr
loc_1FE3FC:
	move.w	#$100,($A11100).l
loc_1FE404:
	btst	#$0,($A11100).l
	bne.s	loc_1FE404
	move.b	#$1,($A01B20).l
	move.b	($A01B21).l,d0
	move.w	#$0,($A11100).l
	tst.b	d0
	beq.s	loc_1FE430
	moveq	#$44,d0
loc_1FE42A:
	dbra	d0,loc_1FE42A
	bra.s	loc_1FE3FC
loc_1FE430:
	move.w	(a7)+,sr
	rts
