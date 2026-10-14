; ---------------------------------------------------------------------------
; sub_04BF52	[link-after-rts]
; ---------------------------------------------------------------------------
sub_04BF52:
	link.w	a6,#$FFF8
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.w	$8C(a4),d0
	moveq	#$10,d1
	and.w	d0,d1
	bne.s	loc_04BFA6
	pea.l	($AA).w
	move.l	a4,-(a7)
	jsr	sub_04BEFA(pc)
	tst.b	d0
	addq.w	#$8,a7
	beq.s	loc_04BF90
	clr.w	$6C(a4)
	lea.l	sub_04C030(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_04C026
loc_04BF90:
	clr.w	$6C(a4)
	lea.l	sub_04BE76(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_04C026
loc_04BFA6:
	movea.l	$96(a4),a3
	move.l	a3,d0
	beq.s	loc_04C014
	move.w	$56(a3),-$8(a6)
	move.w	$54(a3),-$6(a6)
	move.w	$5A(a3),-$4(a6)
	move.w	$58(a3),-$2(a6)
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.l	d0,d6
	moveq	#$23,d0
	sub.l	d0,d6
	move.w	$54(a3),d7
	ext.l	d6
	move.l	d6,d4
	moveq	#$46,d1
	add.l	d1,d4
	ext.l	d7
	move.l	d7,d5
	add.l	#$100,d5
	cmp.w	-$8(a6),d4
	blt.s	loc_04C014
	cmp.w	-$4(a6),d6
	bgt.s	loc_04C014
	cmp.w	-$6(a6),d5
	blt.s	loc_04C014
	cmp.w	-$2(a6),d7
	bgt.s	loc_04C014
	clr.w	$6C(a4)
	lea.l	sub_04C114(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_04C026
loc_04C014:
	clr.w	$6C(a4)
	lea.l	sub_04BF52(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_04C026:
	movem.l	-$20(a6),d4-d7/a3-a4
	unlk	a6
	rts
