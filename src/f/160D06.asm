; ---------------------------------------------------------------------------
; Cam_StepLookUp - camera step (+$18): move the look offset +$5C up while looking up, else back down to 0
; In:  8(a6) = this
; Out: none
; Evidence: flag +$4A bit 4: +$5C -= +$60 limited by the lowest live player and +$64; else +$5C += +$5E until 0, then +$18 = 0; installed by Cam_LookUp
; ---------------------------------------------------------------------------
Cam_StepLookUp:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$10,d0
	and.w	$4A(a4),d0
	bne.w	loc_160DC4
	moveq	#$4,d0
	and.w	$4A(a4),d0
	bne.s	loc_160D46
	move.w	$5C(a4),d0
	ext.l	d0
	move.w	$5E(a4),d1
	ext.l	d1
	move.l	d1,d7
	add.l	d0,d7
	tst.w	d7
	ble.s	loc_160D40
	clr.w	d7
	moveq	#$0,d0
	move.l	d0,$18(a4)
loc_160D40:
	move.w	d7,$5C(a4)
	bra.s	loc_160DC4
loc_160D46:
	moveq	#$2,d0
	and.w	$4A(a4),d0
	bne.s	loc_160DC4
	tst.w	$5C(a4)
	bgt.s	loc_160DC4
	move.l	#$FF676981,d7
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_160D76
	move.l	g_Player1+$C(a5),d7
loc_160D76:
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_160DA2
	cmp.l	g_Player2+$C(a5),d7
	sgt.b	d3
	neg.b	d3
	beq.s	loc_160D9C
	move.l	d7,d0
	bra.s	loc_160DA0
loc_160D9C:
	move.l	g_Player2+$C(a5),d0
loc_160DA0:
	move.l	d0,d7
loc_160DA2:
	move.l	d7,d5
	asr.l	#$8,d5
	move.w	d5,d6
	sub.w	$32(a4),d6
	move.w	d6,d7
	sub.w	$64(a4),d7
	move.w	$60(a4),d0
	sub.w	d0,$5C(a4)
	cmp.w	$5C(a4),d7
	ble.s	loc_160DC4
	move.w	d7,$5C(a4)
loc_160DC4:
	movem.l	-$14(a6),d3/d5-d7/a4
	unlk	a6
	rts
