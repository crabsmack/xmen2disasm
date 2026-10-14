; ---------------------------------------------------------------------------
; sub_11C7E6	[jt 1573]
; ---------------------------------------------------------------------------
sub_11C7E6:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> sub_1F694A
	movea.l	d0,a3
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	addq.w	#$4,a7
	bge.s	loc_11C81A
	ori.b	#$10,$2E(a4)
	bra.s	loc_11C820
loc_11C81A:
	andi.b	#$EF,$2E(a4)
loc_11C820:
	tst.l	$A8(a4)
	beq.s	loc_11C844
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_11C83A
	movea.l	$A8(a4),a0
	ori.b	#$10,$2E(a0)
	bra.s	loc_11C844
loc_11C83A:
	movea.l	$A8(a4),a0
	andi.b	#$EF,$2E(a0)
loc_11C844:
	tst.l	$98(a4)
	bne.s	loc_11C856
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_11C882
loc_11C856:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_11C86A
	clr.w	$96(a4)
loc_11C86A:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_11C882:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
