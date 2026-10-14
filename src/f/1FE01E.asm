; ---------------------------------------------------------------------------
; sub_1FE01E
; ---------------------------------------------------------------------------
sub_1FE01E:
	move.w	-$7A6(a5),d0
loc_1FE022:
	move.w	d0,d1
	moveq	#$3,d2
	and.w	d2,d1
	cmp.w	d2,d1
	bne.s	loc_1FE02E
	eor.w	d2,d0
loc_1FE02E:
	move.w	d0,d1
	moveq	#$C,d2
	and.w	d2,d1
	cmp.w	d2,d1
	bne.s	loc_1FE03A
	eor.w	d2,d0
loc_1FE03A:
	rts
