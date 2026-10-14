; ---------------------------------------------------------------------------
; sub_0BA864	[jt 989]
; ---------------------------------------------------------------------------
sub_0BA864:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	lea.l	$2072(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$4A(a0),a1
	jsr	(a1)
	move.w	-$3B06(a5),d0
	btst	#$0,d0
	addq.w	#$4,a7
	beq.s	loc_0BA8BE
	move.l	-$3B18(a5),d0
	swap	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	#$FFFF,d0
	and.l	-$3B18(a5),d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	-$1758(a5)
	movea.l	-$1758(a5),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	lea.l	$18(a7),a7
loc_0BA8BE:
	moveq	#$2,d0
	and.w	-$3B06(a5),d0
	beq.s	loc_0BA8F6
	move.l	-$3B1C(a5),d0
	swap	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	#$FFFF,d0
	and.l	-$3B1C(a5),d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	-$1848(a5)
	movea.l	-$1848(a5),a0
	movea.l	$26(a0),a1
	jsr	(a1)
loc_0BA8F6:
	unlk	a6
	rts
