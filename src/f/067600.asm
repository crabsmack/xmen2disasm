; ---------------------------------------------------------------------------
; sub_067600	[link-after-rts]
; ---------------------------------------------------------------------------
sub_067600:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8C(a4),-(a7)
	jsr	sub_06489A(pc)
	move.l	d0,$30(a4)
	addq.w	#$4,a7
	beq.s	loc_06762C
	move.l	$8C(a4),-(a7)
	jsr	sub_064912(pc)
	move.w	d0,$A4(a4)
	addq.w	#$4,a7
	bra.s	loc_067632
loc_06762C:
	move.w	#$FF,$A4(a4)
loc_067632:
	move.b	$A5(a4),$2F(a4)
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$3F(a0),d0
	cmpi.w	#$1,d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_067650
	moveq	#$48,d0
	bra.s	loc_067656
loc_067650:
	move.l	#$F8,d0
loc_067656:
	moveq	#$0,d1
	move.b	d0,d1
	move.w	d1,$A2(a4)
	move.l	a4,-(a7)
	jsr	sub_067376(pc)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	$34(a4),d1
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$3,d1
	and.b	$2E(a4),d1
	moveq	#$0,d2
	move.b	d1,d2
	move.l	d2,-(a7)
	move.w	$A4(a4),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.l	$30(a4),-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	pea.l	$2E(a4)
	jsr	$506A(a5)	; -> Spr_Init
	cmpi.w	#$F8,$A2(a4)
	lea.l	$20(a7),a7
	bne.s	loc_0676A8
	ori.b	#$10,$2E(a4)
	bra.s	loc_0676AE
loc_0676A8:
	andi.b	#$EF,$2E(a4)
loc_0676AE:
	move.w	$A2(a4),d0
	ext.l	d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	add.l	d0,d1
	lsl.l	#$8,d1
	move.l	d1,$8(a4)
	move.w	g_CameraY(a5),d0
	ext.l	d0
	add.l	#$AE,d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	clr.w	$6C(a4)
	lea.l	sub_0676F0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
