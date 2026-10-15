; ---------------------------------------------------------------------------
; sub_0B77FC	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0B77FC:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d6
	asr.l	#$8,d6
	move.w	g_CameraX(a5),d0
	ext.l	d0
	move.l	d0,d7
	add.l	#$A0,d7
	ext.l	d7
	ext.l	d6
	move.l	d7,d0
	sub.l	d6,d0
	sge.b	d3
	neg.b	d3
	beq.s	loc_0B7834
	ext.l	d7
	ext.l	d6
	move.l	d7,d0
	sub.l	d6,d0
	bra.s	loc_0B783E
loc_0B7834:
	ext.l	d7
	ext.l	d6
	move.l	d7,d0
	sub.l	d6,d0
	neg.l	d0
loc_0B783E:
	moveq	#$A,d1
	cmp.l	d0,d1
	ble.s	loc_0B7882
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	tst.l	$9A(a4)
	bne.s	loc_0B7862
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0B787E
loc_0B7862:
	clr.w	$98(a4)
	movea.l	$9A(a4),a0
	addq.l	#$2,a0
	move.w	$98(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_0B787E:
	moveq	#$0,d0
	bra.s	loc_0B78AE
loc_0B7882:
	cmp.w	d6,d7
	ble.s	loc_0B788E
	move.w	#$100,$16(a4)
	bra.s	loc_0B7894
loc_0B788E:
	move.w	#$FF00,$16(a4)
loc_0B7894:
	move.l	#$F000,$A6(a4)
	clr.w	$6C(a4)
	lea.l	sub_0B77FC(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0B78AE:
	movem.l	-$10(a6),d3/d6-d7/a4
	unlk	a6
	rts
