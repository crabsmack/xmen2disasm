; ---------------------------------------------------------------------------
; sub_02DCE4	[link-after-rts]
; ---------------------------------------------------------------------------
sub_02DCE4:
	link.w	a6,#$0
	movem.l	d5-d7/a4,-(a7)
	moveq	#$18,d6
	pea.l	($E2).w
	jsr	$5222(a5)	; -> sub_1FE5A2
	pea.l	($E2).w
	jsr	$521A(a5)	; -> sub_1FE584
	tst.b	$B(a6)
	beq.s	loc_02DD0C
	moveq	#$2,d7
	move.w	-$3AA8(a5),d5
	bra.s	loc_02DD14
loc_02DD0C:
	moveq	#$6,d7
	move.w	-$3AA8(a5),d5
	addq.w	#$2,d5
loc_02DD14:
	ext.l	d6
	movea.l	-$3A72(a5),a0
	move.l	d6,d0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	ext.l	d7
	add.l	d7,d0
	movea.l	-$3A84(a5),a0
	add.l	d0,d0
	lea.l	(a0,d0.l),a4
	move.w	#$27,(a4)
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	jsr	$3FD2(a5)	; -> sub_15D7D8
	addq.w	#$1,d7
	ext.l	d6
	movea.l	-$3A72(a5),a0
	move.l	d6,d0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	ext.l	d7
	add.l	d7,d0
	movea.l	-$3A84(a5),a0
	add.l	d0,d0
	lea.l	(a0,d0.l),a4
	move.w	d5,(a4)
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	jsr	$3FD2(a5)	; -> sub_15D7D8
	addq.w	#$1,d7
	ext.l	d6
	movea.l	-$3A72(a5),a0
	move.l	d6,d0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	ext.l	d7
	add.l	d7,d0
	movea.l	-$3A84(a5),a0
	add.l	d0,d0
	lea.l	(a0,d0.l),a4
	move.w	d5,d0
	addq.w	#$1,d0
	move.w	d0,(a4)
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	jsr	$3FD2(a5)	; -> sub_15D7D8
	addq.w	#$1,d7
	ext.l	d6
	movea.l	-$3A72(a5),a0
	move.l	d6,d0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	ext.l	d7
	add.l	d7,d0
	movea.l	-$3A84(a5),a0
	add.l	d0,d0
	lea.l	(a0,d0.l),a4
	move.w	#$28,(a4)
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	jsr	$3FD2(a5)	; -> sub_15D7D8
	movem.l	-$10(a6),d5-d7/a4
	unlk	a6
	rts
