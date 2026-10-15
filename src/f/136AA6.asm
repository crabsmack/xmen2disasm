; ---------------------------------------------------------------------------
; sub_136AA6	[link-after-rts]
; ---------------------------------------------------------------------------
sub_136AA6:
	link.w	a6,#$0
	movem.l	d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_136ABC
	moveq	#$2,d0
	bra.s	loc_136ABE
loc_136ABC:
	moveq	#$1,d0
loc_136ABE:
	move.w	d0,d7
loc_136AC0:
	tst.l	$98(a4)
	beq.s	loc_136ACE
	move.l	a4,-(a7)
	jsr	sub_136598(pc)
	addq.w	#$4,a7
loc_136ACE:
	subq.w	#$1,d7
	bne.s	loc_136AC0
	tst.w	$6E(a4)
	bne.s	loc_136B04
	move.l	$8(a4),d5
	asr.l	#$8,d5
	move.w	#$380,d7
	move.w	#$FC80,d6
	cmpi.w	#$F0,d5
	ble.s	loc_136AF4
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
	move.w	d0,d7
loc_136AF4:
	move.w	d7,$16(a4)
	move.w	d6,$18(a4)
	lea.l	sub_136A32(pc),a0
	move.l	a0,$94(a4)
loc_136B04:
	movem.l	-$10(a6),d5-d7/a4
	unlk	a6
	rts
