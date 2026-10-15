; ---------------------------------------------------------------------------
; sub_197A3C	[jt 2174]
; ---------------------------------------------------------------------------
sub_197A3C:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	lea.l	$2BB2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$4A(a0),a1
	jsr	(a1)
	tst.w	$C4(a4)
	addq.w	#$4,a7
	bgt.s	loc_197AAE
	move.w	#$384,$C4(a4)
	cmpi.w	#$300,$68(a4)
	bge.s	loc_197AC0
	tst.w	$68(a4)
	ble.s	loc_197AC0
	move.w	$68(a4),d0
	ext.l	d0
	subq.l	#$1,d0
	asr.l	#$8,d0
	move.w	d0,d7
	addq.w	#$1,d7
	moveq	#$39,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$39,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	move.w	d7,d0
	addq.w	#$1,d7
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$8,d0
	move.w	d0,$68(a4)
	move.b	#$1,g_HudDirty(a5)
	addq.w	#$8,a7
	bra.s	loc_197AC0
loc_197AAE:
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_197AB8
	moveq	#$2,d0
	bra.s	loc_197ABA
loc_197AB8:
	moveq	#$1,d0
loc_197ABA:
	ext.w	d0
	sub.w	d0,$C4(a4)
loc_197AC0:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
