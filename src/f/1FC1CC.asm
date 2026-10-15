; ---------------------------------------------------------------------------
; sub_1FC1CC
; ---------------------------------------------------------------------------
sub_1FC1CC:
	move.l	a2,-(a7)
	move.w	-$C96(a5),d0
	addq.w	#$1,d0
	lsr.w	#$1,d0
	mulu.w	-$C94(a5),d0
	subq.w	#$1,d0
	movea.l	-$C70(a5),a0
	movea.l	-$C6C(a5),a1
	lea.l	Tbl_PixelPairExpand(pc),a2
loc_1FC1E8:
	moveq	#$0,d1
	move.b	(a0)+,d1
	add.w	d1,d1
	move.w	(a2,d1.w),(a1)+
	dbra	d0,loc_1FC1E8
	movea.l	(a7)+,a2
	rts
