; ---------------------------------------------------------------------------
; loc_1F78CA
; ---------------------------------------------------------------------------
loc_1F78CA:
	movea.l	$10(a6),a0
	move.b	$3(a0),d0
	ext.w	d0
	ext.l	d0
	lsl.l	#$8,d0
	add.l	d0,$8(a4)
	movea.l	$10(a6),a0
	move.b	$4(a0),d0
	ext.w	d0
	ext.l	d0
	lsl.l	#$8,d0
	add.l	d0,$C(a4)
	move.w	#$1000,d0
	and.w	$4(a4),d0
	moveq	#$0,d1
	move.w	d0,d1
	tst.l	d1
	bne.s	loc_1F790A
	move.l	a4,-(a7)
	move.l	$76(a4),-(a7)
	jsr	Seg_ComputeObjPos(pc)
	addq.w	#$8,a7
loc_1F790A:
	cmp.w	$16(a4),d6
	beq.s	loc_1F7920
	ori.w	#$100,$4(a4)
	movea.l	$10(a6),a0
	move.b	$2(a0),$7B(a4)
loc_1F7920:
	cmp.w	$18(a4),d7
	beq.s	loc_1F7936
	ori.w	#$80,$4(a4)
	movea.l	$10(a6),a0
	move.b	$2(a0),$7B(a4)
loc_1F7936:
	movem.l	-$14(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
