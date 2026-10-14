; ---------------------------------------------------------------------------
; sub_1F07CA	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1F07CA:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$C(a6),a4
	move.l	a4,-(a7)
	jsr	sub_1F41C2(pc)
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_1F07FA
	moveq	#$0,d0
	move.w	$C0(a4),d0
	moveq	#$30,d1
	and.w	d0,d1
	lsr.w	#$4,d1
	moveq	#$0,d0
	move.w	d1,d0
	tst.l	d0
	bra.s	loc_1F07FC
loc_1F07FA:
	moveq	#$0,d0
loc_1F07FC:
	move.w	d0,d7
	bne.s	loc_1F0804
	moveq	#$1,d0
	bra.s	loc_1F082A
loc_1F0804:
	moveq	#$0,d0
	move.w	d7,d0
	moveq	#$2,d1
	cmp.l	d0,d1
	beq.s	loc_1F0818
	moveq	#$0,d0
	move.w	d7,d0
	moveq	#$3,d1
	cmp.l	d0,d1
	bne.s	loc_1F0822
loc_1F0818:
	move.l	a3,-(a7)
	jsr	sub_1F41C2(pc)
	addq.w	#$4,a7
	bra.s	loc_1F082A
loc_1F0822:
	move.l	a3,-(a7)
	jsr	sub_1F426C(pc)
	addq.w	#$4,a7
loc_1F082A:
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
