; ---------------------------------------------------------------------------
; sub_1F35DC	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1F35DC:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.b	$9D(a4),d0
	ext.w	d0
	ext.l	d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F3604
	move.w	g_Pad1Released(a5),d0
	or.w	g_Pad1Pressed(a5),d0
	moveq	#$7F,d1
	and.w	d0,d1
	bra.s	loc_1F3610
loc_1F3604:
	move.w	g_Pad2Released(a5),d0
	or.w	g_Pad2Pressed(a5),d0
	moveq	#$7F,d1
	and.w	d0,d1
loc_1F3610:
	bne.s	loc_1F361C
	move.w	#$1000,d0
	and.w	$4(a4),d0
	beq.s	loc_1F3630
loc_1F361C:
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.s	loc_1F3644
loc_1F3630:
	movea.l	$8C(a4),a0
	movea.l	a0,a1
	adda.w	$4A(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
loc_1F3644:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
