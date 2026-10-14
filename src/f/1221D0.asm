; ---------------------------------------------------------------------------
; sub_1221D0	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1221D0:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	ori.w	#$8,$A2(a4)
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	lea.l	$3492(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	sub_121D94(pc)
	tst.b	$B6(a4)
	lea.l	$10(a7),a7
	beq.s	loc_12221A
	move.w	$B0(a4),d0
	ext.l	d0
	add.l	#$15E,d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	bra.s	loc_12222A
loc_12221A:
	move.w	$B0(a4),d0
	ext.l	d0
	moveq	#$32,d1
	add.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
loc_12222A:
	clr.w	$6C(a4)
	lea.l	sub_122088(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
