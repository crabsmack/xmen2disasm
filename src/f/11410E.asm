; ---------------------------------------------------------------------------
; sub_11410E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_11410E:
	link.w	a6,#$FFFE
	movem.l	d3-d7/a4,-(a7)
	move.b	$F(a6),d5
	move.b	$13(a6),d7
	movea.l	$8(a6),a4
	cmpi.b	#$D,d7
	beq.s	loc_114134
	cmpi.b	#$E,d7
	beq.s	loc_114134
	cmpi.b	#$F,d7
	bne.s	loc_114144
loc_114134:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_1142D6
loc_114144:
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$1(a0),d0
	tst.l	d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_11415A
	moveq	#$63,d0
	bra.s	loc_114166
loc_11415A:
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$1(a0),d0
	tst.l	d0
loc_114166:
	moveq	#$0,d1
	move.b	d0,d1
	move.l	d1,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$1(a0),d0
	tst.l	d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_114186
	moveq	#$63,d0
	bra.s	loc_114192
loc_114186:
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$1(a0),d0
	tst.l	d0
loc_114192:
	moveq	#$0,d1
	move.b	d0,d1
	move.l	d1,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	move.b	d7,d0
	subi.b	#$9,d0
	addq.w	#$8,a7
	bmi.w	loc_1142D2
	cmpi.b	#$3,d0
	bgt.w	loc_1142D2
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_11410E(pc,d1.w),d1
	jmp	Sw_11410E-2(pc,d1.w)
