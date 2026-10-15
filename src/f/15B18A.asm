; ---------------------------------------------------------------------------
; sub_15B18A	[jt 2020]
; ---------------------------------------------------------------------------
sub_15B18A:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a3
	moveq	#$0,d0
	move.b	$F(a6),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_SpriteDefs(a5),a0
	lea.l	(a0,d0.w),a4
	move.l	$2(a4),$2(a3)
	move.w	$6(a4),$6(a3)
	move.w	$8(a4),$8(a3)
	andi.b	#$FC,(a3)
	move.b	(a4),d0
	and.b	#$3,d0
	or.b	d0,(a3)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
