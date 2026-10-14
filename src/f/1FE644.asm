; ---------------------------------------------------------------------------
; sub_1FE644
; ---------------------------------------------------------------------------
sub_1FE644:
	tst.b	-$18AC(a5)
	bne.s	loc_1FE66A
	move.w	sr,-(a7)
	ori.w	#$700,sr
	jsr	sub_1FE3D8(pc)
	moveq	#$0,d0
	move.b	$9(a7),d0
	lea.l	($A01B22).l,a0
	move.b	(a0,d0.w),d0
	jsr	sub_1FE3EC(pc)
	move.w	(a7)+,sr
loc_1FE66A:
	rts
