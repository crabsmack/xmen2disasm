; ---------------------------------------------------------------------------
; Map_SetRowPalette - set the palette field of 16 consecutive tilemap words (one row of a 16-wide map buffer)
; In:  8(a6) = map buffer   $C(a6) = word: row   $10(a6) = word: row offset   $14(a6) = word: palette 0-3
; Out: none
; Evidence: row base = buffer + (row + offset - 1) * $20; each word: bits 13-14 := palette; callers sub_07746A, sub_0E7582, sub_0FCB8E pass buffer -$3AA6(a5)
; ---------------------------------------------------------------------------
Map_SetRowPalette:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a4,-(a7)
	move.w	$16(a6),d6
	move.w	$E(a6),d0
	ext.l	d0
	move.w	$12(a6),d1
	ext.l	d1
	add.l	d0,d1
	subq.l	#$1,d1
	lsl.l	#$4,d1
	add.l	d1,d1
	movea.l	d1,a4
	adda.l	$8(a6),a4
	moveq	#$3,d0
	and.w	d6,d0
	moveq	#$0,d1
	move.w	d0,d1
	moveq	#$D,d0
	lsl.l	d0,d1
	move.w	d1,d6
	clr.w	d7
	moveq	#$10,d3
loc_1F5574:
	move.w	#$9FFF,d0
	and.w	(a4),d0
	move.w	d6,d1
	or.w	d0,d1
	move.w	d1,(a4)
	addq.w	#$2,a4
	move.w	d7,d0
	addq.w	#$1,d7
	cmp.w	d7,d3
	bgt.s	loc_1F5574
	movem.l	-$10(a6),d3/d6-d7/a4
	unlk	a6
	rts
