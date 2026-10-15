; ---------------------------------------------------------------------------
; Seg_WouldLeaveEnd - test whether moving dx along the floor segment an object stands on would pass an end that has no neighbouring segment
; In:  8(a6) = object   $C(a6) = word: dx
; Out: d0 = byte: 1 = would walk off
; Evidence: segment = object+$76 (0 = none -> 0); position along it object+$72 >> 8, half width from box +$4E/+$52; facing right compares with segment +6 (length) and next link +$11, facing left with 0 and previous link +$10 ($FF = none)
; ---------------------------------------------------------------------------
Seg_WouldLeaveEnd:
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
	beq.s	loc_1F6414
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_1F63E6
	moveq	#$0,d3
	ext.l	d7
	ext.l	d6
	move.l	d7,d0
	sub.l	d6,d0
	ext.l	d5
	sub.l	d5,d0
	bge.s	loc_1F63E2
	movea.l	$76(a4),a0
	moveq	#$0,d0
	move.b	$10(a0),d0
	cmpi.w	#$FF,d0
	bne.s	loc_1F63E2
	moveq	#$1,d3
loc_1F63E2:
	move.b	d3,d0
	bra.s	loc_1F6416
loc_1F63E6:
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
	bgt.s	loc_1F6410
	moveq	#$0,d0
	move.b	$11(a0),d0
	cmpi.w	#$FF,d0
	bne.s	loc_1F6410
	moveq	#$1,d3
loc_1F6410:
	move.b	d3,d0
	bra.s	loc_1F6416
loc_1F6414:
	moveq	#$0,d0
loc_1F6416:
	movem.l	-$14(a6),d3/d5-d7/a4
	unlk	a6
	rts
