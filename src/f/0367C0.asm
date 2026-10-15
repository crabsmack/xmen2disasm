; ---------------------------------------------------------------------------
; sub_0367C0	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0367C0:
	link.w	a6,#$FFF8
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.w	$E(a6),d5
	clr.b	-$1(a6)
	move.w	$4C(a3),d7
	asr.w	#$5,d7
	move.w	$50(a3),d6
	asr.w	#$5,d6
	ext.l	d7
	ext.l	d6
	move.l	d7,d0
	add.l	d6,d0
	move.l	d0,d4
	asr.l	#$1,d4
	ext.l	d4
	move.l	d4,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	moveq	#$14,d0
	move.l	d0,-(a7)
	jsr	$4F52(a5)	; -> sub_1F8454
	movea.l	d0,a4
	move.l	a4,d0
	lea.l	$C(a7),a7
	beq.w	loc_0368C6
	move.w	$A(a4),d0
	ext.l	d0
	addq.l	#$8,d0
	move.l	d0,d4
	asr.l	#$5,d4
	move.w	$E(a4),d0
	ext.l	d0
	subq.l	#$8,d0
	asr.l	#$5,d0
	move.w	d0,-$8(a6)
	ext.l	d5
	move.l	d5,d0
	lsl.l	#$5,d0
	moveq	#$10,d1
	add.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,-$6(a6)
	ext.l	d4
	move.l	d4,d0
	lsl.l	#$5,d0
	add.l	d1,d0
	move.l	d0,d6
	lsl.l	#$8,d6
	ext.l	d4
	move.l	d4,d7
	bra.s	loc_036874
loc_036844:
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	($85).w
	move.l	d7,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	jsr	$3FDA(a5)	; -> sub_15D7F8
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d6,-(a7)
	move.l	-$6(a6),-(a7)
	jsr	$2DD2(a5)	; -> Explosion_SpawnSetTimerWord
	lea.l	$20(a7),a7
	move.l	d7,d0
	addq.l	#$1,d7
	addi.l	#$2000,d6
loc_036874:
	move.w	-$8(a6),d0
	ext.l	d0
	cmp.l	d7,d0
	bge.s	loc_036844
	move.l	a4,-(a7)
	jsr	$4F22(a5)	; -> Seg_Free
	movea.l	$8C(a3),a0
	move.l	$8(a0),d0
	cmp.l	$8(a3),d0
	addq.w	#$4,a7
	bge.s	loc_03689A
	move.b	#$1,-$1(a6)
loc_03689A:
	pea.l	($85).w
	pea.l	($180).w
	moveq	#$0,d0
	move.b	-$1(a6),d0
	move.l	d0,-(a7)
	moveq	#$8,d0
	move.l	d0,-(a7)
	move.w	-$8(a6),d1
	ext.l	d1
	move.l	d1,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	jsr	sub_035DC2(pc)
	lea.l	$1C(a7),a7
loc_0368C6:
	movem.l	-$20(a6),d4-d7/a3-a4
	unlk	a6
	rts
