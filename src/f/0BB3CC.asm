; ---------------------------------------------------------------------------
; sub_0BB3CC	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0BB3CC:
	link.w	a6,#$FFEC
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	-$3C2E(a5),d1
	ext.l	d1
	lsl.l	#$2,d1
	move.l	d1,d2
	lsl.l	#$2,d1
	add.l	d2,d1
	lea.l	g_SpriteDefs(a5),a0
	move.w	$6(a0,d1.w),d1
	ext.l	d1
	moveq	#$14,d2
	add.l	d2,d1
	move.l	d1,-(a7)
	moveq	#$3,d0
	move.l	d0,-(a7)
	move.l	d2,-(a7)
	lea.l	$35A2(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	-$14(a6)
	jsr	$506A(a5)	; -> sub_1FB026
	tst.l	$98(a4)
	lea.l	$1C(a7),a7
	bne.s	loc_0BB428
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0BB454
loc_0BB428:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0BB43C
	clr.w	$96(a4)
loc_0BB43C:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_0BB454:
	movea.l	-$18(a6),a4
	unlk	a6
	rts
