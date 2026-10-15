; ---------------------------------------------------------------------------
; sub_1F30DC	[jt 2458]
; ---------------------------------------------------------------------------
sub_1F30DC:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	-$3AFA(a5)
	movea.l	$8C(a4),a0
	move.w	$18(a0),$24(a4)
	ori.l	#$200,$90(a4)
	andi.l	#$FF7FFFF9,$90(a4)
	move.w	$1C(a4),d0
	ext.l	d0
	add.l	#$250,d0
	movea.l	$8C(a4),a0
	move.w	$10(a0),d1
	ext.l	d1
	neg.l	d1
	cmp.l	d0,d1
	bge.s	loc_1F3152
	moveq	#$0,d0
	move.b	$2E(a0),d0
	cmpi.w	#$FF,d0
	beq.s	loc_1F3178
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$2E(a0),d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$2E(a0),d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
	bra.s	loc_1F3178
loc_1F3152:
	movea.l	$8C(a4),a0
	move.b	$9(a0),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	movea.l	$8C(a4),a0
	move.b	$9(a0),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
loc_1F3178:
	move.b	#$1,-$3892(a5)
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F3192
	move.w	g_PadMaskLeftRight(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1F319A
loc_1F3192:
	move.w	g_PadMaskLeftRight(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1F319A:
	beq.s	loc_1F31B4
	tst.b	$9D(a4)
	bne.s	loc_1F31AC
	move.w	g_PadMaskLeftRight(a5),d0
	or.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1F31B4
loc_1F31AC:
	move.w	g_PadMaskLeftRight(a5),d0
	or.w	d0,g_Pad2Latch(a5)
loc_1F31B4:
	tst.w	$16(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_1F31C6
	move.w	$16(a4),d1
	ext.l	d1
	bra.s	loc_1F31CE
loc_1F31C6:
	move.w	$16(a4),d1
	ext.l	d1
	neg.l	d1
loc_1F31CE:
	movea.l	$8C(a4),a0
	move.w	$1A(a0),d2
	ext.l	d2
	cmp.l	d1,d2
	sgt.b	d3
	neg.b	d3
	subq.b	#$1,d3
	subx.b	d3,d3
	addq.b	#$1,d3
	move.b	d3,d0
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
