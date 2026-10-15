; ---------------------------------------------------------------------------
; sub_15F6F0
; ---------------------------------------------------------------------------
sub_15F6F0:
	cmp.w	d4,d6
	bge.s	loc_15F6FC
	addq.w	#$8,d6
	asl.l	#$8,d5
	move.b	(a0)+,d5
	bra.s	sub_15F6F0
loc_15F6FC:
	move.w	d6,d7
	sub.w	d4,d7
	move.l	d5,d1
	lsr.l	d7,d1
	move.w	d4,d0
	sub.w	d0,d6
	cmpi.w	#$9,d6
	bge.s	loc_15F714
	addq.w	#$8,d6
	asl.l	#$8,d5
	move.b	(a0)+,d5
loc_15F714:
	add.w	d0,d0
	and.w	$15F71E(pc,d0.w),d1
	add.w	d3,d1
	add.w	a3,d1
	rts
