; ---------------------------------------------------------------------------
; Magneto_HoverDamp - damp Magneto's velocity while hovering (x friction, small vertical bob) and optionally face the held direction
; In:  8(a6) = player, $C(a6) = byte stop slow x, $10(a6) = byte face pad direction
; Out: d0
; Evidence: |vx| >= $40 -> accel -vx/8 else (flag) stop; |vy| >= $40 -> accel -vy/8 else +/-1 bob; used by Magneto_AirSteer and the air-shot states
; ---------------------------------------------------------------------------
Magneto_HoverDamp:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$16(a4),d6
	move.w	$18(a4),d7
	tst.w	d6
	sge.b	d3
	neg.b	d3
	beq.s	loc_1CDA6A
	ext.l	d6
	move.l	d6,d0
	bra.s	loc_1CDA70
loc_1CDA6A:
	ext.l	d6
	move.l	d6,d0
	neg.l	d0
loc_1CDA70:
	moveq	#$40,d1
	cmp.l	d0,d1
	ble.s	loc_1CDA86
	tst.b	$F(a6)
	beq.s	loc_1CDA94
	clr.w	$1E(a4)
	clr.w	$16(a4)
	bra.s	loc_1CDA94
loc_1CDA86:
	move.w	$16(a4),d0
	asr.w	#$3,d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$1E(a4)
loc_1CDA94:
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_1CDAA2
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_1CDAA8
loc_1CDAA2:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_1CDAA8:
	moveq	#$40,d1
	cmp.l	d0,d1
	ble.s	loc_1CDACA
	cmpi.w	#$FFD0,d7
	bge.s	loc_1CDABC
	move.w	#$1,$20(a4)
	bra.s	loc_1CDAD8
loc_1CDABC:
	cmpi.w	#$30,d7
	ble.s	loc_1CDAD8
	move.w	#$FFFF,$20(a4)
	bra.s	loc_1CDAD8
loc_1CDACA:
	move.w	$18(a4),d0
	asr.w	#$3,d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$20(a4)
loc_1CDAD8:
	tst.b	$13(a6)
	beq.s	loc_1CDB28
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CDAF2
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CDAFA
loc_1CDAF2:
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CDAFA:
	beq.s	loc_1CDB04
	ori.b	#$10,$2E(a4)
	bra.s	loc_1CDB28
loc_1CDB04:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CDB18
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CDB20
loc_1CDB18:
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CDB20:
	beq.s	loc_1CDB28
	andi.b	#$EF,$2E(a4)
loc_1CDB28:
	movem.l	-$10(a6),d3/d6-d7/a4
	unlk	a6
	rts
