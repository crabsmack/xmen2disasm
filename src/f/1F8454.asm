; ---------------------------------------------------------------------------
; sub_1F8454	[jt 2534]
; ---------------------------------------------------------------------------
sub_1F8454:
	link.w	a6,#$0
	movem.l	d6-d7,-(a7)
	move.w	$E(a6),d0
	ext.l	d0
	lsl.l	#$5,d0
	move.l	d0,d6
	moveq	#$10,d0
	add.l	d0,d6
	move.w	$12(a6),d1
	ext.l	d1
	lsl.l	#$5,d1
	move.l	d1,d7
	add.l	d0,d7
	move.w	$A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	sub_1F82CC(pc)
	movem.l	-$8(a6),d6-d7
	unlk	a6
	rts
