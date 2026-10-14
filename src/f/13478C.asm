; ---------------------------------------------------------------------------
; sub_13478C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_13478C:
	link.w	a6,#$0
	movem.l	d4-d7/a4,-(a7)
	move.w	$E(a6),d4
	movea.l	$8(a6),a4
loc_13479C:
	movea.l	$A2(a4),a0
	move.w	(a0),d7
	move.w	$2(a0),d5
	move.w	$A8(a4),d6
	move.w	d7,d0
	asr.w	d6,d0
	move.w	d0,d7
	asr.w	d6,d5
	move.w	$9A(a4),d0
	ext.l	d0
	ext.l	d7
	add.l	d7,d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	move.w	$9C(a4),d0
	ext.l	d0
	ext.l	d5
	add.l	d5,d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	addq.l	#$4,$A2(a4)
	movea.l	$A2(a4),a0
	moveq	#$7F,d0
	cmp.w	(a0),d0
	bne.s	loc_1347EA
	lea.l	$36EA(a5),a0
	move.l	$2(a0),$A2(a4)
loc_1347EA:
	subq.w	#$1,d4
	bne.s	loc_13479C
	movem.l	-$14(a6),d4-d7/a4
	unlk	a6
	rts
