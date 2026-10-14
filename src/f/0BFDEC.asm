; ---------------------------------------------------------------------------
; sub_0BFDEC	[jt 1097]
; ---------------------------------------------------------------------------
sub_0BFDEC:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$8C(a4),d0
	ext.l	d0
	move.l	-$35A2(a5),d1
	sub.l	d0,d1
	move.l	#$FF,d7
	and.l	d1,d7
	cmpi.l	#$80,d7
	ble.s	loc_0BFE1E
	move.l	#$100,d0
	sub.l	d7,d0
	move.l	d0,d7
loc_0BFE1E:
	moveq	#$0,d0
	move.b	$9B(a4),d0
	asr.l	d0,d7
	move.w	$12(a4),d0
	ext.l	d0
	sub.l	d7,d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	movea.l	-$CAE(a5),a0
	moveq	#$0,d0
	move.w	$4(a0),d0
	lsl.l	#$3,d0
	moveq	#$1A,d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	cmp.l	$C(a4),d0
	bls.s	loc_0BFE62
	movea.l	-$CAE(a5),a0
	moveq	#$0,d0
	move.w	$4(a0),d0
	lsl.l	#$3,d0
	moveq	#$1A,d1
	sub.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
loc_0BFE62:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
