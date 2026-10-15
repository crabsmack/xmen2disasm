; ---------------------------------------------------------------------------
; MagnetoBoss_SmashSegmentStaggered - as MagnetoBoss_SmashSegment but the debris pieces start 4 frames apart
; In:  8(a6) = this, $C(a6) = word column
; Out: d0
; Evidence: Explosion_SpawnSetTimerWord delay argument += 4 per tile
; ---------------------------------------------------------------------------
MagnetoBoss_SmashSegmentStaggered:
	link.w	a6,#$FFF6
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.w	$E(a6),d4
	clr.b	-$1(a6)
	move.w	$4C(a3),d7
	asr.w	#$5,d7
	move.w	$50(a3),d6
	asr.w	#$5,d6
	ext.l	d7
	ext.l	d6
	move.l	d7,d0
	add.l	d6,d0
	move.l	d0,d5
	asr.l	#$1,d5
	ext.l	d5
	move.l	d5,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	moveq	#$14,d0
	move.l	d0,-(a7)
	jsr	$4F52(a5)	; -> sub_1F8454
	movea.l	d0,a4
	move.l	a4,d0
	lea.l	$C(a7),a7
	beq.w	loc_0369E6
	move.w	$A(a4),d0
	ext.l	d0
	addq.l	#$8,d0
	asr.l	#$5,d0
	move.w	d0,-$A(a6)
	move.w	$E(a4),d0
	ext.l	d0
	subq.l	#$8,d0
	asr.l	#$5,d0
	move.w	d0,-$8(a6)
	ext.l	d4
	move.l	d4,d0
	lsl.l	#$5,d0
	moveq	#$10,d1
	add.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,-$6(a6)
	move.w	-$A(a6),d0
	ext.l	d0
	lsl.l	#$5,d0
	add.l	d1,d0
	move.l	d0,d5
	lsl.l	#$8,d5
	moveq	#$0,d6
	move.w	-$A(a6),d0
	ext.l	d0
	move.l	d0,d7
	bra.s	loc_036990
loc_03695E:
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	($85).w
	move.l	d7,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	jsr	$3FDA(a5)	; -> Map_SetBlockFG
	move.l	d6,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d5,-(a7)
	move.l	-$6(a6),-(a7)
	jsr	$2DD2(a5)	; -> Explosion_SpawnSetTimerWord
	addq.l	#$4,d6
	lea.l	$20(a7),a7
	move.l	d7,d0
	addq.l	#$1,d7
	addi.l	#$2000,d5
loc_036990:
	move.w	-$8(a6),d0
	ext.l	d0
	cmp.l	d7,d0
	bge.s	loc_03695E
	move.l	a4,-(a7)
	jsr	$4F22(a5)	; -> Seg_Free
	movea.l	$8C(a3),a0
	move.l	$8(a0),d0
	cmp.l	$8(a3),d0
	addq.w	#$4,a7
	bge.s	loc_0369B6
	move.b	#$1,-$1(a6)
loc_0369B6:
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
	move.w	-$A(a6),d1
	ext.l	d1
	move.l	d1,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	jsr	MagnetoBoss_SpawnRubble(pc)
	lea.l	$1C(a7),a7
loc_0369E6:
	movem.l	-$22(a6),d4-d7/a3-a4
	unlk	a6
	rts
