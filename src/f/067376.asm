; ---------------------------------------------------------------------------
; sub_067376	[link-after-rts]
; ---------------------------------------------------------------------------
sub_067376:
	link.w	a6,#$FFF8
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$8C(a4),a3
	move.l	a3,-(a7)
	jsr	sub_064912(pc)
	move.w	d0,d7
	move.l	a3,-(a7)
	jsr	sub_06489A(pc)
	move.l	d0,-$8(a6)
	moveq	#$24,d1
	add.l	d1,d0
	ext.l	d7
	move.l	d7,d2
	lsl.l	#$4,d2
	add.l	d0,d2
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$2,d0
	add.l	d2,d0
	move.l	d0,-$4(a6)
	tst.l	-$8(a6)
	addq.w	#$8,a7
	bne.s	loc_0673BE
	clr.l	$9E(a4)
	bra.s	loc_067416
loc_0673BE:
	move.l	a3,-(a7)
	jsr	sub_0647D0(pc)
	cmpi.w	#$F8,$A2(a4)
	addq.w	#$4,a7
	bne.s	loc_0673E8
	movea.l	(a3),a0
	move.b	#$1,$16(a0)
	movea.l	-$4(a6),a0
	move.b	$2(a0),d0
	ext.w	d0
	neg.w	d0
	move.w	d0,$9A(a4)
	bra.s	loc_0673FA
loc_0673E8:
	movea.l	(a3),a0
	clr.b	$16(a0)
	movea.l	-$4(a6),a0
	move.b	(a0),d0
	ext.w	d0
	move.w	d0,$9A(a4)
loc_0673FA:
	movea.l	-$4(a6),a0
	move.b	$1(a0),d0
	ext.w	d0
	move.w	d0,$9C(a4)
	movea.l	(a3),a0
	move.w	(a0),$9E(a4)
	movea.l	(a3),a0
	move.w	$2(a0),$A0(a4)
loc_067416:
	movem.l	-$14(a6),d7/a3-a4
	unlk	a6
	rts
