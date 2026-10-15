; ---------------------------------------------------------------------------
; Cam_StepLookDown - camera step (+$18): move the look offset +$5C down while looking down, else back up to 0
; In:  8(a6) = this
; Out: none
; Evidence: flag +$4A bit 8: +$5C += +$60 limited so the highest live player stays +$62 px below the screen top; else +$5C -= +$5E until 0, then +$18 = 0; installed by Cam_LookDown
; ---------------------------------------------------------------------------
Cam_StepLookDown:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$10,d0
	and.w	$4A(a4),d0
	bne.w	loc_160CFC
	moveq	#$8,d0
	and.w	$4A(a4),d0
	bne.s	loc_160C7E
	move.w	$5C(a4),d0
	ext.l	d0
	move.w	$5E(a4),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	tst.w	d7
	bge.s	loc_160C78
	clr.w	d7
	moveq	#$0,d0
	move.l	d0,$18(a4)
loc_160C78:
	move.w	d7,$5C(a4)
	bra.s	loc_160CFC
loc_160C7E:
	moveq	#$2,d0
	and.w	$4A(a4),d0
	bne.s	loc_160CFC
	tst.w	$5C(a4)
	blt.s	loc_160CFC
	move.l	#$98967F,d7
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_160CAE
	move.l	g_Player1+$C(a5),d7
loc_160CAE:
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_160CDA
	cmp.l	g_Player2+$C(a5),d7
	slt.b	d3
	neg.b	d3
	beq.s	loc_160CD4
	move.l	d7,d0
	bra.s	loc_160CD8
loc_160CD4:
	move.l	g_Player2+$C(a5),d0
loc_160CD8:
	move.l	d0,d7
loc_160CDA:
	move.l	d7,d5
	asr.l	#$8,d5
	move.w	d5,d6
	sub.w	$32(a4),d6
	move.w	d6,d7
	sub.w	$62(a4),d7
	move.w	$60(a4),d0
	add.w	d0,$5C(a4)
	cmp.w	$5C(a4),d7
	bge.s	loc_160CFC
	move.w	d7,$5C(a4)
loc_160CFC:
	movem.l	-$14(a6),d3/d5-d7/a4
	unlk	a6
	rts
