; ---------------------------------------------------------------------------
; sub_158876	[link-after-rts]
; ---------------------------------------------------------------------------
sub_158876:
	link.w	a6,#$FFF4
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$8(a6),a0
	move.l	$8(a0),d0
	asr.l	#$8,d0
	move.w	d0,-$8(a6)
	move.l	$C(a0),d0
	asr.l	#$8,d0
	move.w	d0,-$6(a6)
	tst.b	$FF(a0)
	beq.s	loc_1588C8
	move.w	-$8(a6),d6
	move.w	d6,d4
	sub.w	#$A0,d4
	move.w	d6,d5
	add.w	#$A0,d5
	move.w	-$6(a6),d6
	move.w	d6,-$A(a6)
	sub.w	#$A0,d6
	move.w	-$A(a6),d7
	add.w	#$A0,d7
	move.w	#$4,-$2(a6)
	bra.s	loc_1588F6
loc_1588C8:
	move.w	-$8(a6),d4
	move.w	d4,-$C(a6)
	sub.w	#$41,d4
	move.w	-$C(a6),d5
	add.w	#$41,d5
	move.w	-$6(a6),d6
	move.w	d6,-$A(a6)
	sub.w	#$41,d6
	move.w	-$A(a6),d7
	add.w	#$41,d7
	move.w	#$2,-$2(a6)
loc_1588F6:
	movea.l	$8(a6),a0
	moveq	#$10,d0
	and.w	$6(a0),d0
	beq.s	loc_15890E
	movea.l	-$1652(a5),a3
	move.w	#$C,-$4(a6)
	bra.s	loc_158968
loc_15890E:
	movea.l	-$165A(a5),a3
	move.w	#$4,-$4(a6)
	bra.s	loc_158968
loc_15891A:
	movea.l	$8(a3),a4
	tst.w	$6A(a4)
	bne.s	loc_158966
	cmp.w	$5A(a4),d4
	bgt.s	loc_158966
	cmp.w	$56(a4),d5
	blt.s	loc_158966
	cmp.w	$58(a4),d6
	bgt.s	loc_158966
	cmp.w	$54(a4),d7
	blt.s	loc_158966
	moveq	#-$1,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.w	-$2(a6),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.w	-$4(a6),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.l	a4,-(a7)
	movea.l	$8(a6),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$22(a0),a1
	jsr	(a1)
	lea.l	$18(a7),a7
loc_158966:
	movea.l	(a3),a3
loc_158968:
	move.l	a3,d0
	bne.s	loc_15891A
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	move.l	$8(a6),-(a7)
	jsr	sub_158610(pc)
	lea.l	$14(a7),a7
	movem.l	-$24(a6),d4-d7/a3-a4
	unlk	a6
	rts
