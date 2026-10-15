; ---------------------------------------------------------------------------
; loc_113DA0	[runtime: executed in tas]
; ---------------------------------------------------------------------------
loc_113DA0:
	ext.w	d6
	sub.w	d6,$68(a4)
	ori.w	#$4,$4(a4)
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$7(a0),d0
	cmpi.w	#$FF,d0
	beq.s	loc_113DD4
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$7(a0),d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
loc_113DD4:
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$1(a0),d0
	tst.l	d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_113DEA
	moveq	#$63,d0
	bra.s	loc_113DF6
loc_113DEA:
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$1(a0),d0
	tst.l	d0
loc_113DF6:
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
	beq.s	loc_113E16
	moveq	#$63,d0
	bra.s	loc_113E22
loc_113E16:
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$1(a0),d0
	tst.l	d0
loc_113E22:
	moveq	#$0,d1
	move.b	d0,d1
	move.l	d1,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	tst.w	$68(a4)
	addq.w	#$8,a7
	bgt.s	loc_113E56
	move.w	#$2710,$6A(a4)
	ext.w	d7
	ext.l	d7
	move.l	d7,-(a7)
	ext.w	d6
	ext.l	d6
	move.l	d6,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$72(a0),a1
	jsr	(a1)
	lea.l	$C(a7),a7
	bra.s	loc_113E76
loc_113E56:
	move.w	#$1E,$6A(a4)
	ext.w	d7
	ext.l	d7
	move.l	d7,-(a7)
	ext.w	d6
	ext.l	d6
	move.l	d6,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$6E(a0),a1
	jsr	(a1)
	lea.l	$C(a7),a7
