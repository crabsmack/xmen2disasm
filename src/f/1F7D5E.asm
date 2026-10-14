; ---------------------------------------------------------------------------
; sub_1F7D5E	[jt 2529]
; ---------------------------------------------------------------------------
sub_1F7D5E:
	link.w	a6,#$0
	movem.l	d5-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	moveq	#$0,d7
	move.b	$7A(a3),d7
	tst.l	d7
	bra.s	loc_1F7D9E
loc_1F7D74:
	move.w	d7,d6
	move.w	d6,d5
	move.l	d6,d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	-$33D2(a5),a0
	lea.l	(a0,d0.w),a4
	moveq	#$0,d7
	move.b	$13(a4),d7
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	movea.l	$C(a6),a0
	jsr	(a0)
	addq.w	#$8,a7
loc_1F7D9E:
	cmpi.w	#$FF,d7
	bne.s	loc_1F7D74
	movem.l	-$14(a6),d5-d7/a3-a4
	unlk	a6
	rts
