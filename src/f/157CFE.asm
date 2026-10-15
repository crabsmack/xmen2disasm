; ---------------------------------------------------------------------------
; sub_157CFE	[jt 1975]
; ---------------------------------------------------------------------------
sub_157CFE:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	cmpi.w	#$172,d7
	ble.s	loc_157D24
	moveq	#$1,d0
	bra.s	loc_157D54
loc_157D24:
	cmpi.w	#$FFCE,d7
	bge.s	loc_157D2E
	moveq	#$1,d0
	bra.s	loc_157D54
loc_157D2E:
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	d0,d7
	sub.w	g_CameraY(a5),d7
	cmpi.w	#$112,d7
	ble.s	loc_157D44
	moveq	#$1,d0
	bra.s	loc_157D54
loc_157D44:
	cmpi.w	#$FFCE,d7
	slt.b	d3
	neg.b	d3
	subq.b	#$1,d3
	subx.b	d3,d3
	addq.b	#$1,d3
	move.b	d3,d0
loc_157D54:
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
