; ---------------------------------------------------------------------------
; sub_15C1FC
; ---------------------------------------------------------------------------
sub_15C1FC:
	move.l	d0,-(a7)
	mulu.w	d1,d0
	movea.l	d0,a0
	move.l	d1,d0
	mulu.w	(a7)+,d1
	clr.w	d0
	swap	d0
	beq.s	loc_15C20E
	mulu.w	(a7),d0
loc_15C20E:
	addq.l	#$2,a7
	add.w	d1,d0
	swap	d0
	clr.w	d0
	add.l	a0,d0
	rts
