; ---------------------------------------------------------------------------
; Seg_AtOpenEndAhead - is a walker within a margin of the end of its floor segment it is moving toward, with no neighbouring segment there
; In:  8(a6) = object (+$76 segment, +$72 position, +$16 vx)  $E(a6) = word margin
; Out: d0 = 1 at an open end
; Evidence: half the box width + margin vs 0 (moving left, checks prev +$10 = $FF) or length +6 (moving right, next +$11 = $FF); caller Blast_StateFly
; ---------------------------------------------------------------------------
Seg_AtOpenEndAhead:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a4,-(a7)
	move.w	$E(a6),d5
	movea.l	$8(a6),a4
	move.w	$52(a4),d0
	ext.l	d0
	move.w	$4E(a4),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,d6
	asr.l	#$1,d6
	move.l	$72(a4),d7
	asr.l	#$8,d7
	tst.l	$76(a4)
	beq.s	loc_1F64A8
	tst.w	$16(a4)
	bge.s	loc_1F647A
	moveq	#$0,d3
	ext.l	d7
	ext.l	d6
	move.l	d7,d0
	sub.l	d6,d0
	ext.l	d5
	sub.l	d5,d0
	bge.s	loc_1F6476
	movea.l	$76(a4),a0
	moveq	#$0,d0
	move.b	$10(a0),d0
	cmpi.w	#$FF,d0
	bne.s	loc_1F6476
	moveq	#$1,d3
loc_1F6476:
	move.b	d3,d0
	bra.s	loc_1F64AA
loc_1F647A:
	moveq	#$0,d3
	ext.l	d7
	ext.l	d6
	move.l	d7,d0
	add.l	d6,d0
	ext.l	d5
	add.l	d5,d0
	movea.l	$76(a4),a0
	move.w	$6(a0),d1
	ext.l	d1
	cmp.l	d0,d1
	bgt.s	loc_1F64A4
	moveq	#$0,d0
	move.b	$11(a0),d0
	cmpi.w	#$FF,d0
	bne.s	loc_1F64A4
	moveq	#$1,d3
loc_1F64A4:
	move.b	d3,d0
	bra.s	loc_1F64AA
loc_1F64A8:
	moveq	#$0,d0
loc_1F64AA:
	movem.l	-$14(a6),d3/d5-d7/a4
	unlk	a6
	rts
