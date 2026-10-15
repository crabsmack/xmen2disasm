; ---------------------------------------------------------------------------
; Cam_PanStep - camera tracking fn during a pan: move +$30/+$32 toward the pan target by the pan speeds; on arrival restore the saved tracking fn
; In:  8(a6) = this
; Out: none
; Evidence: speeds +$54/+$56, target +$38/+$3A; on arrival +8 = saved +$20, +$10 = Cam_EaseOffset, offsets and look cleared, g_CamModeSwitched = 0
; ---------------------------------------------------------------------------
Cam_PanStep:
	link.w	a6,#$0
	movem.l	d3-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$54(a4),d4
	move.w	$56(a4),d5
	move.w	$38(a4),d0
	ext.l	d0
	move.w	$30(a4),d1
	ext.l	d1
	move.l	d0,d6
	sub.l	d1,d6
	move.w	$3A(a4),d0
	ext.l	d0
	move.w	$32(a4),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	tst.w	d6
	sge.b	d3
	neg.b	d3
	beq.s	loc_160EB4
	ext.l	d6
	move.l	d6,d0
	bra.s	loc_160EBA
loc_160EB4:
	ext.l	d6
	move.l	d6,d0
	neg.l	d0
loc_160EBA:
	ext.l	d4
	cmp.l	d0,d4
	bge.s	loc_160ED0
	tst.w	d6
	ble.s	loc_160ECA
	add.w	d4,$30(a4)
	bra.s	loc_160ED8
loc_160ECA:
	sub.w	d4,$30(a4)
	bra.s	loc_160ED8
loc_160ED0:
	move.w	$38(a4),$30(a4)
	clr.w	d6
loc_160ED8:
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_160EE6
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_160EEC
loc_160EE6:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_160EEC:
	ext.l	d5
	cmp.l	d0,d5
	bge.s	loc_160F02
	tst.w	d7
	ble.s	loc_160EFC
	add.w	d5,$32(a4)
	bra.s	loc_160F0A
loc_160EFC:
	sub.w	d5,$32(a4)
	bra.s	loc_160F0A
loc_160F02:
	move.w	$3A(a4),$32(a4)
	clr.w	d7
loc_160F0A:
	tst.w	d6
	bne.s	loc_160F2C
	tst.w	d7
	bne.s	loc_160F2C
	move.l	$20(a4),$8(a4)
	lea.l	Cam_EaseOffset(pc),a0
	move.l	a0,$10(a4)
	clr.l	$2C(a4)
	clr.w	$5C(a4)
	clr.b	g_CamModeSwitched(a5)
loc_160F2C:
	movem.l	-$18(a6),d3-d7/a4
	unlk	a6
	rts
