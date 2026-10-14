; ---------------------------------------------------------------------------
; sub_0DC638	[jt 1158]
; ---------------------------------------------------------------------------
sub_0DC638:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$246A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	move.w	$2(a3),$10(a4)
	move.w	$4(a3),$12(a4)
	lea.l	sub_0DC7D0(pc),a0
	move.l	a0,$5C(a4)
	lea.l	sub_0DC7D0(pc),a0
	move.l	a0,$64(a4)
	ori.w	#$83,$6(a4)
	move.w	-$3BF4(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E5A(a5)	; -> sub_1F6334
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$0,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	lea.l	$18(a7),a7
	bne.s	loc_0DC6E4
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_0DC6DC
	ori.b	#$4,$2E(a4)
	bra.s	loc_0DC72A
loc_0DC6DC:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_0DC72A
loc_0DC6E4:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0DC714
	moveq	#$4,d0
	and.b	-$181A(a5),d0
	beq.s	loc_0DC70C
	ori.b	#$4,$2E(a4)
	bra.s	loc_0DC72A
loc_0DC70C:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_0DC72A
loc_0DC714:
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_0DC724
	ori.b	#$4,$2E(a4)
	bra.s	loc_0DC72A
loc_0DC724:
	andi.b	#$FB,$2E(a4)
loc_0DC72A:
	move.w	$6(a3),$8C(a4)
	move.w	$4(a3),$92(a4)
	move.w	$8(a3),d7
	beq.s	loc_0DC740
	move.w	d7,d0
	bra.s	loc_0DC742
loc_0DC740:
	moveq	#$4,d0
loc_0DC742:
	move.w	d0,$8E(a4)
	ext.l	d0
	lsl.l	#$5,d0
	move.w	$92(a4),d1
	sub.w	d0,d1
	move.w	d1,$94(a4)
	clr.w	$90(a4)
	clr.b	$96(a4)
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
