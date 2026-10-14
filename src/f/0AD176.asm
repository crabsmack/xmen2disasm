; ---------------------------------------------------------------------------
; sub_0AD176	[jt 889]
; ---------------------------------------------------------------------------
sub_0AD176:
	link.w	a6,#$0
	tst.l	-$3C38(a5)
	beq.s	loc_0AD1B6
	move.w	$1A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$16(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	$10(a6),-(a7)
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	movea.l	-$3C38(a5),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$6E(a0),a1
	jsr	(a1)
	lea.l	$18(a7),a7
loc_0AD1B6:
	moveq	#$0,d0
	unlk	a6
	rts
