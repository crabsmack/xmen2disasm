; ---------------------------------------------------------------------------
; sub_1FE44E
; ---------------------------------------------------------------------------
sub_1FE44E:
	move.l	a1,-(a7)
	move.w	sr,-(a7)
	ori.w	#$700,sr
	move.w	#$100,($A11200).l
	jsr	sub_1FE3D8(pc)
	lea.l	$1FE66C(pc),a0
	lea.l	$1FFED3(pc),a1
	move.l	a1,d0
	sub.l	a0,d0
	subq.w	#$1,d0
	lea.l	($A00000).l,a1
loc_1FE476:
	move.b	(a0)+,(a1)+
	dbra	d0,loc_1FE476
loc_1FE47C:
	move.b	#$0,(a1)+
	cmpa.l	#$A02000,a1
	bne.s	loc_1FE47C
	move.w	(a7)+,sr
	movea.l	(a7)+,a1
	rts
